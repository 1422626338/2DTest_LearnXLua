print("****复杂数据类型table*****")
--所有的复杂类型都是table（表）


print("****01.数组****")
--lua中的索引，从1开始
a = {6,"字符串",true,nil}
print(a[1])		--6
print(a[4])		--nil
print(a[5])		--nil

--#是通用的获取长度的关键字
--数组中间的 nil 会截断`#`的长度；数组最后的 nil，会直接不算进长度
--空值会影响#获取的长度
a={0,6,true,"da",nil}
print("a的长度是"..#a)	--4


print("****02.数组的遍历****")
for i=1,#a do
	print(i)			--1 2 3 4
end				


print("****03.二维数组****")
a={{1,2,3},{4,5,6}}
print(a[1][1])
print(a[1][2])
print(a[1][3])
print(a[2][1])
print(a[2][2])
print(a[2][3])


print("****04.二维数组的遍历****")
a={{1,2,3},{4,5,6}}		--a[1] == {1,2,3}	--a[2] == {4,5,6}

--[[for i=1,#a do
	b=a[i]				--当i=1时，b=a[1] = {1,2,3}   当i=2时，b=a[2] = {4,5,6}
	for j=1,#b do
		print(b[j])		--当I=1时，这里打印b[j](第一个表)	当I=2时，这里打印b[j](第一个表)
	end
end]]--
	
for i = 1, #a do
    for j = 1, #a[i] do		--#a[i] 表示第 i 行的长度
        print(a[i][j])
    end
end

print("****05.自定义索引****")
aa={[0]=1,2,3,[-4]=4,5}
print(aa[0])	--1
for i=1,#aa do
	print(aa[i])		--1 2 3 5
end	