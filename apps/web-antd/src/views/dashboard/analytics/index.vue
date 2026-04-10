<script lang="ts" setup>
import type { AnalysisOverviewItem } from '@vben/common-ui';
import type { TabOption } from '@vben/types';

import {
  AnalysisChartCard,
  AnalysisChartsTabs,
  AnalysisOverview,
} from '@vben/common-ui';
import {
  SvgBellIcon,
  SvgCakeIcon,
  SvgCardIcon,
  SvgDownloadIcon,
} from '@vben/icons';

import AnalyticsTrends from './analytics-trends.vue';
import AnalyticsVisitsData from './analytics-visits-data.vue';
import AnalyticsVisitsSales from './analytics-visits-sales.vue';
import AnalyticsVisitsSource from './analytics-visits-source.vue';
import AnalyticsVisits from './analytics-visits.vue';

const overviewItems: AnalysisOverviewItem[] = [
  {
    icon: SvgCardIcon,
    title: '사용자 수', // 기존: 用户量 (사용자 수로 변경)
    totalTitle: '총 사용자 수', // 기존: 总用户量 (총 사용자 수로 변경)
    totalValue: 120_000,
    value: 2000,
  },
  {
    icon: SvgCakeIcon,
    title: '방문 횟수', // 기존: 访问量 (방문 횟수로 변경)
    totalTitle: '총 방문 횟수', // 기존: 总访问量 (총 방문 횟수로 변경)
    totalValue: 500_000,
    value: 20_000,
  },
  {
    icon: SvgDownloadIcon,
    title: '다운로드 수', // 기존: 下载量 (다운로드 수로 변경)
    totalTitle: '총 다운로드 수', // 기존: 总下载量 (총 다운로드 수로 변경)
    totalValue: 120_000,
    value: 8000,
  },
  {
    icon: SvgBellIcon,
    title: '사용량', // 기존: 使用量 (사용량으로 변경)
    totalTitle: '총 사용량', // 기존: 总使用量 (총 사용량으로 변경)
    totalValue: 50_000,
    value: 5000,
  },
];

const chartTabs: TabOption[] = [
  {
    label: '트래픽 추세', // 기존: 流量趋势 (트래픽 추세로 변경)
    value: 'trends',
  },
  {
    label: '월간 방문 횟수', // 기존: 月访问量 (월간 방문 횟수로 변경)
    value: 'visits',
  },
];
</script>

<template>
  <div class="p-5">
    <AnalysisOverview :items="overviewItems" />
    <AnalysisChartsTabs :tabs="chartTabs" class="mt-5">
      <template #trends>
        <AnalyticsTrends />
      </template>
      <template #visits>
        <AnalyticsVisits />
      </template>
    </AnalysisChartsTabs>

    <div class="mt-5 w-full md:flex">
      <AnalysisChartCard class="mt-5 md:mt-0 md:mr-4 md:w-1/3" title="방문 수">
        <!-- 기존: 访问数量 (방문 수로 변경) -->
        <AnalyticsVisitsData />
      </AnalysisChartCard>
      <AnalysisChartCard class="mt-5 md:mt-0 md:mr-4 md:w-1/3" title="방문 출처">
        <!-- 기존: 访问来源 (방문 출처로 변경) -->
        <AnalyticsVisitsSource />
      </AnalysisChartCard>
      <AnalysisChartCard class="mt-5 md:mt-0 md:w-1/3" title="방문 출처">
        <!-- 기존: 访问来源 (방문 출처로 변경) -->
        <AnalyticsVisitsSales />
      </AnalysisChartCard>
    </div>
  </div>
</template>
