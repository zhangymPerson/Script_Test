#!/usr/bin/env python
#_*_coding:utf-8_*_


class StringUtil():
    def main():
        print "自定义模块测试"

    def test(self,strs):
        print "调用的打印的函数;"
        print "传入的参数是:%s"%strs

    @staticmethod    
    def statictest(strs):
        ' 不需要self参数    '
        print "静态方法调用-打印:%s"%strs
