print("***********泛型类的替换***********")

--泛型类 T是可以变化的，那lua中应该怎么替换呢
--lua中的替换要 一个类型一个类型的进行替换
--
xlua.hotfix(CS.HotfixTest2(CS.System.String),{
	Test = function(self,str)
		print("lua中打的补丁"..str)
	end
})

xlua.hotfix(CS.HotfixTest2(CS.System.Int32),{
	Test = function(self,str)
		print("lua中打的补丁"..str)
	end
})