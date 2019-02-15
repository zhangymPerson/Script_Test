#!/usr/bin/bash
#_*_coding:utf-8_*_
#自定义模块(包)的过程
#创建包名文件夹 在包名下创建__init__.py文件，可以为空，说明这是一个包
#在包中编写相应的代码逻辑
#调用包中的类或者函数
#同一个包中调用  from 脚本名 import 类名 as 别名
#不同的包中调用  from 包名.脚本名 import 类名 as 别名
'''
注意 ： 类要调用必须先创建类对象  创建不需要new关键字， 直接 
	#创建对象
	对象名 = 类名(参数)  
然后 对象名.属性 或者 对象名.函数名调用
 
'''

from myself_package.strutil import StringUtil as util

def main():
    u = util()
    u.test("Test Test");
    util.statictest("static");
if __name__ == '__main__':
    main()

