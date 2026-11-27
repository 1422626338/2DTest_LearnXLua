print("****多脚本执行****")

print("****01.全局变量和本地（局部）变量****")
--全局变量
a = 1
b = "std"

for i = 1,2 do
	c="-全局变量-，消耗内存"
end
print(c)

--局部变量
for i=1,2 do
	local  d = "*局部变量*"
	print(d)	--打印*局部变量*，只在代码片段里有用，关键字local
end
print(d)	--打印nil


print("****02.多脚本执行，require****")			--加载 + 直接运行这个 lua 文件里所有代码
--关键字 require("脚本名") 或者  require('脚本名')

require("Test")		--运行 Test.lua
print(TestA)
--require执行一个脚本时，可以再脚本最后返回一个外部希望获取的内容
local  test03 = require("Test")
print (test03)


print("****03.脚本卸载，package.loaded['']****")
require ("Test")	--加载一次就缓存，后续只拿缓存；如果是require加载执行的脚本，加载一次过后不会再被执行

--package.loaded["脚本名"] 
--返回值是boolean，意思是该脚本是否被执行过
print(package.loaded["Test"] )	--true
--卸载
package.loaded["Test"] = nil
--再次require执行
require("Test")


print("****04.大G表****")
--_G表是一个总表（table），他将我们申明的所有的全局变量的变量都存储在其中
--for k,v in pairs(_G) do
--	print(k,v)
--end	
--本地变量（local）不会存在大G表内