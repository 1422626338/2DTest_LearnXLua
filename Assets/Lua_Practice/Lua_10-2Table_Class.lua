print("******类和结构体******")

--Lua中，默认没有面向对象的 需要我们自己来实现
--成员变量 成员函数...
Student = {
	age =18,
	sex = true,
	Up = function()
		--print(age) 不能这样写，这样写lua中不知道age是哪个，会是一个nil，他是一个全局变量
		print("Student.age的"..Student.age)	--01.想要在表内部函数中 调用表本身的属性或方法，一定要指定是谁的，所以 要写明 表名.属性 或表名.方法
		print("成长函数")
	end,

	--02.或者把自己作为参数传进来，在内部访问
	Learn = function(std)
		print("学习函数",std.age)
	end
}
Student.Up()
Student.Learn(Student)
--Lua中



--C#要 使用类 实例化对象new 、静态直接点
--Lua 中类的实现，更像是一个类中有很多 静态变量和函数
print(Student.age)
print(Student.Up())	--这里返回值是nil，所以执行.Up后，又打印了个nil空行内容


--现在是在Student表外。申明表过后，在外申明表已有的变量和方法
Student.name = "唐老师"

--01
print(Student.name)

Student.Speak = function()
	print("表外，申明说话函数")
end	

--02
Student.Speak()

--03.申明方式
function Student.Speak2()
	print("说话2")
end
Student.Speak2()


--04.Stydebt:Learn()
print("*****Lua . 点和 ： 的区别")
-- . 普通调用，不会自动传 self
--： 是方法调用，会默认把调用者 作为第一个参数传入方法中
People={
	id=1,
	sex = true,
	Walk = function()
		print("走路")
	end,
	Jump = function(self)
		print("跳跃,我的id是",self.id)
end
}

People:Walk()	--方法调用，自动传第一个参数 self = People
People.Walk()	--普通调用，不会自动传 self

People:Jump()	---方法调用，自动传第一个参数 self = People	

function People:Jump2()	--
	print("Jump2:"..self.id.."跳跃")
end

People:Jump2()
People.Jump2(People)