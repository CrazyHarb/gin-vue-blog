-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: gvb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS`gvb` DEFAULT CHARACTER SET utf8mb4;
USE `gvb`;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章标题',
  `category_id` bigint NOT NULL COMMENT '分类 ID',
  `desc` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章描述',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '文章内容',
  `img` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面图片地址',
  `comment_count` bigint NOT NULL DEFAULT '0',
  `read_count` bigint NOT NULL DEFAULT '0',
  `is_top` tinyint NOT NULL DEFAULT '0' COMMENT '是否置顶(0-否 1-是)',
  `original_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '源链接',
  `type` tinyint DEFAULT NULL COMMENT '类型(1-原创 2-转载 3-翻译)',
  `status` tinyint DEFAULT NULL COMMENT '状态(1-公开 2-私密)',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否放到回收站(0-否 1-是)',
  `user_id` bigint NOT NULL COMMENT '用户 ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_category` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
-- INSERT INTO `article` VALUES (1,'2022-12-03 22:07:01.638','2022-12-24 12:05:13.151','项目介绍',1,'','## 博客介绍\n\n<p align=center>\n<a href=\"http://www.ipoluo.com\">\n<img src=\"https://img-blog.csdnimg.cn/fe2f1034cf7c4bd795552d47373ee405.jpeg\"  width=\"200\" hight=\"200\" alt=\"后天有雨\" style=\"border-radius: 50%\">\n</a>\n</p>\n\n<p align=\"center\">\n   <a target=\"_blank\" href=\"#\">\n      <img style=\"display: inline-block;\" src=\"https://img.shields.io/badge/Go-1.19-blue\"/>\n      <img style=\"display: inline-block;\" src=\"https://img.shields.io/badge/Gin-v1.8.1-blue\"/>\n      <img style=\"display: inline-block;\" src=\"https://img.shields.io/badge/Casbin-v2.56.0-blue\"/>\n      <img style=\"display: inline-block;\" src=\"https://img.shields.io/badge/mysql-8.0-blue\"/>\n      <img style=\"display: inline-block;\" src=\"https://img.shields.io/badge/GORM-v1.24.0-blue\"/>\n      <img style=\"display: inline-block;\" src=\"https://img.shields.io/badge/redis-7.0-red\"/>\n      <img style=\"display: inline-block;\" src=\"https://img.shields.io/badge/vue-v3.X-green\"/>\n    </a>\n</p>\n\n[在线预览](#在线预览) | [项目介绍](#项目介绍) | [技术介绍](#技术介绍) | [目录结构](#目录结构) | [环境介绍](#环境介绍) | [快速开始](#快速开始) | [总结&鸣谢](#总结鸣谢)  | [后续计划](#后续计划) | [更新日志](#更新日志)\n\n您的 Star 是我坚持的动力，感谢大家的支持，欢迎提交 Pr 共同改进项目。\n\nGithub 地址：[https://github.com/CrazyHarb/gin-vue-blog](https://github.com/CrazyHarb/gin-vue-blog)\n\nGitee 地址：[/gin-vue-blog](/gin-vue-blog)\n\n\n## 在线预览\n\n博客前台链接：[ipoluo.com](https://www.ipoluo.com)（已适配移动端）\n\n博客后台链接：[ipoluo.com/blog-admin](https://www.ipoluo.com/blog-admin)（暂未专门适配移动端）\n\n> 博客域名已通过备案，且配置 SSL，通过 https 访问\n\n测试账号：test@qq.com，密码：11111，前后台都可用这个账号登录\n\n在线接口文档地址：[doc.ipoluo.com](http://doc.ipoluo.com/)\n\n> 本项目在线接口文档由 Apifox 生成，由于项目架构调整，有些接口待完善和修改\n>\n> 由于一开始不会用，接口文档生成的信息不全（如返回响应、响应示例），后续完善\n\n以下放几张简单的预览图，强烈建议点击上面的[预览链接](#在线预览)进去体验下：\n\n![前台首页图片](https://img-blog.csdnimg.cn/fd25f0e52cdc467893925a48d0d66662.png)\n\n![前台首页文章列表](https://img-blog.csdnimg.cn/005cee463d3c4e729a1dd7bbee41e963.png)\n\n![后台文章列表](https://img-blog.csdnimg.cn/18c39f63b7b64f7bbd2a4ab764552d13.png)\n\n\n## 项目介绍\n\nGithub 上有很多优秀的前后台框架，本项目也参考了许多开源项目，但是大多项目都比较重量级（并非坏处），如果从学习的角度来看对初学者并不是很友好。本项目在以**博客**这个业务为主的前提下，提供一个完整的全栈项目代码（前台前端 + 后台前端 + 后端），技术点基本都是最新 + 最火的技术，代码轻量级，注释完善，适合学习。\n\n同时，本项目可用于一键搭建动态博客（参考 [快速开始](#快速开始)），会尽可能多的将前端许多栏目做成后台可动态配置的形式。\n\n前台：\n- 前台界面设计参考 Hexo 的 Butterfly 设计，美观简洁\n- 响应式布局，适配了移动端\n- 实现点赞，统计用户等功能 (Redis)\n- 评论 + 回复评论功能\n- 留言采用弹幕墙，效果炫酷\n- 文章详情页有文章目录、推荐文章等功能，优化用户体验\n\n后台：\n- 鉴权使用 JWT\n- 权限管理使用 CASBIN，实现基于 RBAC 的权限管理\n- 支持动态权限修改，前端菜单由后端生成（动态路由）\n- 文章编辑使用 Markdown 编辑器\n- 常规后台功能齐全：侧边栏、面包屑、标签栏等\n- 实现记录操作日志功能（GET 不记录）\n- 实现监听在线用户、强制下线功能\n- 文件上传支持七牛云、本地（后续计划支持更多）\n- 对 CRUD 操作封装了通用 Hook\n\n其他：\n- 采用 Restful 风格的 API\n- 前后端分离部署，前端使用 Nginx，后端使用 Docker\n- 代码整洁层次清晰，利于开发者学习\n- 技术点新颖，代码轻量级，适度封装\n- Docker Compose 一键运行，轻松搭建在线博客\n\n### 技术介绍\n\n> 这里只写一些主流的通用技术，详细第三方库：前端参考 `package.json` 文件，后端参考 `go.mod` 文件\n\n前端技术栈: 使用 pnpm 包管理工具\n- 基于 TypeScript\n- Vue3\n- VueUse: 服务于 Vue Composition API 的工具集\n- Unocss: 原子化 CSS\n- Pinia\n- Vue Router \n- Axios \n- Naive UI\n- ...\n\n后端技术栈:\n- Golang\n- Docker\n- Gin\n- GORM\n- Viper: 支持 TOML (默认)、YAML 等常用格式作为配置文件\n- Casbin\n- Zap\n- MySQL\n- Redis\n- Nginx: 部署静态资源 + 反向代理\n- ...\n\n其他:\n- 腾讯云人机验证\n- 七牛云对象存储\n- ...\n\n### 目录结构\n\n> 这里简单列出目录结构，具体可以查看源码\n\n代码仓库目录：\n\n```bash\ngin-vue-blog\n├── gin-blog-admin      -- 博客后台前端\n├── gin-blog-front      -- 博客前台前端\n├── gin-blog-server     -- 博客后端\n├── deploy              -- 部署\n\n```\n\n> 项目运行参考：[快速开始](#快速开始)\n\n后端目录：简略版\n\n```bash\ngin-blog-server\n├── api             -- API\n│   ├── front       -- 前台接口\n│   └── v1          -- 后台接口\n├── dao             -- 数据库操作模块\n├── service         -- 服务模块\n├── model           -- 数据模型\n│   ├── req             -- 请求 VO 模型\n│   ├── resp            -- 响应 VO 模型\n│   ├── dto             -- 内部传输 DTO 模型\n│   └── ...             -- 数据库模型对象 PO 模型\n├── routes          -- 路由模块\n│   └── middleware      -- 路由中间件\n├── utils           -- 工具模块\n│   ├── r               -- 响应封装\n│   ├── upload          -- 文件上传\n│   └── ...\n├── routes          -- 路由模块\n├── config          -- 配置文件\n├── test            -- 测试模块\n├── assets          -- 资源文件\n├── log             -- 存放日志的目录\n├── public          -- 外部访问的静态资源\n│   └── uploaded    -- 本地文件上传目录\n├── Dockerfile\n└── main.go\n```\n\n前端目录：简略版\n\n```\ngin-vue-admin / gin-vue-front 通用目录结构\n├── src              \n│   ├── api             -- 接口\n│   ├── assets          -- 静态资源\n│   ├── styles          -- 样式\n│   ├── components      -- 组件\n│   ├── composables     -- 组合式函数\n│   ├── router          -- 路由\n│   ├── store           -- 状态管理\n│   ├── utils           -- 工具方法\n│   ├── views           -- 页面\n│   ├── App.vue\n│   └── main.ts\n├── settings         -- 项目配置\n├── build            -- 构建相关的配置\n├── public           -- 公共资源, 在打包后会被加到 dist 根目录\n├── package.json \n├── package-lock.json\n├── index.html\n├── tsconfig.json\n├── unocss.config.ts -- unocss 配置\n└── vite.config.ts   -- vite 配置\n├── .env             -- 通用环境变量\n├── .env.development -- 开发环境变量\n├── .env.production  -- 线上环境变量\n├── .gitignore\n├── .editorconfig    -- 编辑器配置\n```\n\n部署目录：简略版\n\n```\ndeploy\n├── build      -- 镜像构建\n│   ├── mysql  -- mysql 镜像构建\n│   ├── server -- 后端镜像构建 (基于 gin-blog-server 目录)\n│   └── web    -- 前端镜像构建 (基于前端项目打包的静态资源)\n└── start\n    ├── docker-compose.yml    -- 多容器管理\n    └── .env                  -- 环境变量\n    └── ...\n```\n\n## 环境介绍\n\n### 线上环境\n\n服务器：腾讯云 2核 4G Ubuntu 22.04 LTS\n\n对象存储：七牛云\n\n### 开发环境\n\n| 开发工具                      | 说明                    |\n| ----------------------------- | ----------------------- |\n| Vscode                        | Golang 后端 +  Vue 前端 |\n| Navicat                       | MySQL 远程连接工具      |\n| Another Redis Desktop Manager | Redis 远程连接工具      |\n| MobaXterm                     | Linux 远程工具          |\n| Apifox                        | 接口调试 + 文档生成     |\n\n| 开发环境 | 版本 |\n| -------- | ---- |\n| Golang   | 1.19 |\n| MySQL    | 8.x  |\n| Redis    | 7.x  |\n\n### VsCode 插件\n\nTODO: 直接写到 .vscode 文件中, 用 VsCode 打开后自动推荐安装\n\n如果使用 Vscode 开发，推荐安装以下插件。\n\n前端开发插件：（必备）\n\n| 插件 | 作用 |\n| -------- | ---- |\n| Volar   | Vue 官方插件 |\n| UnoCSS | Unocss 官方插件 |\n| Iconify IntelliSense | Iconify 提示插件 |\n\n后端开发插件：（必备）\n\n| 插件 | 作用 |\n| -------- | ---- |\n| Go | Golang 官方插件 |\n\n\n其他插件：（个人推荐，用于提升开发体验）\n\n| 名称 | 作用 |\n| -------- | ---- |\n| Better Comments   | 优化代码注释显示效果 |\n| TODO Highlight | 高亮 TODO |\n| Highlight Matching Tag | 高亮匹配的标签 | \n\n## 快速开始\n\n建议下载本项目后，先一键运行起来，查看本项目在本地的运行效果。\n\n需要修改源码的话，参考常规运行，前后端分开运行。\n\n### 方式一：Docker Compose 一键运行\n\n需要安装 Docker 和 Docker Compose, 环境准备可参考 [deploy](https://github.com/CrazyHarb/gin-vue-blog/tree/main/deploy)\n\n```\n# 拉取项目\ngit clone https://github.com/CrazyHarb/gin-vue-blog\n\n# 进入 docker-compose 目录\ncd deploy/start\n\n# 一键运行\ndocker-compose up -d\n```\n\n默认用户：\n- 管理员 admin 123456\n- 普通用户 user 123456\n- 测试用户 test 123456\n\n### 方式二：常规运行\n\n> 自行安装 Golang、Node、MySQL、Redis 环境\n\n需要先运行后端服务，再运行前端项目，因为很多前端配置由后端动态加载（如菜单等）。\n\n拉取项目到本地：\n\n```bash\ngit clone https://github.com/CrazyHarb/gin-vue-blog.git\n```\n\n后端项目运行：\n\n```bash\n# 1、进入后端项目根目录 \ncd gin-blog-server\n\n# 2、修改项目运行的配置文件，默认加载位于 config/config.toml \n\n# 3、MySQL 导入 gvb.sql\n\n# 4、启动 Redis \n\n# 5、运行项目\ngo mod tidy\ngo run main.go\n```\n\n数据库中的默认用户：\n- 管理员 admin 123456\n- 普通用户 user 123456\n- 测试用户 test 123456\n\n前端项目运行： 本项目使用 pnpm 进行包管理，建议全局安装 pnpm\n\n```bash\nnpm install -g pnpm\n```\n\n前台前端：\n\n```bash\n# 1、进入前台前端项目根目录\ncd gin-blog-front\n\n# 2、安装依赖\npnpm install\n\n# 3、运行项目\npnpm dev\n```\n\n后台前端：\n\n```bash\n# 1、进入后台前端项目根目录\ncd gin-blog-admin\n\n# 2、安装依赖\npnpm install\n\n# 3、运行项目\npnpm dev\n```\n\n### 项目部署\n\n> 很快就来。保证简单。\n\n## 总结鸣谢\n\n这个项目不管是前端，还是后端，都是花了比较大心血去架构的，并且从技术选型上，都是选择了目前最火 + 最新的技术栈。当然，这也是个人的学习之作，很多知识点都是边学边开发的（例如 Casbin），这个过程中也参考了很多优秀的开源项目，感谢大家的开源让程序员的世界更加美好，这也是开源本项目的目的之一。本项目中仍有很多不足，后续会继续更新。\n\n最后，项目整体代码风格很优秀，注释完善，适合 Golang 后端开发者、前端开发者学习。\n\n 鸣谢项目：\n\n- [https://butterfly.js.org/](https://butterfly.js.org/)\n- [https://github.com/flipped-aurora/gin-vue-admin](https://github.com/flipped-aurora/gin-vue-admin)\n- [https://github.com/qifengzhang007/GinSkeleton](https://github.com/qifengzhang007/GinSkeleton)\n- [https://github.com/X1192176811/blog](https://github.com/X1192176811/blog)\n- [https://github.com/zclzone/vue-naive-admin](https://github.com/zclzone/vue-naive-admin)\n- [https://github.com/antfu/vitesse](https://github.com/antfu/vitesse)\n- ...\n\n> 需要感谢的绝不止以上这些开源项目，但是一时难以全部列出，后面会慢慢补上。\n\n## 后续计划\n\n高优先级: \n\n- ~~完善图片上传功能, 目前文件上传还没怎么处理~~ 🆗\n- 后台首页重新设计（目前没放什么内容）\n- ~~前台首页搜索文章（目前使用数据库模糊搜索）~~ 🆗\n- ~~博客文章导入导出 (.md 文件)~~ 🆗\n- ~~权限管理中菜单编辑时选择图标（现在只能输入图标字符串）~~ 🆗\n- 后端日志切割\n- ~~后台修改背景图片，博客配置等~~ 🆗\n- ~~后端的 IP 地址检测 BUG 待修复~~ 🆗\n- ~~博客前台适配移动端~~ 🆗\n- ~~文章详情, 目录锚点跟随~~ 🆗\n- 邮箱注册 + 邮件发送验证码\n\n后续有空安排上：\n- 黑夜模式\n- 前台收缩侧边信息功能\n- 说说\n- 相册\n- 音乐播放器\n- 鼠标左击特效\n- 看板娘\n- 第三方登录: QQ、微信、Github ...\n- 评论时支持选择表情，参考 Valine\n- 单独部署：前后端 + 环境\n- 重写单元测试，目前的单元测试是早期版本，项目架构更改后，无法跑通\n- 前台首页搜索集成 ElasticSearch\n- 国际化?\n\n其他：\n- 写一份好的文档\n- 补全 README.md\n- 完善 Apifox 生成的接口文档\n- ~~一键部署：使用 docker compose 单机一键部署整个项目（前后端 + 环境）~~ 🆗\n\n## 更新日志\n\n描述规范定义，有以下几种行为 ACTION:\n- `FIX`: 修复\n- `REFINE`: 优化\n- `COMPLETE`: 完善\n- `ADD`: 新增\n\n---\n\n2022-12-23:\n\n博客部署:\n- 新增 deploy 子模块, 使用 docker-compose 一键运行前后端 ⭐⭐\n\n---\n\n2022-12-22:\n\n博客部署:\n- 修复 线上图片上传问题, 本地上传则采用 Nginx 反向代理 Gin 的静态服务资源, 也可采用七牛云存储\n\n---\n\n2022-12-21:\n\n博客后台:\n- 新增 图标选择组件, 选择范围为自定义图标数组 ⭐\n\n---\n\n2022-12-20:\n\n博客后台: \n- 完善 IP 检测工具 ⭐\n- 修复 Nginx 获取的客户端 IP 是服务器 IP (docker 部署 Nginx 的问题, 修改 Nginx 配置文件即可)\n\n---\n\n2022-12-19:\n\n博客后台:\n- 添加简易版黑夜模式 (一行 CSS 实现)\n\n---\n\n2022-12-17:\n\n博客后台:\n- 新增 文章导入、导出 ⭐\n\n---\n\n2022-12-16:\n\n博客后台:\n- 修复 MySQL 无法存储 emoji 的问题，设置 utf8mb4 字符集编码，更新 SQL \n- 完善 添加文章时选择标签的逻辑\n- 新增 全屏水印 功能\n\n---\n\n2022-12-15:\n\n博客后台：\n- 优化 菜单栏和标签栏，点击标签自动展开对应菜单，点击菜单自动滚动到显示对应标签 ⭐\n- 优化 使用响应式语法糖重构代码\n- 优化 代码结构 + 注释\n\n---\n\n2022-12-14:\n\n博客前台：\n- 优化 代码，去除 n-card 组件，使用自定义 css 实现卡片视图\n- 优化 对滚动的监听操作，添加节流函数，提升性能 ⭐\n- 优化 文章目录，根据当前滚动条自动高亮锚点 ⭐⭐\n- 新增 vite 打包优化相关插件\n\n---\n\n2022-12-13:\n\n项目部署：\n- 新增 Nginx 配置 https 访问域名 (http 自动跳转到 https) ⭐\n- 新增 七牛云添加加速域名访问图片资源\n\n博客后端：\n- 新增 文章搜索接口（数据库模糊查询）\n\n博客前台：\n- 新增 导航栏的文章搜索\n\n---\n\n2022-12-12:\n\n博客前台：\n- 新增 适配移动端 ⭐⭐\n- 优化 删除 Vuetify 相关组件及依赖 (css 样式存在冲突)，统一使用 naive-ui\n- 优化 使用 `$ref` 语法糖功能重构页面\n\n---\n\n2022-12-09:\n\n博客前台：\n- 完善 个人中心的头像上传（注意头像上传需要 Token）\n- 优化 重构通用页面的代码 ⭐\n\n---\n\n2022-12-08:\n\n博客后端：\n- 新增 页面模块 的接口 ⭐\n- 修复 单元测试无法初始化全局变量（flag 包冲突）问题\n\n博客后台：\n- 新增 pinia 数据持久化，防止刷新丢失数据 ⭐\n- 新增 页面管理页面，动态配置前台显示的封面 ⭐\n\n博客前台：\n- 新增 页面根据 `label` 从后端数据中加载封面 ⭐\n- 优化 尝试性使用 `$ref` 语法糖功能\n\n---\n\n2022-12-07:\n\n博客后台：\n- 修复 博客后台，动态加载路由模块导致的热加载失效问题 ⭐⭐\n- 完善 文件上传，抽取出单独的组件 ⭐⭐\n- 新增 个人信息页面 ⭐\n- 优化 发布文章/查看文章 时的文章标签选择、分类选择\n- 修复 发布文章/查看文章 页面数据加载错误','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1679532730085ae4a2100de143ddfc3962a573adf2.jpg',0,0,1,'',1,1,0,1),(2,'2022-12-16 11:56:40.880','2022-12-16 12:36:42.106','项目运行成功',2,'','恭喜你，项目已经成功运行起来了！\n\n```go\nfmt.Println(\"恭喜！\")\n```\n\n```js\nconsole.log(\"恭喜！\")\n```\n\n🆗😋','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/16800548069b4ec50318e14ed5a1b24a7fd111c6d1.jpg',0,0,0,'',1,1,0,1),(3,'2022-12-24 12:07:28.992','2022-12-24 12:08:31.381','学习有捷径',2,'','学习有捷径。学习的捷径之一就是多看看别人是怎么理解这些知识的。\n\n举两个例子。\n\n如果你喜欢《水浒》，千万不要只读原著当故事看，一定要读一读各代名家的批注和点评，看他们是如何理解的。之前学 C# 时，看《CLR via C#》晦涩难懂，但是我又通过看《你必须知道的.net》而更加了解了。因为后者就是中国一个 80 后写的，我通过他对 C# 的了解，作为桥梁和阶梯，再去窥探比较高达上的书籍和知识。\n\n最后，真诚的希望你能借助别人的力量来提高自己。我也一直在这样要求我自己。\n','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/16795327449436e78028dacd762d8ef17163c5c2e8.jpg',0,0,0,'',2,1,0,1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_tag` (
  `article_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` VALUES (1,1),(1,2),(2,1),(2,2),(3,3);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_config`
--

DROP TABLE IF EXISTS `blog_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `config` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_config`
--

LOCK TABLES `blog_config` WRITE;
/*!40000 ALTER TABLE `blog_config` DISABLE KEYS */;
INSERT INTO `blog_config` VALUES (1,'2022-10-30 14:57:38.000','2022-12-17 00:02:41.127','{\r\n  \"website_avatar\": \"https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/profile/profile.jpg\",\r\n  \"website_name\": \"后天有雨\",\r\n  \"website_author\": \"画中蝉\",\r\n  \"website_intro\": \"树欲静而风不止\",\r\n  \"website_notice\": \"博客后端基于 gin、gorm 开发\\n博客前端基于 Vue3、TS、NaiveUI 开发\\n努力开发中...冲冲冲！加油！\",\r\n  \"website_createtime\": \"2022-11-01\",\r\n  \"website_record\": \"京ICP备19044037号-1\",\r\n  \"social_login_list\": [],\r\n  \"social_url_list\": [],\r\n  \"qq\": \"\",\r\n  \"github\": \"https://github.com/CrazyHarb\",\r\n  \"gitee\": \"\",\r\n  \"tourist_avatar\": \"https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/16815451239215dc82548dcadcd578a5bbc8d5deaa.jpg\",\r\n  \"user_avatar\": \"https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/2299fc4d14c94e6183b082973b35855d.png\",\r\n  \"article_cover\": \"https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1679461519cc592408198d67faf1290ff8969dc614.png\",\r\n  \"is_comment_review\": 1,\r\n  \"is_message_review\": 1,\r\n  \"is_email_notice\": 0,\r\n  \"is_reward\": 0,\r\n  \"wechat_qrcode\": \"http://dummyimage.com/100x100\",\r\n  \"alipay_ode\": \"http://dummyimage.com/100x100\"\r\n}');
/*!40000 ALTER TABLE `blog_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casbin_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2497 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
INSERT INTO `casbin_rule` VALUES (1416,'g','admin','anonymous',NULL,NULL,NULL,NULL),(1418,'g','admin','logout',NULL,NULL,NULL,NULL),(1420,'g','test','anonymous',NULL,NULL,NULL,NULL),(1421,'g','test','logout',NULL,NULL,NULL,NULL),(1417,'g','user','anonymous',NULL,NULL,NULL,NULL),(1419,'g','user','logout',NULL,NULL,NULL,NULL),(2453,'p','admin','/article','DELETE','','',''),(2451,'p','admin','/article','POST','','',''),(2450,'p','admin','/article/:id','GET','','',''),(2495,'p','admin','/article/export','POST','','',''),(2496,'p','admin','/article/import','POST','','',''),(2449,'p','admin','/article/list','GET','','',''),(2452,'p','admin','/article/soft-delete','PUT','','',''),(2454,'p','admin','/article/top','PUT','','',''),(2457,'p','admin','/category','DELETE','','',''),(2456,'p','admin','/category','POST','','',''),(2455,'p','admin','/category/list','GET','','',''),(2458,'p','admin','/category/option','GET','','',''),(2467,'p','admin','/comment','DELETE','','',''),(2466,'p','admin','/comment/list','GET','','',''),(2468,'p','admin','/comment/review','PUT','','',''),(2486,'p','admin','/home','GET','','',''),(2475,'p','admin','/link','DELETE','','',''),(2474,'p','admin','/link','POST','','',''),(2473,'p','admin','/link/list','GET','','',''),(2445,'p','admin','/menu','POST','','',''),(2446,'p','admin','/menu/:id','DELETE','','',''),(2444,'p','admin','/menu/list','GET','','',''),(2447,'p','admin','/menu/option','GET','','',''),(2448,'p','admin','/menu/user/list','GET','','',''),(2464,'p','admin','/message','DELETE','','',''),(2463,'p','admin','/message/list','GET','','',''),(2465,'p','admin','/message/review','PUT','','',''),(2485,'p','admin','/operation/log','DELETE','','',''),(2484,'p','admin','/operation/log/list','GET','','',''),(2493,'p','admin','/page','DELETE','','',''),(2492,'p','admin','/page','POST','','',''),(2491,'p','admin','/page/list','GET','','',''),(2440,'p','admin','/resource','POST','','',''),(2443,'p','admin','/resource/:id','DELETE','','',''),(2439,'p','admin','/resource/anonymous','PUT','','',''),(2441,'p','admin','/resource/list','GET','','',''),(2442,'p','admin','/resource/option','GET','','',''),(2471,'p','admin','/role','DELETE','','',''),(2470,'p','admin','/role','POST','','',''),(2469,'p','admin','/role/list','GET','','',''),(2472,'p','admin','/role/option','GET','','',''),(2478,'p','admin','/setting/about','GET','','',''),(2482,'p','admin','/setting/about','PUT','','',''),(2477,'p','admin','/setting/blog-config','GET','','',''),(2479,'p','admin','/setting/blog-config','PUT','','',''),(2461,'p','admin','/tag','DELETE','','',''),(2460,'p','admin','/tag','POST','','',''),(2459,'p','admin','/tag/list','GET','','',''),(2462,'p','admin','/tag/option','GET','','',''),(2494,'p','admin','/upload','POST','','',''),(2481,'p','admin','/user','PUT','','',''),(2489,'p','admin','/user/current','PUT','','',''),(2488,'p','admin','/user/current/password','PUT','','',''),(2490,'p','admin','/user/disable','PUT','','',''),(2480,'p','admin','/user/info','GET','','',''),(2476,'p','admin','/user/list','GET','','',''),(2487,'p','admin','/user/offline','DELETE','','',''),(2483,'p','admin','/user/online','GET','','',''),(1488,'p','logout','/logout','GET',NULL,NULL,NULL),(2365,'p','test','/article/:id','GET','','',''),(2364,'p','test','/article/list','GET','','',''),(2366,'p','test','/category/list','GET','','',''),(2367,'p','test','/category/option','GET','','',''),(2371,'p','test','/comment/list','GET','','',''),(2381,'p','test','/home','GET','','',''),(2374,'p','test','/link/list','GET','','',''),(2361,'p','test','/menu/list','GET','','',''),(2362,'p','test','/menu/option','GET','','',''),(2363,'p','test','/menu/user/list','GET','','',''),(2370,'p','test','/message/list','GET','','',''),(2380,'p','test','/operation/log/list','GET','','',''),(2382,'p','test','/page/list','GET','','',''),(2359,'p','test','/resource/list','GET','','',''),(2360,'p','test','/resource/option','GET','','',''),(2372,'p','test','/role/list','GET','','',''),(2373,'p','test','/role/option','GET','','',''),(2377,'p','test','/setting/about','GET','','',''),(2376,'p','test','/setting/blog-config','GET','','',''),(2368,'p','test','/tag/list','GET','','',''),(2369,'p','test','/tag/option','GET','','',''),(2378,'p','test','/user/info','GET','','',''),(2375,'p','test','/user/list','GET','','',''),(2379,'p','test','/user/online','GET','','',''),(2341,'p','user','/article/:id','GET','','',''),(2340,'p','user','/article/list','GET','','',''),(2342,'p','user','/category/list','GET','','',''),(2343,'p','user','/category/option','GET','','',''),(2347,'p','user','/comment/list','GET','','',''),(2357,'p','user','/home','GET','','',''),(2350,'p','user','/link/list','GET','','',''),(2337,'p','user','/menu/list','GET','','',''),(2338,'p','user','/menu/option','GET','','',''),(2339,'p','user','/menu/user/list','GET','','',''),(2346,'p','user','/message/list','GET','','',''),(2356,'p','user','/operation/log/list','GET','','',''),(2358,'p','user','/page/list','GET','','',''),(2335,'p','user','/resource/list','GET','','',''),(2336,'p','user','/resource/option','GET','','',''),(2348,'p','user','/role/list','GET','','',''),(2349,'p','user','/role/option','GET','','',''),(2353,'p','user','/setting/about','GET','','',''),(2352,'p','user','/setting/blog-config','GET','','',''),(2344,'p','user','/tag/list','GET','','',''),(2345,'p','user','/tag/option','GET','','',''),(2354,'p','user','/user/info','GET','','',''),(2351,'p','user','/user/list','GET','','',''),(2355,'p','user','/user/online','GET','','','');
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'后端','2022-12-03 22:01:29.106','2022-12-03 22:01:29.106'),(2,'前端','2022-12-03 22:01:33.074','2022-12-03 22:01:33.074');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL COMMENT '评论用户id',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `reply_user_id` bigint DEFAULT NULL COMMENT '回复用户id',
  `topic_id` bigint DEFAULT NULL COMMENT '评论主题id',
  `parent_id` bigint DEFAULT NULL COMMENT '父评论id',
  `type` tinyint(1) NOT NULL COMMENT '评论类型(1.文章 2.友链 3.说说)',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除(0.否 1.是)',
  `is_review` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核(0.否 1.是)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;

/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_link`
--

DROP TABLE IF EXISTS `friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_link`
--

LOCK TABLES `friend_link` WRITE;
/*!40000 ALTER TABLE `friend_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` tinyint DEFAULT '0' COMMENT '显示排序',
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单id',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏(0-否 1-是)',
  `keep_alive` tinyint(1) DEFAULT '1',
  `redirect` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '跳转路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,'2022-10-31 09:41:03.000','2022-11-01 01:14:01.229','文章管理','/article','Layout','ic:twotone-article',1,0,0,1,'/article/list'),(3,'2022-10-31 09:41:03.000','2022-11-01 10:11:07.042','消息管理','/message','Layout','ic:twotone-email',2,0,0,1,'/message/comment	'),(4,'2022-10-31 09:41:03.000','2022-11-01 10:11:31.573','用户管理','/user','Layout','ph:user-list-bold',4,0,0,1,'/user/list'),(5,'2022-10-31 09:41:03.000','2022-11-01 10:11:45.624','系统管理','/setting','Layout','ion:md-settings',5,0,0,1,'/setting/website'),(6,'2022-10-31 09:41:03.000','2022-11-05 14:21:38.109','发布文章','write','/article/write','icon-park-outline:write',1,2,0,1,''),(8,'2022-10-31 09:41:03.000','2022-11-01 01:18:25.685','文章列表','list','/article/list','material-symbols:format-list-bulleted',2,2,0,1,''),(9,'2022-10-31 09:41:03.000','2022-11-01 01:18:30.931','分类管理','category','/article/category','tabler:category',3,2,0,1,''),(10,'2022-10-31 09:41:03.000','2022-11-01 01:18:35.502','标签管理','tag','/article/tag','tabler:tag',4,2,0,1,''),(16,'2022-10-31 09:41:03.000','2022-11-01 10:11:23.195','权限管理','/auth','Layout','cib:adguard',3,0,0,1,'/auth/menu'),(17,'2022-10-31 09:41:03.000',NULL,'菜单管理','menu','/auth/menu','ic:twotone-menu-book',1,16,0,1,NULL),(23,'2022-10-31 09:41:03.000',NULL,'接口管理','resource','/auth/resource','mdi:api',2,16,0,1,NULL),(24,'2022-10-31 09:41:03.000','2022-10-31 10:09:18.913','角色管理','role','/auth/role','carbon:user-role',3,16,0,1,NULL),(25,'2022-10-31 10:11:09.232','2022-11-01 01:29:48.520','评论管理','comment','/message/comment','ic:twotone-comment',1,3,0,1,''),(26,'2022-10-31 10:12:01.546','2022-11-01 01:29:54.130','留言管理','leave-msg','/message/leave-msg','ic:twotone-message',2,3,0,1,''),(27,'2022-10-31 10:54:03.201','2022-11-01 01:30:06.901','用户列表','list','/user/list','mdi:account',1,4,0,1,''),(28,'2022-10-31 10:54:34.167','2022-11-01 01:30:13.400','在线用户','online','/user/online','ic:outline-online-prediction',2,4,0,1,''),(29,'2022-10-31 10:59:33.255','2022-11-01 01:30:20.688','网站管理','website','/setting/website','el:website',1,5,0,1,''),(30,'2022-10-31 11:00:09.997','2022-11-01 01:30:24.097','页面管理','page','/setting/page','iconoir:journal-page',2,5,0,1,''),(31,'2022-10-31 11:00:33.543','2022-11-01 01:30:28.497','友链管理','link','/setting/link','mdi:telegram',3,5,0,1,''),(32,'2022-10-31 11:01:00.444','2022-11-01 01:30:33.186','关于我','about','/setting/about','cib:about-me',4,5,0,1,''),(33,'2022-11-01 01:43:10.142','2022-12-07 20:53:27.473','首页','/home','/home','ic:sharp-home',0,0,0,1,''),(34,'2022-11-01 09:54:36.252','2022-11-01 10:07:00.254','修改文章','write/:id','/article/write','icon-park-outline:write',1,2,1,1,''),(36,'2022-11-04 15:50:45.993','2022-11-04 15:58:14.443','日志管理','/log','Layout','material-symbols:receipt-long-outline-rounded',6,0,0,1,'/log/operation'),(37,'2022-11-04 15:53:00.251','2022-11-04 15:58:36.560','操作日志','operation','/log/operation','mdi:book-open-page-variant-outline',1,36,0,1,''),(38,'2022-11-04 16:02:42.306','2022-11-04 16:05:35.761','登录日志','login','/log/login','material-symbols:login',2,36,0,1,''),(39,'2022-12-07 20:47:08.349','2022-12-07 20:53:33.851','个人中心','/profile','/profile','mdi:account',7,0,0,1,'');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '留言内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP 地址',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP 来源',
  `is_review` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态(0-未审核,1-审核通过)',
  `speed` tinyint(1) DEFAULT NULL COMMENT '弹幕速度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_log`
--

DROP TABLE IF EXISTS `operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `opt_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作模块',
  `opt_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作类型',
  `opt_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作方法',
  `opt_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作URL',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求参数',
  `request_method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '请求方法',
  `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '响应数据',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `nickname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '用户昵称',
  `ip_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '操作IP',
  `ip_source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '操作地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_log`
--

-- LOCK TABLES `operation_log` WRITE;
/*!40000 ALTER TABLE `operation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_log` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面名称',
  `label` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面标签',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '页面封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'2022-12-08 13:09:58.500','2023-06-05 10:34:43.719','首页','home','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1681545473fee57d0a6d499bdee26f375e7f00114f.jpg'),(2,'2022-12-08 13:51:49.474','2023-06-05 10:54:59.040','归档','archive','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/167946151088e991a33534911ad2ab1bc5cb75f730.png'),(3,'2022-12-08 13:52:18.084','2023-06-05 11:00:56.710','分类','category','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1679461101bae50be09654aa77754691e97840ad62.jpg'),(4,'2022-12-08 13:52:31.364','2023-06-05 10:51:23.133','标签','tag','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1679460788fdc43c54069809585a7694dfe09ac0a5.png'),(5,'2022-12-08 13:52:52.389','2023-06-05 11:06:06.025','友链','link','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1679460598fb0af82a672efa72bc533983ea54d6e5.jpg'),(6,'2022-12-08 13:53:04.159','2023-06-05 10:54:15.405','关于','about','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1676182015fb77af0dd426bb04261a0c896aeac8f4.jpg'),(7,'2022-12-08 13:53:17.707','2023-06-05 11:00:21.174','留言','message','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/50e0ec7fde824633b2cd7870028670b2.jpeg'),(8,'2022-12-08 13:53:30.187','2023-06-05 10:51:44.144','个人中心','user','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1679460844fb44f7496e7331bfa4edf181390edec0.jpg'),(9,'2022-12-16 23:54:52.650','2023-06-05 10:52:00.089','相册','album','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/16794608978464e5d4342e4e11e0967b000afd679d.png'),(10,'2022-12-16 23:55:36.059','2023-06-05 10:35:22.720','错误页面','404','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/16794606941b34c85a97a62dcf7184082474c8c55d.jpg'),(11,'2022-12-16 23:56:17.917','2023-06-05 10:35:52.329','文章列表','article_list','https://rainyaftertomorrow.oss-rg-china-mainland.aliyuncs.com/background/1679461585ade64f3e1212e3b1b4e67a02b043b25c.jpg');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源路径(接口URL)',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求方式',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源名(接口名)',
  `parent_id` bigint DEFAULT NULL COMMENT '父权限id',
  `is_anonymous` tinyint(1) DEFAULT NULL COMMENT '是否匿名访问(0-否 1-是)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (3,'2022-10-20 22:42:00.664','2022-10-20 22:42:00.664','','','文章模块',0,0),(6,'2022-10-20 22:42:23.349','2022-10-20 22:42:23.349','','','留言模块',0,0),(7,'2022-10-20 22:42:28.550','2022-10-20 22:42:28.550','','','菜单模块',0,0),(8,'2022-10-20 22:42:31.623','2022-10-20 22:42:31.623','','','角色模块',0,0),(9,'2022-10-20 22:42:36.262','2022-10-20 22:42:36.262','','','评论模块',0,0),(10,'2022-10-20 22:42:40.700','2022-10-20 22:42:40.700','','','资源模块',0,0),(11,'2022-10-20 22:42:51.023','2022-10-20 22:42:51.023','','','博客信息模块',0,0),(23,'2022-10-22 22:13:12.455','2022-10-26 11:15:23.546','/resource/anonymous','PUT','修改资源匿名访问',10,0),(34,'2022-10-31 17:14:11.708','2022-10-31 17:14:11.708','/resource','POST','新增/编辑资源',10,0),(35,'2022-10-31 17:14:42.320','2022-10-31 17:18:52.508','/resource/list','GET','资源列表',10,0),(36,'2022-10-31 17:15:14.999','2022-10-31 17:19:01.460','/resource/option','GET','资源选项列表(树形)',10,0),(37,'2022-10-31 17:16:56.830','2022-10-31 17:16:56.830','/resource/:id','DELETE','删除资源',10,0),(38,'2022-10-31 17:19:28.905','2022-10-31 17:19:28.905','/menu/list','GET','菜单列表',7,0),(39,'2022-10-31 18:46:33.051','2022-10-31 18:46:33.051','/menu','POST','新增/编辑菜单',7,0),(40,'2022-10-31 18:46:53.804','2022-10-31 18:46:53.804','/menu/:id','DELETE','删除菜单',7,0),(41,'2022-10-31 18:47:17.272','2022-10-31 18:47:28.130','/menu/option','GET','菜单选项列表(树形)',7,0),(42,'2022-10-31 18:48:04.780','2022-10-31 18:48:04.780','/menu/user/list','GET','获取当前用户菜单',7,0),(43,'2022-10-31 19:20:35.427','2022-10-31 19:20:35.427','/article/list','GET','文章列表',3,0),(44,'2022-10-31 19:21:02.096','2022-10-31 19:21:02.096','/article/:id','GET','文章详情',3,0),(45,'2022-10-31 19:26:04.763','2022-10-31 19:26:09.709','/article','POST','新增/编辑文章',3,0),(46,'2022-10-31 19:26:36.453','2022-10-31 19:26:36.453','/article/soft-delete','PUT','软删除文章',3,0),(47,'2022-10-31 19:26:52.344','2022-10-31 19:26:52.344','/article','DELETE','删除文章',3,0),(48,'2022-10-31 19:27:07.731','2022-10-31 19:27:07.731','/article/top','PUT','修改文章置顶',3,0),(49,'2022-10-31 20:19:55.588','2022-10-31 20:19:55.588','','','分类模块',0,0),(50,'2022-10-31 20:20:03.400','2022-10-31 20:20:03.400','','','标签模块',0,0),(51,'2022-10-31 20:22:03.799','2022-10-31 20:22:03.799','/category/list','GET','分类列表',49,0),(52,'2022-10-31 20:22:28.840','2022-10-31 20:22:28.840','/category','POST','新增/编辑分类',49,0),(53,'2022-10-31 20:31:04.577','2022-10-31 20:31:04.577','/category','DELETE','删除分类',49,0),(54,'2022-10-31 20:31:36.612','2022-10-31 20:31:36.612','/category/option','GET','分类选项列表',49,0),(55,'2022-10-31 20:32:57.112','2022-10-31 20:33:13.261','/tag/list','GET','标签列表',50,0),(56,'2022-10-31 20:33:29.080','2022-10-31 20:33:29.080','/tag','POST','新增/编辑标签',50,0),(57,'2022-10-31 20:33:39.992','2022-10-31 20:33:39.992','/tag','DELETE','删除标签',50,0),(58,'2022-10-31 20:33:53.962','2022-10-31 20:33:53.962','/tag/option','GET','标签选项列表',50,0),(59,'2022-10-31 20:35:05.647','2022-10-31 20:35:05.647','/message/list','GET','留言列表',6,0),(60,'2022-10-31 20:35:25.551','2022-10-31 20:35:25.551','/message','DELETE','删除留言',6,0),(61,'2022-10-31 20:36:20.587','2022-10-31 20:36:20.587','/message/review','PUT','修改留言审核',6,0),(62,'2022-10-31 20:37:04.637','2022-10-31 20:37:04.637','/comment/list','GET','评论列表',9,0),(63,'2022-10-31 20:37:29.779','2022-10-31 20:37:29.779','/comment','DELETE','删除评论',9,0),(64,'2022-10-31 20:37:40.317','2022-10-31 20:37:40.317','/comment/review','PUT','修改评论审核',9,0),(65,'2022-10-31 20:38:30.506','2022-10-31 20:38:30.506','/role/list','GET','角色列表',8,0),(66,'2022-10-31 20:38:50.606','2022-10-31 20:38:50.606','/role','POST','新增/编辑角色',8,0),(67,'2022-10-31 20:39:03.752','2022-10-31 20:39:03.752','/role','DELETE','删除角色',8,0),(68,'2022-10-31 20:39:28.232','2022-10-31 20:39:28.232','/role/option','GET','角色选项',8,0),(69,'2022-10-31 20:44:22.622','2022-10-31 20:44:22.622','','','友链模块',0,0),(70,'2022-10-31 20:44:41.334','2022-10-31 20:44:41.334','/link/list','GET','友链列表',69,0),(71,'2022-10-31 20:45:01.150','2022-10-31 20:45:01.150','/link','POST','新增/编辑友链',69,0),(72,'2022-10-31 20:45:12.406','2022-10-31 20:45:12.406','/link','DELETE','删除友链',69,0),(74,'2022-10-31 20:46:48.330','2022-10-31 20:47:01.505','','','用户信息模块',0,0),(78,'2022-10-31 20:51:15.607','2022-10-31 20:51:15.607','/user/list','GET','用户列表',74,0),(79,'2022-10-31 20:55:15.496','2022-10-31 20:55:15.496','/setting/blog-config','GET','获取博客设置',11,0),(80,'2022-10-31 20:55:48.257','2022-10-31 20:55:48.257','/setting/about','GET','获取关于我',11,0),(81,'2022-10-31 20:56:21.722','2022-10-31 20:56:21.722','/setting/blog-config','PUT','修改博客设置',11,0),(82,'2022-10-31 21:57:30.021','2022-10-31 21:57:30.021','/user/info','GET','获取当前用户信息',74,0),(84,'2022-10-31 22:06:18.348','2022-10-31 22:07:38.004','/user','PUT','修改用户信息',74,0),(85,'2022-11-02 11:55:05.395','2022-11-02 11:55:05.395','/setting/about','PUT','修改关于我',11,0),(86,'2022-11-02 13:20:09.485','2022-11-02 13:20:09.485','/user/online','GET','获取在线用户列表',74,0),(91,'2022-11-03 16:42:31.558','2022-11-03 16:42:31.558','','','操作日志模块',0,0),(92,'2022-11-03 16:42:49.681','2022-11-03 16:42:49.681','/operation/log/list','GET','获取操作日志列表',91,0),(93,'2022-11-03 16:43:04.906','2022-11-03 16:43:04.906','/operation/log','DELETE','删除操作日志',91,0),(95,'2022-11-05 14:22:48.240','2022-11-05 14:22:48.240','/home','GET','获取后台首页信息',11,0),(98,'2022-11-29 23:35:42.865','2022-11-29 23:35:42.865','/user/offline','DELETE','强制离线用户',74,0),(99,'2022-12-07 20:48:05.939','2022-12-07 20:48:05.939','/user/current/password','PUT','修改当前用户密码',74,0),(100,'2022-12-07 20:48:35.511','2022-12-07 20:48:35.511','/user/current','PUT','修改当前用户信息',74,0),(101,'2022-12-07 20:55:08.271','2022-12-07 20:55:08.271','/user/disable','PUT','修改用户禁用',74,0),(102,'2022-12-08 15:43:15.421','2022-12-08 15:43:15.421','','','页面模块',0,0),(103,'2022-12-08 15:43:26.009','2022-12-08 15:43:26.009','/page/list','GET','页面列表',102,0),(104,'2022-12-08 15:43:38.570','2022-12-08 15:43:38.570','/page','POST','新增/编辑页面',102,0),(105,'2022-12-08 15:43:50.879','2022-12-08 15:43:50.879','/page','DELETE','删除页面',102,0),(106,'2022-12-16 11:53:57.989','2022-12-16 11:53:57.989','','','文件模块',0,0),(107,'2022-12-16 11:54:20.891','2022-12-16 11:54:20.891','/upload','POST','文件上传',106,0),(108,'2022-12-18 01:34:47.800','2022-12-18 01:34:47.800','/article/export','POST','导出文章',3,0),(109,'2022-12-18 01:34:59.255','2022-12-18 01:34:59.255','/article/import','POST','导入文章',3,0);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色名',
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `is_disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用(0-否 1-是)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'2022-10-20 21:24:28.000','2022-12-18 01:35:08.118','管理员','admin',0),(2,'2022-10-20 21:25:07.000','2022-12-08 15:44:09.091','用户','user',0),(3,'2022-10-20 21:25:09.000','2022-12-08 15:44:13.917','测试','test',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menu` (
  `role_id` bigint DEFAULT NULL,
  `menu_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (2,1),(2,2),(2,6),(2,8),(2,9),(2,10),(2,3),(2,25),(2,26),(2,16),(2,17),(2,23),(2,24),(2,4),(2,27),(2,28),(2,29),(2,5),(2,30),(2,32),(2,31),(2,33),(2,34),(2,36),(2,37),(2,38),(2,39),(3,1),(3,2),(3,3),(3,4),(3,33),(3,6),(3,34),(3,8),(3,9),(3,10),(3,25),(3,26),(3,16),(3,17),(3,23),(3,24),(3,5),(3,29),(3,30),(3,32),(3,31),(3,27),(3,28),(3,36),(3,37),(3,38),(3,39),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,16),(1,17),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,36),(1,37),(1,38),(1,34),(1,10),(1,39);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_resource`
--

DROP TABLE IF EXISTS `role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_resource` (
  `role_id` bigint DEFAULT NULL,
  `resource_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_resource`
--

LOCK TABLES `role_resource` WRITE;
/*!40000 ALTER TABLE `role_resource` DISABLE KEYS */;
INSERT INTO `role_resource` VALUES (2,43),(2,44),(2,59),(2,38),(2,42),(2,65),(2,68),(2,62),(2,35),(2,36),(2,51),(2,54),(2,55),(2,58),(2,70),(2,78),(2,82),(2,79),(2,80),(2,86),(2,92),(2,95),(2,41),(2,103),(3,43),(3,44),(3,59),(3,38),(3,41),(3,42),(3,65),(3,68),(3,62),(3,35),(3,36),(3,79),(3,80),(3,51),(3,54),(3,55),(3,58),(3,70),(3,78),(3,82),(3,92),(3,95),(3,86),(3,103),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,6),(1,59),(1,60),(1,61),(1,7),(1,38),(1,39),(1,40),(1,41),(1,42),(1,8),(1,65),(1,66),(1,67),(1,68),(1,9),(1,62),(1,63),(1,64),(1,10),(1,23),(1,34),(1,35),(1,36),(1,37),(1,79),(1,80),(1,81),(1,85),(1,49),(1,51),(1,52),(1,53),(1,54),(1,50),(1,55),(1,56),(1,57),(1,58),(1,69),(1,70),(1,71),(1,72),(1,91),(1,92),(1,93),(1,78),(1,82),(1,84),(1,86),(1,98),(1,95),(1,11),(1,99),(1,100),(1,101),(1,74),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,109),(1,108),(1,3);
/*!40000 ALTER TABLE `role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'2022-12-03 22:01:51.624','2022-12-03 22:01:51.624','Golang'),(2,'2022-12-03 22:01:56.984','2022-12-03 22:01:56.984','Vue'),(3,'2022-12-24 12:07:29.000','2022-12-24 12:07:29.000','学习');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_auth` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `user_info_id` bigint DEFAULT NULL COMMENT '用户信息ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `login_type` tinyint(1) DEFAULT NULL COMMENT '登录类型',
  `ip_address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP地址',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IP来源',
  `last_login_time` datetime(3) DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT INTO `user_auth` VALUES (1,'2022-10-31 21:54:11.040','2023-06-18 20:22:00.927',1,'RainyAfterTomorrow','$2a$10$3QzNSbQ7LZaupyRggER80.DsnBYVAe6m869IhXiRGpUwp./mLa8Gm',1,'172.31.46.51','内网IP','2023-06-18 20:22:00.927');
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像地址',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人简介',
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人网站',
  `is_disable` tinyint(1) DEFAULT NULL COMMENT '是否禁用(0-否 1-是)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'2022-10-31 21:54:10.935','2022-12-16 23:42:32.109','','画中蝉','https://www.bing.com/rp/ar_9isCNU2Q-VG1yEDDHnx8HAFQ.png','我是管理员用户！','https://www.ipoluo.com',0);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` bigint DEFAULT NULL,
  `role_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gvb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-18 20:25:48
