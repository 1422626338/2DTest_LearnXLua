print("***********事件加减替换***********")

xlua.hotfix(CS.HotfixMain,{
	--add_事件名 代表事件 加 操作
	--remove_事件名 代表事件 减 操作
	add_myEvent = function ( self,del)
		print(del)
		print("添加事件函数")
	end,
	remove_myEvent = function (self,del)
		print(del)
		print("移除事件函数")
	end
})