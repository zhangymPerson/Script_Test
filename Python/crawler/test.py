#!/usr/bin/env python
#_*_coding:utf-8_*_
'''
Python测试
'''
def test():
    print "test"

'''
Python 中的脚本作为模块时，需要调试需按照一下方法编写脚本

可单独运行此脚本，不运行整个项目

单独运行本脚本 __name__ = __main__

别的脚本中导入 __name__ = __脚本名__

'''
def main(args):
    print "参数为:%s"%args 
    print "__main__ = %s"%__name__ 


test()


if __name__ == '__main__':
    main("test" )
