print("********复杂数据类型--表2******")
print("****01字典****")
print("****字典的申明****")

--字典是由键值对构成的
a = {["name"] = "小王",["age"] = 10, ["1"] = 3,[3] = 5}

--01.访问单个变量时，可以用[键]来访问
print(a["name"])
print(a["1"])
print(a[3])		--5

--02.也可以通过 表.变量名 的形式得到值	（但是不能是 .数字 ）
print(a.name)
--print(a.1)
print(a[3])	--5

--03.修改
a.name = "小红"
a["name"] = "小兰"
print(a.name)

--04.新增
a["sex"]="女"
print(a.sex)

--05.删除
a["sex"] = nil
print(a.sex)

print("****02.字典的遍历****")
a={["name"] = "小绿", ["sex"] = "女", [1] = 2}
for k,v in pairs(a) do
	--可以传多个参数 ， 一样可以打印出来
	print(k,v)							--打印：1  2； name  小绿; sex  女; 顺序不一定
end	

print("****--遍历键****")
for k in pairs(a) do
	print(k)
	print(a[k])
end	



--02 ipairs：只遍历从 1 开始的连续整数键
print("****ipairs遍历键值")
a = {["name"]="小绿", ["sex"]="女", [1]="2"}
for k,v in ipairs(a) do
    print(k,v)	--a[1] = "2"   -- 打印 1 2；  a[2] = nil   -- 停止
end


