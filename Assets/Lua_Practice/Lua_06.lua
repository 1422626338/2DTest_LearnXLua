print("****循环语句****")

print("****while语句****")
num =0

--while 条件 do ...end

while num <5 do
	num = num +1
	print(num)
end


--do while 循环 (repeat until)
num = 0
repeat
	print(num)
	num = num +1
until num >6	--满足条件跳出 ，结束条件


print("****for语句****")
for i = 0,3 do 	--默认递增，i会默认加1
	print(i)
end

for i=1,8,2 do 	--自定义增量，直接逗号后面写
	print(i)
end	

for i = 6,1,-2 do
	print(i)
end