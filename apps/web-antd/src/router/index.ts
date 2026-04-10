import {
  createRouter,
  createWebHashHistory,
  createWebHistory,
} from 'vue-router';

import { resetStaticRoutes } from '@vben/utils';

import { createRouterGuard } from './guard';
import { routes } from './routes';

/**
 * Vue Router 인스턴스를 생성합니다.
 */
const router = createRouter({
  history:
    import.meta.env.VITE_ROUTER_HISTORY === 'hash'
      ? createWebHashHistory(import.meta.env.VITE_BASE)
      : createWebHistory(import.meta.env.VITE_BASE),
  // 라우터에 추가될 초기 라우트 목록입니다.
  routes,
  scrollBehavior: (to, _from, savedPosition) => {
    if (savedPosition) {
      return savedPosition;
    }
    return to.hash ? { behavior: 'smooth', el: to.hash } : { left: 0, top: 0 };
  },
  // 후행 슬래시 금지 여부 설정
  // strict: true,
});

const resetRoutes = () => resetStaticRoutes(router, routes);

// 라우터 가드(Guard) 생성
createRouterGuard(router);

export { resetRoutes, router };
