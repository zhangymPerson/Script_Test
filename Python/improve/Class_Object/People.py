#!/usr/bin/env python
#_*_coding:utf-8_*_

'''

第一种方法__init__()方法是一种特殊的方法，被称为类的构造函数或初始化方法，当创建了这个类的实例时就会调用该方法

self 代表类的实例，self 在定义类的方法时是必须有的，虽然在调用时不必传入相应的参数。

self代表类的实例，而非类
类的方法与普通的函数只有一个特别的区别——它们必须有一个额外的第一个参数名称, 按照惯例它的名称是 self。

'''



class People:
    '测试父类'
    strs="test"

    def __init__(self,name,age,sex):
        self.name=name
        self.age=age
        self.sex=sex

    def displayCount(self):
        print "Total Employee %s %s" % (People.strs, self.name)
 
    def displayEmployee(self):
        print "Name : ", self.name,  ", Salary: ", self.age
