print("****元表****")

print("****01.元表概念****")
--任何表变量都可以作为另一个表变量的元素
--任何表变量都可以有自己的元表（爸爸）
--当我们子表中进行一些特定操作时
--会执行元表中内容


print("****02.设置元表****")
meta = {}
myTable = {}
--设置元表函数
--第一个参数 子表
--第二个参数 元表（爸爸）
setmetatable(myTable,meta)

print("****--特定操作--****")
print("****特定操作01： __tostring ****")
meta2 = {
	--当子表要被当作字符串使用时 会默认调用这个元表中的tostring方法
	__tostring = function(t)
		return t.name
	end
}
myTable2 = {
	name = "小王"
}
--设置元表函数
setmetatable(myTable2,meta2)
--子表被当作字符串使用
print(myTable2)



print("****特定操作02： __call ****")
meta3 = {
	--当子表要被当作字符串使用时 会默认调用这个元表中的tostring方法
	__tostring = function(t) 
		return t.name
	end,

	--当子表被当作一个函数来使用时 会默认调用 这个__call中的内容
	__call = function(a,b)	--这里第一个参数默认时 子表自己（这里就是myTable3）
		print(a)	--打印了小王
		print(b)	--这里打印的才是传进来的1
		print("调用了__call")
	end
}
myTable3 = {
	name = "小王"
}
setmetatable(myTable3,meta3)
--当子表被当作一个函数来使用时 会默认调用 这个__call中的内容
myTable3(1)


print("****特定操作-运算符重载****")
meta4 = {
	--__add相当于+的运算符重载，当子表使用+运算符时，会调用该方法;;
	__add = function(t1,t2)
		return t1.age + t2.age
	end,

	--__运算符-
	__sub = function(t1,t2)
		return 1
	end
	,
		--__运算符*
	__mul = function(t1,t2)
		return 2
	end,
		--__运算符/
	__div = function(t1,t2)
		return 3
	end,
		--__运算符%
	__mod = function(t1,t2)
		return 4
	end,
		--__运算符^
	__pow = function(t1,t2)
		return 5
	end,
		--__运算符==
	__eq = function(t1,t2)
		return true
	end,
		--__运算符<
	__lt = function(t1,t2)
		return true
	end,
		--__运算符<=
	__le = function(t1,t2)
		return true
	end,
		--__运算符..
	__concat = function(t1,t2)
		return "315"
	end
}
myTable4 = {
	age =1
}
myTable5={
	age = 2
}
setmetatable(myTable4,meta4)
setmetatable(myTable5,meta4)

print(myTable4 + myTable5)

print(myTable4 - myTable5)
print(myTable4 * myTable5)
print(myTable4 / myTable5)
print(myTable4 % myTable5)
print(myTable4 ^ myTable5)

--如果要用条件运算符 来 比较 两个对象
--这两个对象的元表一定要一致，才能准确调用方法
print(myTable4 == myTable5)
print(myTable4 <= myTable5)
print(myTable4 < myTable5)



print("****特定操作-__index 和 __newindex")
meta6 ={
	age = 1
}
--meta6.__index = {age = 2}
-- __index的赋值 建议写在表外面 来初始化
meta6.__index = meta6
myTable6 = {}
setmetatable(myTable6,meta6)

--__index 当子表中 找不到某一个属性时
--会到元表 __index 指定的表去找索引，一直找，直到找不到才返回nil
print(myTable6.age)


--newindex 当赋值时，如果赋值一个不存在的索引
--那么会把这个值 赋值到 newindex 所指的表中，不会修改自己
meta7 = {}
meta7.__newindex = {}
myTable7 = {}
setmetatable(myTable7,meta7)
myTable7.age = 7
print(myTable7.age)
print(meta7.__newindex.age)


--获取元表
print(getmetatable(myTable7))
--rawget 当我们使用它时，会去找自己身上有没有这个变量
print(rawget(myTable7,"age"))
--rawset 该方法会忽略newindex 的设置 指挥改自己的变量
rawset(myTable7,"age",2)
print(myTable7.age)