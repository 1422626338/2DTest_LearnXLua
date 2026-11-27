print("变量")
--lua中常用的变量
--nil number string boolean

--lua 中的一个变量可以随便赋值，自动识别

--01  nil,有点类似C#中的null
print("****打印****")
a= nil
print(a)

--02，一个变量可以随便赋值，自动识别
print("****02****")
a=1;
print(a)
a=1.2
print(a)

--03，lua里没有char，字符串是用"" 或'' 来表示的
--print("**--03，lua里没有char**")
a='123'
print(a)
a="1234"
print(a)

--04,boolean
print("****04,boolean****")
a=true
print(a)
a=false
print(a)

--05, 通过type函数，我们可以得到变量的类型  （type函数返回值是string）
print("****05, 通过type函数，我们可以得到变量的类型 ****")
a=nil
print(type(a))
a=1
print(type(a))
a="01"
print(type(a))
a='02'
print(type(a))
a=true	
print(type(a))
print(type(type)) --打印function
print(type(type(a)))	--打印string（type函数返回值是string）

--06，lua中使用没有声明过的变量，不会报错，默认是nil
print("****--06，lua中使用没有声明过的变量，不会报错，默认是nil****")
print(b)





--复杂数据类型
--函数 function
--表 table
--数据结构 userdata
--协同程序 thread(线程) 