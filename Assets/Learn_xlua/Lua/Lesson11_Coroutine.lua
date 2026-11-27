print("***********Lua调用C# 协程 相关知识点***********")
--C#中协程启动都是通过既继承了Mono类，通过里面的的启动函数StartCoroutine

util = require("xlua.util")

GameObject = CS.UnityEngine.GameObject
WaitForSeconds = CS.UnityEngine.WaitForSeconds
--在场景中新建一个空物体，然后挂一个脚本上去，脚本继承mono使用它来开启携程
local obj = GameObject("Coroutine")
local mono = obj:AddComponent(typeof(CS.LuaCallCSharp))	--AddComponent 返回【刚添加好的脚本组件实例】，这个组件继承自 MonoBehaviour

--希望用来被开启的协程函数
fun = function()
	local a = 1
	while true do 
		coroutine.yield(WaitForSeconds(1))
		print(a)
		a = a+1
		if a>10 then
			mono:StopCoroutine(b)
			return
		end
	end
end

b = mono:StartCoroutine(util.cs_generator(fun))