print("主Lua脚本启动")

function IsNull(obj)
	--obj == nil：检查它是不是 Lua 的空值。
	--obj:Equals(nil)：让 C# 对象判断自己是否等于空值，适用于这里的 Unity 对象判空场景
	if obj == nil or obj:Equals(nil) then
		return true
	end
	return	 false
end	

--require("Test")	--xLua 再调用一次MyCustomLoader(ref filePath = "Test")

require("Lesson1_CallClass")

--require("Lesson2_CallEnum")

--require("Lesson3_CallArray")

--require("Lesson4_CallFunction")

--require("Lesson5_CallFunction")

--require("Lesson6_CallFunction")

--require("Lesson7_CallDel")

--require("Lesson8_Special")

--require("Lesson9_Special")

--require("Lesson10_Special")

--require("Lesson11_Coroutine")

--require("Lesson12_T")

--require("Hotfix_Lesson1")

--require("Hotfix_Lesson2")

--require("Hotfix_Lesson3")

--require("Hotfix_Lesson4")
--require("Hotfix_Lesson5")
--require("Hotfix_Lesson6")