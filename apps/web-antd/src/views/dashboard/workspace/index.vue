<script lang="ts" setup>
import type {
  WorkbenchProjectItem,
  WorkbenchQuickNavItem,
  WorkbenchTodoItem,
  WorkbenchTrendItem,
} from '@vben/common-ui';

import { ref } from 'vue';
import { useRouter } from 'vue-router';

import {
  AnalysisChartCard,
  WorkbenchHeader,
  WorkbenchProject,
  WorkbenchQuickNav,
  WorkbenchTodo,
  WorkbenchTrends,
} from '@vben/common-ui';
import { preferences } from '@vben/preferences';
import { useUserStore } from '@vben/stores';
import { openWindow } from '@vben/utils';

import AnalyticsVisitsSource from '../analytics/analytics-visits-source.vue';

const userStore = useUserStore();

// 샘플 데이터입니다. 실제 프로젝트에서는 상황에 맞게 조정이 필요합니다.
// url은 내부 라우트일 수도 있으며, navTo 메서드에서 식별하여 내부 이동을 처리합니다.
// 예: url: /dashboard/workspace
const projectItems: WorkbenchProjectItem[] = [
  {
    color: '',
    content: '기회를 기다리지 말고, 기회를 만드세요.', // 기존: 不要等待机会，而要创造机会。
    date: '2021-04-01',
    group: '오픈소스팀', // 기존: 开源组
    icon: 'carbon:logo-github',
    title: 'Github',
    url: 'https://github.com',
  },
  {
    color: '#3fb27f',
    content: '현재의 당신이 미래의 당신을 결정합니다.', // 기존: 现在的你决定将来的你。
    date: '2021-04-01',
    group: '알고리즘팀', // 기존: 算法组
    icon: 'ion:logo-vue',
    title: 'Vue',
    url: 'https://vuejs.org',
  },
  {
    color: '#e18525',
    content: '노력보다 더 중요한 재능은 없습니다.', // 기존: 没有什么才能比努力更重要。
    date: '2021-04-01',
    group: '프론트엔드팀', // 기존: 上班摸鱼
    icon: 'ion:logo-html5',
    title: 'Html5',
    url: 'https://developer.mozilla.org/zh-CN/docs/Web/HTML',
  },
  {
    color: '#bf0c2c',
    content: '열정과 욕망은 모든 난관을 극복할 수 있습니다.', // 기존: 热情和欲望可以突破一切难关。
    date: '2021-04-01',
    group: 'UI팀', // 기존: UI
    icon: 'ion:logo-angular',
    title: 'Angular',
    url: 'https://angular.io',
  },
  {
    color: '#00d8ff',
    content: '건강한 신체는 목표 실현의 초석입니다.', // 기존: 健康的身体是实现目标的基石。
    date: '2021-04-01',
    group: '기술팀', // 기존: 技术牛
    icon: 'bx:bxl-react',
    title: 'React',
    url: 'https://reactjs.org',
  },
  {
    color: '#EBD94E',
    content: '길은 걷는 자의 것이지, 공상하는 자의 것이 아닙니다.', // 기존: 路是走出来的，而不是空想出来的。
    date: '2021-04-01',
    group: '아키텍처팀', // 기존: 架构组
    icon: 'ion:logo-javascript',
    title: 'Js',
    url: 'https://developer.mozilla.org/zh-CN/docs/Web/JavaScript',
  },
];

// 마찬가지로 여기서의 url도 http로 시작하는 외부 링크를 사용할 수 있습니다.
const quickNavItems: WorkbenchQuickNavItem[] = [
  {
    color: '#1fdaca',
    icon: 'ion:home-outline',
    title: '홈', // 기존: 首页
    url: '/',
  },
  {
    color: '#bf0c2c',
    icon: 'ion:grid-outline',
    title: '대시보드', // 기존: 仪表盘
    url: '/dashboard',
  },
  {
    color: '#e18525',
    icon: 'ion:layers-outline',
    title: '컴포넌트', // 기존: 组件
    url: '/demos/features/icons',
  },
  {
    color: '#3fb27f',
    icon: 'ion:settings-outline',
    title: '시스템 관리', // 기존: 系统管理
    url: '/demos/features/login-expired',
  },
  {
    color: '#4daf1bc9',
    icon: 'ion:key-outline',
    title: '권한 관리', // 기존: 权限管理
    url: '/demos/access/page-control',
  },
  {
    color: '#00d8ff',
    icon: 'ion:bar-chart-outline',
    title: '차트', // 기존: 图表
    url: '/analytics',
  },
];

