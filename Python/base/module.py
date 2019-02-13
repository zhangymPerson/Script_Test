#!/bin/env python
#_*_coding:utf-8_*_

########################
#该脚本作为模块被别的模块调用
# 
########################


'''
python 函数格式

def functionname( parameters ):
   "函数_文档字符串"
   function_suite
   return [expression]
'''
def println(str):
    print "您要打印的信息为:%s"%str
    return 


'''
使用return func 时返回的是func 这个函数；

使用return func() 时返回的是func() 执行后的返回值

'''
def funcone(x,y):
    return x+y




'''
DocStrings 文档字符串是一个重要工具，用于解释文档程序，帮助你的程序文档更加简单易懂。

格式:

	DocStrings 文档字符串使用惯例：它的首行简述函数功能，第二行空行，第三行为函数的具体描述。

'''

def doctest():
    '''
    测试DocStrings使用

    在main()函数中测试DocStrings的函数
    '''
    print "测试语句"







def main():
    print "当前main方法执行了:"+__name__
    println("测试函数调用")
    #测试fun fun()区别
    print type(funcone)
    print type(funcone(1,2))

    #测试DocStrings
    #使用函数名可以查看函数说明 funname.__doc__
    print doctest.__doc__

'''
这一段可以让当前脚本既能单独执行，也可以作为模块被别的py调用 通过 import **.py 导入来调用
'''
if __name__ == '__main__':
    main()

