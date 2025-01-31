<script setup>
import { computed, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import { storeToRefs } from 'pinia'

import AppFooter from '../layout/AppFooter.vue'
import ULoading from '@/components/ui/ULoading.vue'

import { useAppStore } from '@/store'

// 注意, 如果使用了解构赋值的形式, watch 会失效
// const {
//   label = 'default', // 封面
//   showFooter = true, // 默认显示底部
//   card = false, // 默认不以卡片视图显示
//   loading = false,
//   title = useRoute().meta?.title, // 默认从路由加载 title
// }

const props = defineProps({
// 封面
  label: {
    type: String,
    default: 'default',
  },
  // 默认显示底部
  showFooter: {
    type: Boolean,
    default: true,
  },
  // 默认不以卡片视图显示
  card: {
    type: Boolean,
    default: false,
  },
  loading: {
    type: Boolean,
    default: false,
  },
  title: {
    type: String,
    default: () => useRoute().meta?.title, // 默认从路由加载 title
  },
})

const { pageList } = storeToRefs(useAppStore())

// 根据后端配置动态获取封面
const coverStyle = computed(() => {
  const page = pageList.value.find(e => e.label === props.label)
  return page
    ? `background: url('${page.cover}') center center / cover no-repeat;`
    : 'background: grey center center / cover no-repeat;'
})
</script>

<template>
  <!-- 顶部图片 -->
  <div :style="coverStyle" class="banner-fade-down absolute inset-x-0 top-0 h-280 f-c-c lg:h-400">
    <h1 class="mt-40 animate-fade-in-down animate-duration-800 text-26 font-bold text-light lg:text-40">
      {{ props.title }}
    </h1>
  </div>
  <!-- 主体内容 -->
  <main class="mx-5 flex-1">
    <!-- 内容在 spin 中 -->
    <ULoading :show="props.loading">
      <!-- 卡片视图 -->
      <template v-if="props.card">
        <div class="card-fade-up card-view mx-auto mb-40 mt-300 max-w-970 min-h-180 pb-30 pt-30 pt-50 lg:mt-440 lg:px-55">
          <slot v-if="!props.loading" />
        </div>
      </template>
      <!-- 常规视图 -->
      <template v-else>
        <div class="card-fade-up mx-auto mt-260 max-w-1150 min-h-400 px-5 py-40 lg:mt-400">
          <slot />
        </div>
      </template>
    </ULoading>
  </main>
  <!-- 底部 -->
  <footer v-if="props.showFooter">
    <AppFooter />
  </footer>
</template>
