print("***********Lua调用C# 委托 相关知识点***********")
local obj = CS.Lesson7()

local fun = function()
	print("Lua函数")
end	


--开始添加函数
obj.del = fun 

obj.del = obj.del + fun --在已有的fun函数的基础上，再加一个fun函数

--Lua中 没有符合运算符，不能+=、
--不建议这样写
obj.del = obj.del + function()
	print("临时函数")
end

obj.del()

--开始减去函数
obj.del = obj.del - fun
obj.del = obj.del - fun
--委托执行
obj.del()
--清空所有存储的函数
obj.del = nil	
--清空过后先等
obj.del = fun
--调用
obj.del()


print("***********Lua调用C# 事件 相关知识点***********")
local fun2 = function()
	print("事件加的函数")
end

--事件加减函数 和 委托非常不一样
--lua中使用C#事件 加函数
--有点类似 使用成员方法 冒号事件名（"+",函数变量）
obj:eventAction("+",fun2)
--最好不要这样写：
obj:eventAction("+",function()
	print("事件的匿名函数")
end)

obj:DoEvent()

print("***********事件减***********")
obj:eventAction("-",fun2)
obj:DoEvent()	

print("***********事件清空***********")
obj:ClearEvent()
obj:DoEvent()
