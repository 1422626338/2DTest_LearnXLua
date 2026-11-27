print("****面向对象****")
print("****封装****")

-- 【类】Object，本质就是一个普通table，充当“模板”
Object ={}
Object.id = 1;   -- 给这个table加一个成员变量id，值=1

function Object:Test()
	print(self.id)
end


-- 定义一个方法 new，作用：用来【创建实例对象】，相当于别的语言的构造函数
-- 这里的 : 是语法糖，等价于 function Object.new(self)
function Object:new()
	-- self 就是调用这个方法的表，这里就是 Object
	-- 新建一个空表 obj，本意：这个空表就是我们要返回的【实例对象】
	local obj ={}

	--元表知识，__index 当找自己的变量 找不到时，就会去找元表当中 __index指向的内容
	self.__index = self
	setmetatable(obj,self)
	return obj
end

-- 调用 Object 的 new 方法，: 自动传 self=Object
local myObj = Object:new()

-- 打印 myObj，它现在就是 obj 这个表
print(myObj)
-- 访问 myObj 的 id，也就是 obj.id
print(myObj.id)

myObj:Test()	--1

--对空表 申明一个新的属性 叫做id
myObj.id = 2
myObj:Test()	--2



print("  ")
print("******继承*****")
--写一个用于 继承的方法
function Object:subClass(className)
	--_G 是总表，所有声明的全局变量 都以键值对的形式存在其中
	_G[className] = {}
	--写相关继承的规则
	--用到元表
	local obj =_G[className]
	self.__index = self
	--子类 定义一个base属性，base属性代表父类，

	obj.base = self
	setmetatable(obj,self)
end

--print(_G)
--_G[a] = "01"	--a是nil，等于_G[nil] = "01" 报错
--_G["B"] = 2
--_G.c = "30" 
--print(B)
--print(c)

--传进去的是个字符串，这个字符串就是类名
Object:subClass("Person")
print(Person)
print(Person.id)	--1

local p1 = Person:new()
print(p1.id)		--1


print("  ")
print("  ")
print("*****多态*****")
--相同行为，不同表现 就是多态
--相同方法 不同执行逻辑 就是多态

--GameObject 继承Object类
Object:subClass("GameObject")
GameObject.posX = 0
GameObject.posY =0
function GameObject:Move()
	self.posX = self.posX +1
	self.posY = self.posY +1
	print(self.posX)
	print(self.posY)
end	

--Player 继承GameObject
GameObject:subClass("Player")


--重写
GameObject:subClass("Player")
function Player:Move()
	--这里base指的是GameObject表（类）
	-- ： 这种方法调用 相当于把基类表 作为第一个参数传入了方法中，会导致后面的第调用实际上都是最后的基类，导致不同的成员变量使用的确实相同的成员变量
	-- 如果要执行父类逻辑，不要直接： 调用，
	--要通过.调用，在自己传入参数
	self.base.Move(self)	--这里传入的实际是调用者p1
end

local p1 = Player:new()
p1:Move()
p1:Move()
--目前这种写法 有坑，不同对象使用的成员变量 居然是相同的成员变量
--不是各自的
local p2 = Player:new()
p2:Move()