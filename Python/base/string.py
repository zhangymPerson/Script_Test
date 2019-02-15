#!/usr/bin/env python
#_*_coding:utf-8_*_



'''
打印1个的%s
打印多个%s

testone="123"
testtwo="123"
testthree="123"
testfore="123"
print "测试 %s" %testone

print "测试打印多个 %s "%s" %s %s"%(testone,testtwo,testthree,testfore)
'''

testone="123"
testtwo="123"
testthree="123"
testfore="123"
print "测试 %s" %testone

print '测试打印多个 %s "%s" %s %s'%(testone,testtwo,testthree,testfore)
print "测试打印多个 %s \"%s\" %s %s"%(testone,testtwo,testthree,testfore)


def printStr(strs):
    print "要打印的字符串为: %s"% strs

def printStrs(strsone,strstwo):
    print "要打印的字符串为:%s 和 %s"%(strsone,strstwo)




def main():
    print "String 字符串演示："
    printStr("测试打印一个字符串的函数调用")
    printStrs("测试打印多个字符串的函数调用", "测试打印多个字符串的函数调用")

'''
注意：python __name__ == '__main__'

不能写成__name__=='__main()__'
'''
if __name__=='__main__':
    main()







'''
---
%下输出的格式有:
%s    字符串 (采用str()的显示)

%r    字符串 (采用repr()的显示)

%c    单个字符

%b    二进制整数

%d    十进制整数

%i    十进制整数

%o    八进制整数

%x    十六进制整数

%e    指数 (基底写为e)

%E    指数 (基底写为E)

%f    浮点数

%F    浮点数，与上相同

%g    指数(e)或浮点数 (根据显示长度)

%G    指数(E)或浮点数 (根据显示长度)

%%    字符"%"
---
#%s的情况
string="hello"    
    
#%s打印时结果是hello    
print "string=%s" % string      # output: string=hello    
    
#%2s意思是字符串长度为2，当原字符串的长度超过2时，按原长度打印，所以%2s的打印结果还是hello    
print "string=%2s" % string     # output: string=hello    
    
#%7s意思是字符串长度为7，当原字符串的长度小于7时，在原字符串左侧补空格，    
#所以%7s的打印结果是  hello    
print "string=%7s" % string     # output: string=  hello    
    
#%-7s意思是字符串长度为7，当原字符串的长度小于7时，在原字符串右侧补空格，    
#所以%-7s的打印结果是  hello    
print "string=%-7s!" % string     # output: string=hello  !    
    
#%.2s意思是截取字符串的前2个字符，所以%.2s的打印结果是he    
print "string=%.2s" % string    # output: string=he    
    
#%.7s意思是截取字符串的前7个字符，当原字符串长度小于7时，即是字符串本身，    
#所以%.7s的打印结果是hello    
print "string=%.7s" % string    # output: string=hello    
    
#%a.bs这种格式是上面两种格式的综合，首先根据小数点后面的数b截取字符串，    
#当截取的字符串长度小于a时，还需要在其左侧补空格    
print "string=%7.2s" % string   # output: string=     he    
print "string=%2.7s" % string   # output: string=hello    
print "string=%10.7s" % string  # output: string=     hello    
    
#还可以用%*.*s来表示精度，两个*的值分别在后面小括号的前两位数值指定    
print "string=%*.*s" % (7,2,string)      # output: string=     he

-----------
#%d测试
num=14    
    
#%d打印时结果是14    
print "num=%d" % num            # output: num=14    
    
#%1d意思是打印结果为1位整数，当整数的位数超过1位时，按整数原值打印，所以%1d的打印结果还是14    
print "num=%1d" % num           # output: num=14    
    
#%3d意思是打印结果为3位整数，当整数的位数不够3位时，在整数左侧补空格，所以%3d的打印结果是 14    
print "num=%3d" % num           # output: num= 14    
    
#%-3d意思是打印结果为3位整数，当整数的位数不够3位时，在整数右侧补空格，所以%3d的打印结果是14_    
print "num=%-3d" % num          # output: num=14_    
    
#%05d意思是打印结果为5位整数，当整数的位数不够5位时，在整数左侧补0，所以%05d的打印结果是00014    
print "num=%05d" % num          # output: num=00014    
    
#%.3d小数点后面的3意思是打印结果为3位整数，    
#当整数的位数不够3位时，在整数左侧补0，所以%.3d的打印结果是014    
print "num=%.3d" % num          # output: num=014    
    
#%.0003d小数点后面的0003和3一样，都表示3，意思是打印结果为3位整数，    
#当整数的位数不够3位时，在整数左侧补0，所以%.3d的打印结果还是014    
print "num=%.0003d" % num       # output: num=014    
    
#%5.3d是两种补齐方式的综合，当整数的位数不够3时，先在左侧补0，还是不够5位时，再在左侧补空格，    
#规则就是补0优先，最终的长度选数值较大的那个，所以%5.3d的打印结果还是  014    
print "num=%5.3d" % num         # output: num=  014    
    
#%05.3d是两种补齐方式的综合，当整数的位数不够3时，先在左侧补0，还是不够5位时，    
#由于是05，再在左侧补0，最终的长度选数值较大的那个，所以%05.3d的打印结果还是00014    
print "num=%05.3d" % num        # output: num=00014    
    
#还可以用%*.*d来表示精度，两个*的值分别在后面小括号的前两位数值指定    
#如下，不过这种方式04就失去补0的功能，只能补空格，只有小数点后面的3才能补0    
print "num=%*.*d" % (04,3,num)  # output: num= 014
'''