const todoItems = ref<WorkbenchTodoItem[]>([
  {
    completed: false,
    content: `최근 Git 저장소에 제출된 프론트엔드 코드를 검토하여 품질과 규격이 맞는지 확인하세요.`, // 기존: 审查最近提交到Git仓库的前端代码，确保代码质量和规范。
    date: '2024-07-30 11:00:00',
    title: '프론트엔드 코드 검토', // 기존: 审查前端代码提交
  },
  {
    completed: true,
    content: `시스템 성능을 점검하고 최적화하여 CPU 사용량을 줄이세요.`, // 기존: 检查并优化系统性能，降低CPU使用率。
    date: '2024-07-30 11:00:00',
    title: '시스템 성능 최적화', // 기존: 系统性能优化
  },
  {
    completed: false,
    content: `보안 취약점이나 미승인 접근이 없는지 시스템 보안 검사를 실시하세요.`, // 기존: 进行系统安全检查，确保没有安全漏洞或未授权的访问。
    date: '2024-07-30 11:00:00',
    title: '보안 검사', // 기존: 安全检查
  },
  {
    completed: false,
    content: `프로젝트의 모든 npm 종속 패키지를 최신 버전으로 업데이트하세요.`, // 기존: 更新项目中的所有npm依赖包，确保使用最新版本。
    date: '2024-07-30 11:00:00',
    title: '의존성 업데이트', // 기존: 更新项目依赖
  },
  {
    completed: false,
    content: `사용자가 보고한 UI 표시 오류를 수정하여 브라우저 간 일관성을 확보하세요.`, // 기존: 修复用户报告的页面UI显示问题，确保在不同浏览器中显示一致。
    date: '2024-07-30 11:00:00',
    title: 'UI 오류 수정', // 기존: 修复UI显示问题
  },
]);
const trendItems: WorkbenchTrendItem[] = [
  {
    avatar: 'svg:avatar-1',
    content: `<a>오픈소스팀</a>에서 프로젝트 <a>Vue</a>를 생성했습니다.`, // 기존: 在 开源组 创建了项目 Vue
    date: '방금 전', // 기존: 刚刚
    title: '윌리엄', // 기존: 威廉
  },
  {
    avatar: 'svg:avatar-2',
    content: `<a>윌리엄</a>님을 팔로우했습니다.`, // 기존: 关注了 威廉
    date: '1시간 전', // 기존: 1个小时前
    title: '이반', // 기존: 艾文
  },
  {
    avatar: 'svg:avatar-3',
    content: `<a>개인 동태</a>를 게시했습니다.`, // 기존: 发布了 个人动态
    date: '1일 전', // 기존: 1天前
    title: '크리스', // 기존: 克里斯
  },
  {
    avatar: 'svg:avatar-4',
    content: `새 글 <a>Vite 플러그인 작성 방법</a>을 게시했습니다.`, // 기존: 发表文章 如何编写一个Vite插件
    date: '2일 전', // 기존: 2天前
    title: 'Vben',
  },
  {
    avatar: 'svg:avatar-1',
    content: `<a>잭</a>님의 질문 <a>프로젝트 최적화 방법은?</a>에 답변했습니다.`, // 기존: 回复了 杰克 的问题 如何进行项目优化？
    date: '3일 전', // 기존: 3天前
    title: '피터', // 기존: 皮特
  },
  {
    avatar: 'svg:avatar-2',
    content: `이슈 <a>프로젝트 실행 방법</a>을 닫았습니다.`, // 기존: 关闭了问题 如何运行项目
    date: '1주 전', // 기존: 1周前
    title: '잭', // 기존: 杰克
  },
  {
    avatar: 'svg:avatar-3',
    content: `<a>개인 동태</a>를 게시했습니다.`, // 기존: 发布了 个人动态
    date: '1주 전', // 기존: 1周前
    title: '윌리엄', // 기존: 威廉
  },
  {
    avatar: 'svg:avatar-4',
    content: `<a>Github</a>에 코드를 푸시했습니다.`, // 기존: 推送了代码到 Github
    date: '2021-04-01 20:00',
    title: '윌리엄', // 기존: 威廉
  },
  {
    avatar: 'svg:avatar-4',
    content: `새 글 <a>Admin Vben 사용 방법</a>을 게시했습니다.`, // 기존: 发表文章 如何编写使用 Admin Vben
    date: '2021-03-01 20:00',
    title: 'Vben',
  },
];

const router = useRouter();

// 샘플 메서드입니다. 실제 프로젝트 요구사항에 맞게 조정하세요.
function navTo(nav: WorkbenchProjectItem | WorkbenchQuickNavItem) {
  if (nav.url?.startsWith('http')) {
    openWindow(nav.url);
    return;
  }
  if (nav.url?.startsWith('/')) {
    router.push(nav.url).catch((error) => {
      console.error('Navigation failed:', error);
    });
  } else {
    console.warn(`Unknown URL for navigation item: ${nav.title} -> ${nav.url}`);
  }
}
</script>

<template>
  <div class="p-5">
    <WorkbenchHeader
      :avatar="userStore.userInfo?.avatar || preferences.app.defaultAvatar"
    >
      <template #title>
        좋은 아침입니다, {{ userStore.userInfo?.realName }}님, 오늘의 업무를 시작해 볼까요!
        <!-- 기존: 早安, ..., 开始您一天的工作吧！ -->
      </template>
      <template #description> 오늘 날씨는 맑음, 20℃ - 32℃입니다! </template>
      <!-- 기존: 今日晴，20℃ - 32℃！ -->
    </WorkbenchHeader>

    <div class="mt-5 flex flex-col lg:flex-row">
      <div class="mr-4 w-full lg:w-3/5">
        <WorkbenchProject :items="projectItems" title="프로젝트" @click="navTo" />
        <!-- 기존: 项目 -->
        <WorkbenchTrends :items="trendItems" class="mt-5" title="최신 동태" />
        <!-- 기존: 最新动态 -->
      </div>
      <div class="w-full lg:w-2/5">
        <WorkbenchQuickNav
          :items="quickNavItems"
          class="mt-5 lg:mt-0"
          title="빠른 메뉴"
          @click="navTo"
        />
        <!-- 기존: 快捷导航 -->
        <WorkbenchTodo :items="todoItems" class="mt-5" title="할 일 목록" />
        <!-- 기존: 待办事项 -->
        <AnalysisChartCard class="mt-5" title="방문 출처">
          <!-- 기존: 访问来源 -->
          <AnalyticsVisitsSource />
        </AnalysisChartCard>
      </div>
    </div>
  </div>
</template>
