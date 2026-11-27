print("****特殊用法****")
print("****01.多变量赋值****")
a,b,c = 1,2,"123"
print(a)
print(b)
print(c)

--多变量赋值，如果后面的值多了，会自动省略
a,b,c = 1,2,3,4,5

--如果后面的值少了，会自动nil
a ,b,c = 1,2
print(a)
print(b)
print(c)

print("****02.多返回值****")

function Test()
	return 10,20,30,40
end
--多去少补
a,b,c = Test()
print(a)
print(b)
print(c)

a,b,c,d,e = Test()
print(a)
print(b)
print(c)
print(d)
print(e)

print("****03.and or****")
--逻辑与 和 逻辑或
--and or 他们不仅可以连接boolean，任何东西都可以用来连接
--在lua中 ， 只有nil 和 false 才认为是假
--“短路”--对于and来说，有假则假，对应or来说，有真则真
--所以 他们只需判断 第一个是否满足 就会停止计算了
print(1 and 2)	--2
print(3 and 4)	--4
print(true and 1)	--1
print(false and 2)	--false
print(nil and true)	--nil

print(1 or 2)	--1
print(true or 2)	--true
print(false or 0)	--0
print(nil or 1)		--1


--lua中不支持？：三目运算符，但可以 用and 和or的短路特性来做
x =3
y =1
local res = (x>y)and x or y
print(res)	--3					3>1 and 3 ,返回后面的3，3 or 1，返回前面的3

x =2
y =4
local res = (x>y)and x or y
print(res)	--4					2>4 and 2,返回2>4， 2>4 or 4 ，返回4
