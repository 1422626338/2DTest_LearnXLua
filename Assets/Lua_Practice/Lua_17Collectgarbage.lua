print("****垃圾回收****")

test = {id = 1,name = "123"}
--垃圾回收关键字
--collectgarbage

--获取当前lua占用内存数 K字节 用返回值*1024 就可以得到具体的内存占用字节数
print(collectgarbage("count"))

--lua中的垃圾回收和C#类似，解除羁绊， 就是变成垃圾
test = nil

--进行垃圾回收 理解有点像C#中的GC
collectgarbage("collect")

print(collectgarbage("count"))