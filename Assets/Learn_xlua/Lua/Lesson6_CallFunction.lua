print("***********Lua调用C# 重载函数 相关知识点***********")
local obj = CS.Lesson6()

--虽然Lua自己不支持写重载函数
--但是Lua支持调用C#中的重载函数
print(obj:Calc())
print(obj:Calc(5,6))

--Lua中调用C#的重载函数时，尽量避免重载函数精度不同
--Lua中 值类型只有Number，对C#中多精度的重载函数支持不好，分不清楚
--在使用不同精度的重载函数，有意想不到的问题
print(obj:Calc(10))
print(obj:Calc(5.2))