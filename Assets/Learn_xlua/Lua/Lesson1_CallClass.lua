print("***********Lua调用C#类相关知识点***********")

--01.
--lua中使用C#类简单固定：
--CS.命名空间.类名
--Unity的类 比如GameObject，Transform 等等，--CS.UnityEngine.类名
--CS.UnityEngine.GameObject

--02.
--通过C#中的类实例化对象
--lua中没有new，所以直接类名括号就是实例化对象
--默认调用的 相当于无构造参数
local obj1 = CS.UnityEngine.GameObject()
local obj2 = CS.UnityEngine.GameObject("小林")

--为了方便使用，并且节约性能，定义全局变量存储C#中的类
GameObject = CS.UnityEngine.GameObject
local obj3 = GameObject("全局简写版")

--03.
--类中的静态对象，可以直接使用 类名. 来调用
local obj4 = GameObject.Find("小林") 
Debug = CS.UnityEngine.Debug
Debug.Log(obj4.transform.position)

--如果使用对象中的 成员方法 ，一定要使用: （默认把自己传进去当第一个参数）
Vector3 = CS.UnityEngine.Vector3
obj4.transform:Translate(Vector3.right)
Debug.Log(obj4.transform.position)

--04.
--调用CSharp中的有无命名空间的类
--自定义类 使用方法相同，知识命名空间不同而已
--[[第一行通过 xLua 的 CS 访问 C# 类型 Test1，创建一个实例，交给 Lua 的局部变量 t1。
第二行才调用那个实例上的 Speak 方法。
冒号 : 会把 t1 作为调用对象传给 xLua，所以可以把这一行理解为 “让 t1 这个对象执行 Speak，
字符串参数是 Test1的Speak”]]

local t1 = CS.Test1()
t1:Speak("Test1的Speak")

local t2 = CS.MrWang.Test2()
t2:Speak("Test2的Speak")

--05.
--继承了Mono的类,是不能直接new
local obj5 = GameObject("添加脚本测试")
--通过GameObject的AddComponent添加脚本
--xlua提供了一个重要方法，typeof 可以得到类的Type
--xlua中不支持 无参泛型函数，所以，我们要使用另一个重载
obj5:AddComponent(typeof(CS.UnityEngine.BoxCollider2D))
obj5:AddComponent(typeof(CS.LuaCallCSharp))

