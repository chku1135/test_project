<script lang="ts" setup>
import { Page } from '@vben/common-ui';

import { Button, Card, message, notification, Space } from 'ant-design-vue';

type NotificationType = 'error' | 'info' | 'success' | 'warning';

function info() {
  message.info('How many roads must a man walk down');
}

function error() {
  message.error({
    content: 'Once upon a time you dressed so fine',
    duration: 2500,
  });
}

function warning() {
  message.warning('How many roads must a man walk down');
}
function success() {
  message.success('Cause you walked hand in hand With another man in my place');
}

function notify(type: NotificationType) {
  notification[type]({
    duration: 2500,
    message: '알림 메시지', // 기존: 说点啥呢
    type,
  });
}
</script>

<template>
  <Page
    description="다국어 지원, 테마 전환 기능 통합 등"
    title="Ant Design Vue 컴포넌트 사용 데모"
  >
    <!-- 기존 description: 支持多语言，主题功能集成切换等 -->
    <!-- 기존 title: Ant Design Vue组件使用演示 -->
    <Card class="mb-5" title="버튼">
      <!-- 기존 title: 按钮 -->
      <Space>
        <Button>Default</Button>
        <Button type="primary"> Primary </Button>
        <Button> Info </Button>
        <Button danger> Error </Button>
      </Space>
    </Card>
    <Card class="mb-5" title="Message">
      <Space>
        <Button @click="info"> 정보 </Button>
        <!-- 기존: 信息 -->
        <Button danger @click="error"> 에러 </Button>
        <!-- 기존: 错误 -->
        <Button @click="warning"> 경고 </Button>
        <!-- 기존: 警告 -->
        <Button @click="success"> 성공 </Button>
        <!-- 기존: 成功 -->
      </Space>
    </Card>

    <Card class="mb-5" title="Notification">
      <Space>
        <Button @click="notify('info')"> 정보 </Button>
        <!-- 기존: 信息 -->
        <Button danger @click="notify('error')"> 에러 </Button>
        <!-- 기존: 错误 -->
        <Button @click="notify('warning')"> 경고 </Button>
        <!-- 기존: 警告 -->
        <Button @click="notify('success')"> 성공 </Button>
        <!-- 기존: 成功 -->
      </Space>
    </Card>
  </Page>
</template>
