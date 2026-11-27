print("***********Lua调用C# nil 和 null比较 相关知识点***********")
GameObject = CS.UnityEngine.GameObject
Rigidbody = CS.UnityEngine.Rigidbody

local obj = GameObject("测试添加脚本")
local rig = obj:GetComponent(typeof(Rigidbody))
print(rig)

--判断是否为空
--但是nil 和 null 无法进行==比较
--需要使用Equals方法,但是这种方法判断不完全，可能报错，建议再main中声明一个判空的全局函数
--[[if rig:Equals(nil) then 
	print("空")
	rig = obj:AddComponent(typeof(Rigidbody))
end	
print(rig)]]--

--if rig:Equals(nil) then 
--if IsNull(obj) then
if rig == nil or rig:IsNull()then
	print("123")
	rig = obj:AddComponent(typeof(Rigidbody))
end
print(rig)