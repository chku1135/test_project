import { createApp, watchEffect } from 'vue';

import { registerAccessDirective } from '@vben/access';
import { registerLoadingDirective } from '@vben/common-ui/es/loading';
import { preferences } from '@vben/preferences';
import { initStores } from '@vben/stores';
import '@vben/styles';
import '@vben/styles/antd';

import { useTitle } from '@vueuse/core';

import { $t, setupI18n } from '#/locales';

import { initComponentAdapter } from './adapter/component';
import { initSetupVbenForm } from './adapter/form';
import App from './app.vue';
import { router } from './router';

async function bootstrap(namespace: string) {
  // 컴포넌트 어댑터 초기화
  await initComponentAdapter();

  // 폼(Form) 컴포넌트 초기화
  await initSetupVbenForm();

  // // 모달(Modal)의 기본 속성 설정
  // setDefaultModalProps({
  //   fullscreenButton: false,
  // });
  // // 드로어(Drawer)의 기본 속성 설정
  // setDefaultDrawerProps({
  //   zIndex: 1020,
  // });

  const app = createApp(App);

  // v-loading 지시어 등록
  registerLoadingDirective(app, {
    loading: 'loading', // 지시어 이름을 사용자 정의할 수 있으며, false를 제공하면 등록하지 않습니다.
    spinning: 'spinning',
  });

  // 국제화(i18n) 설정
  await setupI18n(app);

  // pinia 스토어 설정
  await initStores(app, { namespace });

  // 권한(Access) 지시어 설치
  registerAccessDirective(app);

  // tippy 초기화
  const { initTippy } = await import('@vben/common-ui/es/tippy');
  initTippy(app);

  // 라우터 및 라우터 가드 설정
  app.use(router);

  // Motion 플러그인 설정
  const { MotionPlugin } = await import('@vben/plugins/motion');
  app.use(MotionPlugin);

  // 동적 제목 업데이트
  watchEffect(() => {
    if (preferences.app.dynamicTitle) {
      const routeTitle = router.currentRoute.value.meta?.title;
      const pageTitle =
        (routeTitle ? `${$t(routeTitle)} - ` : '') + preferences.app.name;
      useTitle(pageTitle);
    }
  });

  app.mount('#app');
}

export { bootstrap };
