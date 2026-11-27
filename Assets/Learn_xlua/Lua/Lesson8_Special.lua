print("***********Lua调用C# 二维数组 相关知识点***********")

local  obj  = CS.Lesson8()

--获取长度
print("行："..obj.array:GetLength(0))
print("列："..obj.array:GetLength(1))

--不能通过obj.array[0,0]或obj.array[][]来获取元素,会报错

--可以通过方法来调用
print(obj.array:GetValue(0,0))
print(obj.array:GetValue(1,0))

--遍历 
--返回第 0 维的长度;返回第 1 维的长度
for i=0,obj.array:GetLength(0)-1 do			
	for j=0,obj.array:GetLength(1)-1 do
		print(obj.array:GetValue(i,j))
	end	
end	
