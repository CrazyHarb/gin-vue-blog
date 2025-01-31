import { getLocal, removeLocal, setLocal } from '@/utils'

const TOKEN_CODE = 'blog_access_token'

/** token 过期时间：6小时 */
const DURATION = 6 * 60 * 60

export function getToken() {
  return getLocal(TOKEN_CODE)
}

/**
 * @param {String} token
 */
export function setToken(token) {
  setLocal(TOKEN_CODE, token, DURATION)
}

export function removeToken() {
  removeLocal(TOKEN_CODE)
}

