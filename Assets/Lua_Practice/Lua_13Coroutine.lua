print("****协同程序****")


print("****01.协程的创建****")

--常用方式01.coroutine.create()
fun = function()
	print(123)
end
co = coroutine.create(fun)
--协程的本质是一个线程对象, 一个能够执行到一半暂停，之后再从暂停的位置继续执行的函数
print(co)
print(type(co))

--02.coroutine.wrap()	--这种方法返回的是个函数
co2 = coroutine.wrap(fun)
print(co2)
print(type(co2))

--
co3 = coroutine.wrap(function()
	print(123)
end)
print(co3)
print(type(co3))


print("****02协程的运行****")
--01.对应create创建的协程
coroutine.resume(co)
--02.对应 协程函数 的创建方式
co3()


print("****03协程的挂起****")

fun2 = function()
	local i = 1

	while true do
		print(i)
		i = i+1

		-- 挂起当前协程,--暂停当前协程，等待下一次恢复
		coroutine.yield(i)			--返回i
	end	
end
-- 1. 创建协程，此时不会执行 fun2
co4 = coroutine.create(fun2)
-- 2. 第一次启动协程,resume有返回值，第一个是boolean，是返回成功，第二个是返回值
isOk,tempI =coroutine.resume(co4)
print(isOk,tempI)

-- 3. 第二次恢复协程
isOk,tempI =coroutine.resume(co4)	--从 yield() 后面恢复,进入下一轮 while 循环,print(i)  -- 输出 2,i = i + 1 -- i 变成 3,coroutine.yield()再次暂停
print(isOk,tempI)	


co5 = coroutine.wrap(fun2)
--这种方式的协程调用， 也可以有返回值，只是没有默认的第一个返回值了
print("返回值："..co5())
print("返回值："..co5())



print("****04.协程的状态****")
--coroutine.status(协程对象)
--dead	结束
--suspended 暂停
--running 进行中

--coroutine.status() 需要传入一个协程对象（thread）
--报错，co5 不是协程对象，print(coroutine.status(co5))
print(coroutine.status(co4))	--suspended
print(coroutine.status(co))		--dead


-- ① 定义函数
fun3 = function()
	-- ⑤ 获取当前正在运行的协程
    local currentCo = coroutine.running()
    -- ⑥ 打印当前协程状态
    print(coroutine.status(currentCo))
     -- ⑦ 挂起当前协程
    coroutine.yield()
end

-- ② 创建协程,不执行函数
co6 = coroutine.create(fun3)

-- ③ 查看协程状态
print(coroutine.status(co6))  -- suspended

-- ④ 启动协程
coroutine.resume(co6)        -- running

-- ⑧ 再次查看协程状态
print(coroutine.status(co6))  -- suspended

--这个函数可以得到当前正在运行的协程的线程号.(要放到协程内部去执行，否则为空)
print(coroutine.running())