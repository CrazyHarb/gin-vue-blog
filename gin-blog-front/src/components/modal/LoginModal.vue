<script setup>
import { computed, ref } from 'vue'

import UModal from '@/components/ui/UModal.vue'
import config from '@/assets/config'

import api from '@/api'
import { setToken } from '@/utils'

import { useAppStore, useUserStore } from '@/store'
const [appStore, userStore] = [useAppStore(), useUserStore()]

const registerFlag = computed({
  get: () => appStore.registerFlag,
  set: val => appStore.setRegisterFlag(val),
})

const loginFlag = computed({
  get: () => appStore.loginFlag,
  set: val => appStore.setLoginFlag(val),
})

const form = ref({
  username: '',
  password: '',
})

// 登录
async function handleLogin() {
  const { username, password } = form.value
  if (!username || !password) {
    window.$message?.warning('请输入用户名和密码')
    return
  }

  const doLogin = async (username, password) => {
    const result = await api.login({ username, password })
    window.$notify?.success('登录成功!')
    setToken(result.data.token) // 保存在本地
    // 加载用户信息, 更新 pinia 中信息, 刷新页面
    await userStore.getUserInfo()
    // 清空表单
    form.value = { username: '', password: '' }
    loginFlag.value = false
  }

  if (JSON.parse(import.meta.env.VITE_USE_CAPTCHA)) {
  // 腾讯滑块验证码 (在 index.html 中引入 js 文件)
    const captcha = new window.TencentCaptcha(config.TENCENT_CAPTCHA,
      async (res) => {
        res.ret === 0 && doLogin(username, password)
      })
    captcha.show()
  } else {
    doLogin(username, password)
  }
}

// 立即注册
function openRegister() {
  registerFlag.value = true
  loginFlag.value = false
}

// TODO:忘记密码
function openForget() {
  window?.$message?.info('暂时不支持找回密码!')
}
</script>

<template>
  <UModal v-model="loginFlag" :width="480">
    <div class="mx-10 my-5">
      <div class="mb-15 text-18 font-bold">
        登录
      </div>
      <div class="my-30 space-y-15">
        <div class="flex items-center">
          <span class="mr-15 inline-block w-60 text-right"> 用户名 </span>
          <input
            v-model="form.username" required placeholder="用户名"
            class="block w-full border-0 rounded-md p-8 text-15 text-gray-900 shadow-sm outline-none ring-1 ring-gray-300 ring-inset placeholder:text-gray-400 focus:ring-2 focus:ring-emerald"
          >
        </div>
        <div class="flex items-center">
          <span class="mr-15 inline-block w-60 text-right"> 密码 </span>
          <input
            v-model="form.password" type="password" placeholder="密码"
            class="block w-full border-0 rounded-md p-8 text-15 text-gray-900 shadow-sm outline-none ring-1 ring-gray-300 ring-inset placeholder:text-gray-400 focus:ring-2 focus:ring-emerald"
          >
        </div>
      </div>
      <div class="my-10 text-center">
        <button class="w-full rounded-1rem bg-blue py-8 text-white hover:bg-light-blue" @click="handleLogin">
          登录
        </button>
        <div class="mt-15 flex justify-between">
          <button @click="openRegister">
            立即注册
          </button>
          <button @click="openForget">
            忘记密码？
          </button>
        </div>
      <!-- TODO: 第三方登录 -->
      <!-- <div text-center text-10 color="#aaa">
          社交帐号登录
        </div> -->
      </div>
    </div>
  </UModal>
</template>
