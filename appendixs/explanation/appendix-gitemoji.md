# Git Emoji



**关于 emoji 使用约定**

主要场景是 `changelogs` 可在 `git rebase` 时时统一加上。

**基础**

* 🎉——**初始化**
* * feat\($init\): :tada: 初步完成 lerna 项目框架结构，并添加 commitlint, prettier 等规范约束
* ✨——**特性**
* * feat\($pkg=babel-preset-symbols\): :spark: 添加 react typescript env 配置项入口
* 🔬——**测试**
* * test\($pkg=eslint-config-symbols\): 🔬 [\#1](https://github.com/o-w-o/ink/issues/'')
* 🐛——**问题修复**
* * fix\($pkg=eslint-config-symbols\): 🐛  [\#1](https://github.com/o-w-o/ink/issues/'')
* 🔖——**版本发布**
* * chore\($release\): 🔖 publish v1.0.1-alpha.0
* 💥——**不兼容更新**
* * refactor\($pkg=eslint-config-symbols\): 💥 break change
* 🎨——**代码格式**
* * style\($pkg=babel-preset-symbols\): 🎨 lint code
* 🔥——**重构**
* * refactor\($pkg=eslint-config-symbols\): 🔥 项目结构 app/model mv app/mongoose
* ⚡️——**性能**
* * perf\($helper=is\): ⚡️ response handler strategy
* 📝——**文档**
* * doc\($readme\): 📝 完善 项目说明
* 🔨——**构建**
* * feat\($docker\): 🔨 新增 docker 部署配置
* ♻️ ——**回退**
* * revert: ♻️ feat\(pencil\): add 'graphiteWidth' option
* ⭕️ \| ❌ \| 🔜 \| 🔙——**依赖变更**
* * chroe\($npm\): ❌ 删除 file-saver 依赖，⭕️ 新增 @o-w-o/io 依赖，🔜 升级，🔙 降级

**额外**

* ![](https://gw.alipayobjects.com/os/lib/twemoji/11.2.0/2/svg/1f4a1.svg)  **想法**
* ![](https://gw.alipayobjects.com/os/lib/twemoji/11.2.0/2/svg/1f514.svg)  **警告，提示**
* 🔗  **连接**
* ![](https://gw.alipayobjects.com/os/lib/twemoji/11.2.0/2/svg/1f691.svg)  **紧急修复**

