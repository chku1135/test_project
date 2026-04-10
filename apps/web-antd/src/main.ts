import { initPreferences } from '@vben/preferences';
import { unmountGlobalLoading } from '@vben/utils';

import { overridesPreferences } from './preferences';

/**
 * 애플리케이션 초기화가 완료된 후 페이지 로딩 및 렌더링을 진행합니다.
 */
async function initApplication() {
  // name은 프로젝트의 고유 식별자를 지정하는 데 사용됩니다.
  // 서로 다른 프로젝트의 환경 설정, 데이터 저장 키 접두사 및 격리가 필요한 기타 데이터를 구분하는 데 사용됩니다.
  const env = import.meta.env.PROD ? 'prod' : 'dev';
  const appVersion = import.meta.env.VITE_APP_VERSION;
  const namespace = `${import.meta.env.VITE_APP_NAMESPACE}-${appVersion}-${env}`;

  // 앱 환경 설정(Preferences) 초기화
  await initPreferences({
    namespace,
    overrides: overridesPreferences,
  });

  // 애플리케이션 시작 및 마운트
  // Vue 애플리케이션의 주요 로직 및 뷰
  const { bootstrap } = await import('./bootstrap');
  await bootstrap(namespace);

  // 전역 로딩(Loading) 표시 제거 및 파괴
  unmountGlobalLoading();
}

initApplication();
