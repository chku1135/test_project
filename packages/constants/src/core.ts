/**
 * 로그인 페이지 URL 주소
 */
export const LOGIN_PATH = '/auth/login';

export interface LanguageOption {
  label: string;
  value: 'en-US' | 'ko-KR';
}

/**
 * 지원되는 언어 목록
 */
export const SUPPORT_LANGUAGES: LanguageOption[] = [
  {
    label: '한국어',
    value: 'ko-KR',
  },
  {
    label: 'English',
    value: 'en-US',
  },
];
