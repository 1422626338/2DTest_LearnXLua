print("****函数****")
--function 函数名()
--end

--a = function()
--end

print("****01.无参无返回值****")
function F1()
	print("01.F1函数")
end
F1()	--lua中，在函数声明前，不能执行。（C#类其实是在编译时new它了，所有可以在外面写和调用，顺序不是特别重要）

--类似委托事件
F2 = function()
	print("F2函数，类似C#委托")
end
F2()


print("****02.有参****")
function F3(a)
	print(a)
end
F3(3)
F3("函数3，有参数，但是不需要传递参数类型")
--如果传入的参数和 函数参数个数不匹配，他会默认  nil补空、丢弃
F3() --不传递参数也不报错，默认会传递nil
F3(3,2,1)	--丢弃，只打印3



print("****04.有返回值****")
function F4(a)
	return a,"130",true
end

temp1,temp2,temp3,temp4 = F4("1")
print(temp1)
print(temp2)
print(temp3)
print(temp4)


print("****05.函数的类型****")
--函数的类型就是 function
F5 = function()
	print("05")
end
F5()				--05
print(type(F5))		--function



print("****06.函数的重载****")--(C#中是函数名相同，参数类型不同，或者参数个数不同)
--lua中不支持，它会默认调用最后一个声明的函数



print("****07.变长参数****")
function F7(...)
	--变长参数使用：用一个表存起来 再用
	arg = {...}
	for i=1,#arg do
			print(arg[i])
	end
end

F7(1,"321",true,3)

print("****函数嵌套****")
function F8()
	return function()
			print(23)
			end
end	
f9 = F8()
f9()

--闭包	：内层的函数可以引用包含在它外层的函数的变量
--即使外层函数的执行已经终止，
--该变量提供的值并非变量创建时的值，而是在父函数范围内的最终值

function F9(x)				--F9函数返回的是一个函数
	return function(y)
			return	 x + y
			end
	end	

f10 = F9(1)		-- x = 1
print(f10(3))	-- y = 3