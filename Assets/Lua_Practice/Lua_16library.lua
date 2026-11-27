print("****自带库****")
--string
--table
print("****01时间****")
--系统时间
print(os.time())
--自己传入参数 得到时间
print(os.time({year = 2026,month = 11,day = 6}))

--os.date("*t")
local nowTime = os.date("*t")
for k,v in pairs(nowTime) do	
	print(k,v)
end
print(nowTime.hour)

print("****02数学运算****")
--math
--绝对值
print(math.abs(-5))
--弧度转角度
print(math.deg(math.pi))
--三角函数 传入弧度
print(math.cos(math.pi))

--向下取整 math.floor
print(math.floor(5.6))
--向上取整 math.ceil
print(math.ceil(6.3))

--最大值最小值
print(math.max(5,8))
print(math.min(6,9))

--小数分离 分成整数 和 小数 两部分
print(math.modf(1.6))

--幂运算
print(math.pow(2,5))
--开方
print(math.sqrt(4))

--随机数
--先设置随机种子
math.randomseed(os.time())
print(math.random(100))
print(math.random(100))


print("****03路径****")
--lua脚本加载路径
print(package.path)
package.path = package.path .. ";C:\\"
print(package.path)