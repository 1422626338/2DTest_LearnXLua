print("***运算符***")


print("***01.算数运算符***")
--  ： + - * / % ^
--  : 没有自增和自减，没有符合运算符 += -= /= *= %=
--  ：字符串 可以进行 算术运算符操作，会自动转成number
print("加法运算".. 1 + 2)	--3
print("123.2"+1)			--124.2
a=10
b="21"
print(a+b)	--31
--其他同理
print("减法运算".. 1 - 2)	-- -1
print("123.2"-1)			--122.2
a=10
b="21"
print(a-b)	-- -11

print("除法运算".. 1 / 2)	-- 0.5	有小数

print("取余运算".. 1 % 2)	-- 1

print("幂运算（取次方）"..2^3)	--8



print("***02.条件运算符***")
-- > < >= <= == 
--不等于是：~=
print(1==2)	--false
print(3~=2)	--true


print("***03.逻辑运算符***")
print("and、or、not")	--同样有“短路”功能（前面的条件满足了，后面就不会执行了）
print(true and false)--false
print(true or false)--true
print(not false)--true


print("***位运算符***")
--不支持 & |


print("***三目运算符***")
--不支持 ?: