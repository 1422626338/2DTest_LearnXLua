print("***********第一个热补丁***********")

--热补丁必须要做到四步
--1.加特性[HotFix]	（在需要热补丁的C#类前加[HotFix]）
--2.加宏 （在PlayerSetting中Scripting Define Symbols 中 加HOTFIX_ENABLE）
--3.再次生成代码
--4.hotfix注入 （导入工具包Tools）
--缺点，只要修改了热补丁的代码，就要重新执行第四步

--lua中，热补丁代码固定
--xlua.hotfix（类，"函数名"，lua函数）

--Add 是实例方法
--实例方法有一个隐含的 this，代表当前对象。
--xLua 调用它的补丁函数时，会把这个对象放在第一个参数,所以要写self
xlua.hotfix(CS.HotfixMain,"Add",function(self,a,b)
	return	a+b
end)

--静态方法没有 this，所以补丁直接接收原方法的参数
xlua.hotfix(CS.HotfixMain,"Speak",function(a)
	print(a)	
end)

--成员函数 第一个参数要写self
xlua.hotfix(CS.HotfixMain,"Add",function(self,a,b)
	return	a+b
end)

--静态函数 不用传入第一个参数
xlua.hotfix(CS.HotfixMain,"Speak",function(a)
	print(a)	
end)
