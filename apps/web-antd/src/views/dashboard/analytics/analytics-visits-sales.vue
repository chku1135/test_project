<script lang="ts" setup>
import type { EchartsUIType } from '@vben/plugins/echarts';

import { onMounted, ref } from 'vue';

import { EchartsUI, useEcharts } from '@vben/plugins/echarts';

const chartRef = ref<EchartsUIType>();
const { renderEcharts } = useEcharts(chartRef);

onMounted(() => {
  renderEcharts({
    series: [
      {
        animationDelay() {
          return Math.random() * 400;
        },
        animationEasing: 'exponentialInOut',
        animationType: 'scale',
        center: ['50%', '50%'],
        color: ['#5ab1ef', '#b6a2de', '#67e0e3', '#2ec7c9'],
        data: [
          { name: '아웃소싱', value: 500 }, // 기존: 外包
          { name: '맞춤제작', value: 310 }, // 기존: 定制
          { name: '기술지원', value: 274 }, // 기존: 技术支持
          { name: '원격', value: 400 }, // 기존: 远程
        ].toSorted((a, b) => {
          return a.value - b.value;
        }),
        name: '비즈니스 비율', // 기존: 商业占比
        radius: '80%',
        roseType: 'radius',
        type: 'pie',
      },
    ],

    tooltip: {
      trigger: 'item',
    },
  });
});
</script>

<template>
  <EchartsUI ref="chartRef" />
</template>
