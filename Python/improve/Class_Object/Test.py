#!/usr/bin/env python 
#_*_coding:utf-8_*_
'''

如果是在同一个 module中(也就是同一个py 文件里),直接用就可以
如果在不同的module里,例如
a.py里有 class A:
b.py 里有 class B:
如果你要在class B里用class A 需要在 b.py的开头写上 from a import A

'''
from People import People

def main():
    print "test begining"
    peoOne=People("zym","16","男")
    peoOne.displayCount()

if __name__=='__main__':
    main()
