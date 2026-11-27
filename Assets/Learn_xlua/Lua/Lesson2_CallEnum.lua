print("***********Lua调用C#枚举相关知识点***********")

--枚举调用
--调用Unity当中的枚举
--枚举的调用规则 和 类 的调用规则一致
--CS.命名空间.枚举名.枚举成员
--也支持取别名
PrimitiveType = CS.UnityEngine.PrimitiveType
GameObject = CS.UnityEngine.GameObject
local obj1 = GameObject.CreatePrimitive(PrimitiveType.Cube)	--这里成功创建了个Cube物体

--自定义枚举 使用方法一样 知识注意命名空间即可
E_MyEnum = CS.E_MyEnum
local e1 = E_MyEnum.Idle
print(e1)

--枚举转换相关
--数值转枚举
local a = E_MyEnum.__CastFrom(0)
print(a)
--字符串转枚举
local b = E_MyEnum.__CastFrom("Atk")
print(b)