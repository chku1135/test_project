import { defineOverridesPreferences } from '@vben/preferences';

/**
 * @description 프로젝트 설정 파일
 * 프로젝트에서 필요한 일부분의 설정만 덮어쓰기하면 되며, 필요하지 않은 설정은 덮어쓰지 않아도 됩니다. 
 * 자동으로 기본 설정이 사용됩니다.
 * !!! 설정을 변경한 후에는 캐시를 삭제해야 변경 사항이 적용될 수 있습니다.
 */
export const overridesPreferences = defineOverridesPreferences({
  // overrides
  app: {
    name: import.meta.env.VITE_APP_TITLE,
    locale: 'ko-KR',
  },
});
