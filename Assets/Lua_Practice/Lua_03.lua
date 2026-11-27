print("****字符串****")
str="双引号字符串"
str='单引号字符串'
str="双引号和单引号一样，lua中都是表示字符串，没有char"

print("****01, #表示获取字符串的长度 ****")
str = "aBc"
print(#str)
str ="一个汉字表示三个字符串"
print(#str)

print("****02,字符串多行打印****")
--01,加\n
str ="Abcd\n123"
print(str)

--02多行打印
print("转义字符\n多行打印")
s= [[
这是第一行
这是第二行
]]
print(s)

print("****03字符串拼接****")
print("12..34")
s1="123"
s2='321'
print(s1..s2)	--123321

--`string.Format` 作用：**格式化字符串，把变量填到模板里**
print(string.format("我今年%d岁了",18))
--%d : 数字拼接
-- %s 专门用来放字符串（文本）
print(string.format("你好%s先生",'王'))
print(string.format("我是%s","小红"))

print("****别的类型转字符串****")
a=true	
print(tostring(a))

print("****字符串方法****")
--01.大小写转换
str = "AbCdME"
print(string.upper(str))
print(string.lower(str))
--02.字符串查找
print(string.find(str,"Ab"))	--1 2
print(string.find(str,"b"))		--2 2

--03.反转字符串
print(string.reverse(str))

--04.截取字符串
print(string.sub(str,3,4))	--Cd

--05.字符串重复
print(string.rep(str,2))

--06.字符串修改
print(string.gsub(str,"Ab","****"))	--****CdME	1

--07.字符转 ASCII N码
a = string.byte("Lua",1)
print(a)	--76
print(string.char(a))	--L