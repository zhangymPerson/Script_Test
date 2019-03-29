# vue安装使用笔记

```sh
#大家都知道国内直接使用 npm 的官方镜像是非常慢的，这里推荐使用淘宝 NPM 镜像。
#
npm install -g cnpm --registry=https://registry.npm.taobao.org
#这样就可以使用 cnpm 命令来安装模块了：
#
cnpm install [name]
#安装webpack
cnpm install webpack -g
#安装vue脚手架
npm install vue-cli -g
#
#在硬盘上找一个文件夹放工程用的，在终端中进入该目录
cd 目录路径
#根据模板创建项目
vue init webpack-simple 工程名字<工程名字不能用中文>
#或者创建 vue1.0 的项目
vue init webpack-simple#1.0 工程名字<工程名字不能用中文>
#
#会有一些初始化的设置，如下输入:
#Target directory exists. Continue? (Y/n)直接回车默认(然后会下载 vue2.0模板，这里可能需要连代理)
#Project name (vue-test)直接回车默认
#Project description (A Vue.js project) 直接回车默认
#Author 写你自己的名字
```
