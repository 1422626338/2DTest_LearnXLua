print("***********Lua调用C# 拓展方法 相关知识点***********")

--使用静态方法
--CS.命名空间.类名.静态方法名()
Lesson4 = CS.Lesson4
Lesson4.Eat()

--成员方法：实例化出来使用;一定要用 ： 冒号
local obj1 = Lesson4()
obj1:Speak("你好hhh")

--使用拓展方法和使用成员方法一致 拓展方法不是static吗，为什么要用:来调用呢？
--因为Move 虽然是静态方法，但是他需要传入一个Lesson4 对象作为参数
obj1:Move()