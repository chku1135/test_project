<script setup lang="ts">
import type { AboutProps, DescriptionItem } from './about';

import { h } from 'vue';

import {
  VBEN_DOC_URL,
  VBEN_GITHUB_URL,
  VBEN_PREVIEW_URL,
} from '@vben/constants';

import { VbenRenderContent } from '@vben-core/shadcn-ui';

import { Page } from '../../components';

interface Props extends AboutProps {}

defineOptions({
  name: 'AboutUI',
});

withDefaults(defineProps<Props>(), {
  description:
    '은(는) 최신 기술 스택(Vue 3.0, Vite, TailwindCSS, TypeScript 등)을 채택한 현대적이고 즉시 사용 가능한 미들엔드 및 백엔드 솔루션입니다. 엄격한 코드 규격과 풍부한 설정 옵션을 제공하여 중대형 프로젝트 개발을 위한 기성 솔루션 및 다양한 예제를 제공하며, 프론트엔드 기술을 깊이 있게 학습하기에도 매우 훌륭한 예시입니다.',
  // 기존 description: 是一个现代化开箱即用的中后台解决方案...
  name: 'Vben Admin',
  title: '프로젝트 정보', // 기존: 关于项目
});

declare global {
  const __VBEN_ADMIN_METADATA__: {
    authorEmail: string;
    authorName: string;
    authorUrl: string;
    buildTime: string;
    dependencies: Record<string, string>;
    description: string;
    devDependencies: Record<string, string>;
    homepage: string;
    license: string;
    repositoryUrl: string;
    version: string;
  };
}

const renderLink = (href: string, text: string) =>
  h(
    'a',
    { href, target: '_blank', class: 'vben-link' },
    { default: () => text },
  );

const {
  authorEmail,
  authorName,
  authorUrl,
  buildTime,
  dependencies = {},
  devDependencies = {},
  homepage,
  license,
  version,
  // vite inject-metadata 插件注入的全局变量
} = __VBEN_ADMIN_METADATA__ || {};

const vbenDescriptionItems: DescriptionItem[] = [
  {
    content: version,
    title: '버전 번호', // 기존: 版本号
  },
  {
    content: license,
    title: '오픈 소스 라이선스', // 기존: 开源许可协议
  },
  {
    content: buildTime,
    title: '최종 빌드 시간', // 기존: 最后构建时间
  },
  {
    content: renderLink(homepage, '클릭하여 확인'), // 기존: 点击查看
    title: '홈페이지', // 기존: 主页
  },
  {
    content: renderLink(VBEN_DOC_URL, '클릭하여 확인'), // 기존: 点击查看
    title: '문서 주소', // 기존: 文档地址
  },
  {
    content: renderLink(VBEN_PREVIEW_URL, '클릭하여 확인'), // 기존: 点击查看
    title: '미리보기 주소', // 기존: 预览地址
  },
  {
    content: renderLink(VBEN_GITHUB_URL, '클릭하여 확인'), // 기존: 点击查看
    title: 'Github',
  },
  {
    content: h('div', [
      renderLink(authorUrl, `${authorName}  `),
      renderLink(`mailto:${authorEmail}`, authorEmail),
    ]),
    title: '저자', // 기존: 作者
  },
];

const dependenciesItems = Object.keys(dependencies).map((key) => ({
  content: dependencies[key],
  title: key,
}));

const devDependenciesItems = Object.keys(devDependencies).map((key) => ({
  content: devDependencies[key],
  title: key,
}));
</script>

<template>
  <Page :title="title">
    <template #description>
      <p class="mt-3 text-sm/6 text-foreground">
        <a :href="VBEN_GITHUB_URL" class="vben-link" target="_blank">
          {{ name }}
        </a>
        {{ description }}
      </p>
    </template>
    <div class="card-box p-5">
      <div>
        <h5 class="text-lg text-foreground">기본 정보</h5>
        <!-- 기존: 基本信息 -->
      </div>
      <div class="mt-4">
        <dl class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
          <template v-for="item in vbenDescriptionItems" :key="item.title">
            <div class="border-t border-border px-4 py-6 sm:col-span-1 sm:px-0">
              <dt class="text-sm/6 font-medium text-foreground">
                {{ item.title }}
              </dt>
              <dd class="mt-1 text-sm/6 text-foreground sm:mt-2">
                <VbenRenderContent :content="item.content" />
              </dd>
            </div>
          </template>
        </dl>
      </div>
    </div>

    <div class="card-box mt-6 p-5">
      <div>
        <h5 class="text-lg text-foreground">운영 환경 의존성 (Dependencies)</h5>
        <!-- 기존: 生产环境依赖 -->
      </div>
      <div class="mt-4">
        <dl class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
          <template v-for="item in dependenciesItems" :key="item.title">
            <div class="border-t border-border px-4 py-3 sm:col-span-1 sm:px-0">
              <dt class="text-sm text-foreground">
                {{ item.title }}
              </dt>
              <dd class="mt-1 text-sm text-foreground/80 sm:mt-2">
                <VbenRenderContent :content="item.content" />
              </dd>
            </div>
          </template>
        </dl>
      </div>
    </div>
    <div class="card-box mt-6 p-5">
      <div>
        <h5 class="text-lg text-foreground">개발 환경 의존성 (DevDependencies)</h5>
        <!-- 기존: 开发环境依赖 -->
      </div>
      <div class="mt-4">
        <dl class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
          <template v-for="item in devDependenciesItems" :key="item.title">
            <div class="border-t border-border px-4 py-3 sm:col-span-1 sm:px-0">
              <dt class="text-sm text-foreground">
                {{ item.title }}
              </dt>
              <dd class="mt-1 text-sm text-foreground/80 sm:mt-2">
                <VbenRenderContent :content="item.content" />
              </dd>
            </div>
          </template>
        </dl>
      </div>
    </div>
  </Page>
</template>
