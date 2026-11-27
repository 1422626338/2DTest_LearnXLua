print("***********Lua调用C# 泛型 相关知识点***********")

local obj = CS.Lesson12()

local father = CS.Lesson12.TestFather()
local child = CS.Lesson12.TestChild()

--支持有约束有参数的泛型函数
obj:TestFun1(child,father)
obj:TestFun1(father,child)

--[[
--不支持没有约束的泛型函数
obj:TestFun2(child)

--不支持有约束但是没有参数的翻新函数
obj:TestFun3()

--不支持非class的泛型函数
obj:TestFun4(child)
]]--

--补充知识，让上面不支持使用的泛型函数，可以使用
--得到通用函数
--设置泛型类型再使用
--xlua.get_generic_method(类，"函数名")
local TestFun2 = xlua.get_generic_method(CS.Lesson12,"TestFun2")
local  TestFun2_R = TestFun2(CS.System.Int32)
--调用
--成员方法 第一个参数 传调用函数的对象
--静态方法 不用传
TestFun2_R(obj,1)