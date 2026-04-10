import type { Router } from 'vue-router';

import { LOGIN_PATH } from '@vben/constants';
import { preferences } from '@vben/preferences';
import { useAccessStore, useUserStore } from '@vben/stores';
import { startProgress, stopProgress } from '@vben/utils';

import { accessRoutes, coreRouteNames } from '#/router/routes';
import { useAuthStore } from '#/store';

import { generateAccess } from './access';

/**
 * 공통 가드(Guard) 설정
 * @param router
 */
function setupCommonGuard(router: Router) {
  // 이미 로드된 페이지 기록
  const loadedPaths = new Set<string>();

  router.beforeEach((to) => {
    to.meta.loaded = loadedPaths.has(to.path);

    // 페이지 로딩 진행바 표시
    if (!to.meta.loaded && preferences.transition.progress) {
      startProgress();
    }
    return true;
  });

  router.afterEach((to) => {
    // 페이지 로드 여부 기록. 이미 로드된 경우 이후의 페이지 전환 애니메이션 등의 효과를 중복 실행하지 않음
    loadedPaths.add(to.path);

    // 페이지 로딩 진행바 닫기
    if (preferences.transition.progress) {
      stopProgress();
    }
  });
}

/**
 * 권한 접근 가드(Guard) 설정
 * @param router
 */
function setupAccessGuard(router: Router) {
  router.beforeEach(async (to, from) => {
    const accessStore = useAccessStore();
    const userStore = useUserStore();
    const authStore = useAuthStore();

    // 기본 라우트들은 권한 가로채기가 필요 없음
    if (coreRouteNames.includes(to.name as string)) {
      if (to.path === LOGIN_PATH && accessStore.accessToken) {
        return decodeURIComponent(
          (to.query?.redirect as string) ||
            userStore.userInfo?.homePath ||
            preferences.app.defaultHomePath,
        );
      }
      return true;
    }

    // accessToken 확인
    if (!accessStore.accessToken) {
      // 권한 무시가 명시된 경우 접근 허용
      if (to.meta.ignoreAccess) {
        return true;
      }

      // 접근 권한이 없는 경우 로그인 페이지로 이동
      if (to.fullPath !== LOGIN_PATH) {
        return {
          path: LOGIN_PATH,
          // 필요한 경우 query 삭제 가능
          query:
            to.fullPath === preferences.app.defaultHomePath
              ? {}
              : { redirect: encodeURIComponent(to.fullPath) },
          // 현재 이동하려던 페이지 정보를 가지고 로그인 후 다시 해당 페이지로 이동
          replace: true,
        };
      }
      return to;
    }

    // 동적 라우트가 이미 생성되었는지 확인
    if (accessStore.isAccessChecked) {
      return true;
    }

    // 라우트 테이블 생성
    // 현재 로그인한 사용자가 가진 역할(Role) 식별자 목록
    const userInfo = userStore.userInfo || (await authStore.fetchUserInfo());
    const userRoles = userInfo.roles ?? [];

    // 메뉴 및 라우트 생성
    const { accessibleMenus, accessibleRoutes } = await generateAccess({
      roles: userRoles,
      router,
      // 메뉴에는 표시되지만 접근 시 403으로 리다이렉트됨
      routes: accessRoutes,
    });

    // 메뉴 및 라우트 정보 저장
    accessStore.setAccessMenus(accessibleMenus);
    accessStore.setAccessRoutes(accessibleRoutes);
    accessStore.setIsAccessChecked(true);
    const redirectPath = (from.query.redirect ??
      (to.path === preferences.app.defaultHomePath
        ? userInfo.homePath || preferences.app.defaultHomePath
        : to.fullPath)) as string;

    return {
      ...router.resolve(decodeURIComponent(redirectPath)),
      replace: true,
    };
  });
}

/**
 * 프로젝트 가드(Guard) 설정 생성
 * @param router
 */
function createRouterGuard(router: Router) {
  /** 공통 */
  setupCommonGuard(router);
  /** 권한 접근 */
  setupAccessGuard(router);
}

export { createRouterGuard };
