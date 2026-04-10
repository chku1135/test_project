<div align="center">
  <h1>Vue Korean Project</h1>

[![license](https://img.shields.io/github/license/chku1135/test_project.svg)](LICENSE)

</div>

## 소개

**Vue Korean Project**는 [Vben Admin v5](https://github.com/vbenjs/vue-vben-admin)를 기반으로 한 한국어 최적화 관리자 템플릿입니다. 중국어 기반의 원본 프로젝트를 한국 개발 환경에 맞게 로컬라이징하였으며, 최신 `Vue 3`, `Vite`, `TypeScript` 및 `Ant Design Vue`를 사용하여 구축되었습니다.

## 주요 변경 사항 (Localization)

- **한국어 기본 설정**: 프로젝트의 기본 언어를 `ko-KR`로 설정 완료.
- **한글 주석 적용**: 핵심 로직(`main.ts`, `bootstrap.ts`, `adapter`, `router` 등)의 중국어 주석을 모두 한글로 번역 및 보완.
- **언어 옵션 최적화**: 헤더의 언어 전환 메뉴에서 중국어를 제거하고 **한국어/영어** 옵션만 제공.
- **Monorepo 아키텍처**: pnpm workspace 기반의 효율적인 패키지 관리 구조 유지.

## 특징

- **최신 기술 스택**: Vue 3, Vite, TypeScript, Tailwind CSS 기반의 고성능 환경.
- **Ant Design Vue**: 기업용 애플리케이션에 최적화된 UI 컴포넌트 라이브러리 사용.
- **국제화(i18n)**: 한국어와 영어를 완벽하게 지원하는 멀티 언어 시스템 내장.
- **권한 관리(RBAC)**: 사용자 역할별 동적 메뉴 및 라우트 생성 솔루션 제공.
- **다양한 예제**: 대시보드, 시스템 관리, 컴포넌트 활용 등 풍부한 데모 포함.

## 시작하기

### 1. 소스 코드 가져오기

```bash
git clone https://github.com/chku1135/test_project.git
```

### 2. 의존성 설치

```bash
cd vue_project_kr
# corepack 활성화 (필요한 경우)
corepack enable
pnpm install
```

### 3. 개발 서버 실행

```bash
pnpm dev
```

### 4. 빌드

```bash
pnpm build
```

## 프로젝트 구조 (Architecture)

- **`apps/web-antd`**: Ant Design Vue 기반의 메인 애플리케이션.
- **`packages/`**: 모든 앱에서 공유하는 핵심 라이브러리.
  - `@vben/locales`: 다국어 관리 및 한국어 언어팩.
  - `@vben/preferences`: 프로젝트 환경 설정(테마, 언어 등) 엔진.
  - `@vben/access`: 권한 가드 및 RBAC 로직.
- **`internal/`**: 빌드 설정, 린트(Lint) 설정 등 내부 도구.

## 커밋 컨벤션 (Commit Convention)

이 프로젝트는 `commitlint`를 통해 **Conventional Commits** 규격을 강제합니다.

- `feat`: 새로운 기능 추가
- `fix`: 버그 수정
- `docs`: 문서 변경
- `style`: 코드 포맷팅 (로직 변경 없음)
- `refactor`: 코드 리팩토링
- `test`: 테스트 추가 및 수정
- `chore`: 빌드 업무, 패키지 매니저 설정 등 (소스 변경 없음)

## 브라우저 지원

- 로컬 개발 환경으로 **Chrome 80+** 브라우저를 권장합니다.
- 모던 브라우저를 지원하며, IE는 지원하지 않습니다.

## 라이선스

[MIT © Vben-2020](./LICENSE)
