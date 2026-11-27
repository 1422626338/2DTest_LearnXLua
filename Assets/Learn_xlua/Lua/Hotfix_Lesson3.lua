print("***********协程函数替换***********")

--xlua.hotfix(类,{函数名 = 函数,函数名 = 函数.....})
--要在lua中配合C#协程函数，必须要使用 require（"xlua.util"）
util = require("xlua.util")

xlua.hotfix(CS.HotfixMain, {
	TestCoroutine = function ( self )
		--这里返回的是一个真正的 xlua处理过的lua协程函数
		return	 util.cs_generator(function()
			while true do	
				coroutine.yield(CS.UnityEngine.WaitForSeconds(1))
				print	("lua打补丁后的协程函数")
			end
		end)
	end
})

