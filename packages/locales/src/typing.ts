export type SupportedLanguagesType = 'en-US' | 'ko-KR' | 'zh-CN';

export type ImportLocaleFn = () => Promise<{ default: Record<string, string> }>;

export type LoadMessageFn = (
  lang: SupportedLanguagesType,
) => Promise<Record<string, string> | undefined>;

export interface LocaleSetupOptions {
  /**
   * 기본 언어
   * @default ko-KR
   */
  defaultLocale?: SupportedLanguagesType;
  /**
   * 언어팩 로드 함수
   * @param lang
   * @returns
   */
  loadMessages?: LoadMessageFn;
  /**
   * 키를 찾을 수 없을 때 경고 표시 여부
   */
  missingWarn?: boolean;
}
