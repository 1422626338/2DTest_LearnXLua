print("****表的公共操作****")
--表 中 提供一些公共方法
--一张表中有两张表
t1 = {{age=1,name="小王",sex = true},{age = 2,name ="小兰"}}

t2 = {name = "唐老师",sex = true}

--长度
print(#t1)	--t1 的长度：2
--等价于
t1[1] = {age=1,name="小王",sex = true}
t1[2] = {age = 2,name ="小兰"}
--是连续数字索引，所以 #t1 = 2
print(#t2)				--0，# 运算符只统计从 1 开始连续的数字索引序列


print("****01.插入****")
--插入
print(#t1)				--2
table.insert(t1,t2)		--2 +1
print(#t1)				--3
print(t1[1])
print(t1[2])
print(t1[3])
print(t1[3].sex)		--true



print("****02.移除****")
--01remove方法 传进去表 会移除最后一个所以
table.remove(t1)
print(#t1)				--2
print(t1[1].name)		--小红
print(t1[2].name)		--小兰
print(t1[3])			--nil

--02remove方法 传两个参数，第一个参数 是要移除内容的表，第二个参数 是要移除内容的索引
table.remove(t1,1)
print(t1[1].name)		--这里是小兰了，不是小红了，小红那张表被删掉了
print(#t1)


print("****03.排序(升序)****")
t2 = {5,3,9,6}
table.sort(t2)
for _,v in pairs(t2) do
	print(v)
end	


print("****03.排序(降序)****")
table.sort( t2, function(a,b)		--传入两个参数，第一个参数是表 第二个是排序规则函数
	if a > b then
		return true
	end
end )

for _,v in pairs(t2) do
	print(v)
end



print("****04.拼接****")
tb = {"123","456","789"}
--连接函数 用于拼接表中的元素 返回值是一个字符串
str = table.concat( tb,";")
print(str)