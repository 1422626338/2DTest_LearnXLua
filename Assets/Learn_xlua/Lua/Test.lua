print("Test.Lua")
testNumber = 1;
testBool = true
testFloat = 1.2;
testDouble = 3.1415926
testString = "123"

--我们通过C#没办法获取本地局部变量
local testLocal = 22


--lua中的函数
--无参无返回值
testFun = function()
	print("无参无返回值")
end	

--有参有返回值
testFun2 = function(a)
	print("有参有返回值")
	return a+1
end

--多返回值
testFun3 = function(a)
	print("多返回值")
	return 1,2,false,"123",a
end

--变长参数
testFun4 = function(a,...)
	print("变长参数")
	print(a)
	arg = {...}
	for k,v in pairs(arg) do
		print(k,v)
	end
end



--List
testList = {1,2,3,4,5,6}
testList2 = {"123","123",true,1,5.3}

--Dictionary
--一个键为string，值为int的字典
testDic = {
	["1"] = 1,
	["2"] = 2,
	["3"] = 3,
	["4"] = 4
}

testDic2 = {
	["1"] = 1,
	[true] = 1,
	[false] = true,
	["123"] = false
}

--lua当中的一个自定义的类
testClass = {
	testInt = 2,
	testBool = true,
	testFloat = 1.2,
	testString = "320",
	testFun = function()
		print("12321")
	end,

	testInClass = {
		testInInt = 5
	}
}