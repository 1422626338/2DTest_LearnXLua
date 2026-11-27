print("***********Lua调用C#数组、list、字典相关知识点***********")

--声明一个Lesson3类对象
local obj = CS.Lesson3()

--Lua使用C#数组相关知识
--长度userdata
--C#怎么用 lua就怎么用，不能使用#去获取长度

--01.获取数组长度
print(obj.array.Length)
--访问元素
print(obj.array[0])

--02.数组得遍历
--遍历要注意，虽然lua中索引从1开始
--但是数组是C#那边的规则，索引还得按C#得来
--注意最大值一定要减1，（lua这里，能够取到最后面，是<=，所以要-1）
for i=0,obj.array.Length -1 do
	print(obj.array[i])
end	

--03.Lua中创建一个C#的数组（Lua中表示数组和List可以用表）
--但是我们要使用C#中的数组
--创建C#中的数组 使用Array类中的静态方法即可
local array2 = CS.System.Array.CreateInstance(typeof(CS.System.Int32),10)
print(array2.Length)
print(array2[0])
print(array2[2])


print("***********Lua调用C# list相关知识点***********")
--调用成员方法用：冒号
local obj2 = CS.Lesson3()
obj2.list:Add(1)	--这里C#中是int类型的
obj2.list:Add(2)
obj2.list:Add(5)
--长度
print("list长度："..obj2.list.Count)
--遍历
for i=0,obj2.list.Count-1 do
	print(obj2.list[i])
end
print(obj2.list)

--拿到 C# 泛型 `List<string>` 的类型
--C# 原版：`List<string>`,`CS.System.Collections.Generic.List` → C# 的 `List<T>` 泛型类本身
--List<String>
local List_String = CS.System.Collections.Generic.List(CS.System.String)
list3 = List_String()
list3:Add("555")
print(list3[0])

-- List<int>
local List_Int = CS.System.Collections.Generic.List(CS.System.Int32)
local listInt = List_Int()
listInt:Add(999)

-- List<GameObject>
local List_GO = CS.System.Collections.Generic.List(CS.UnityEngine.GameObject)


print("***********Lua调用C# Dictionary相关知识点***********")
--使用和C#一致
local obj3 = CS.Lesson3()
obj3.dic:Add(1,"123")
print(obj3.dic[1])	--取字典里 key = 1 对应的 value
--遍历
for k,v in pairs(obj3.dic) do
	print(k,v)
end	

--在Lua中创建一个字典对象
--相当于得到了一个Dictionary<string,vector3>的一个类别名，需要再实例化
local Dic_String_Vector3 = CS.System.Collections.Generic.Dictionary(CS.System.String,CS.UnityEngine.Vector3)
local dic2 = Dic_String_Vector3()
dic2:Add("123",CS.UnityEngine.Vector3.right)
for i,v in pairs(dic2) do
	print(i,v)
end

--在lua中创建的字典，直接通过键中括号得，得不到，是nil
--需要使用固定方法 get_Item("123")
print(dic2["123"])	--nil
print(dic2:TryGetValue("123"))	--多返回值得到“123”的值
print(dic2:get_Item("123"))
dic2:set_Item("123",nil)	--1,0,0
print(dic2:get_Item("123"))	--0
