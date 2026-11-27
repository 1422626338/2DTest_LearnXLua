print("****迭代器遍历****")
--迭代器遍历 主要用来遍历表的
--#得到长度 其实并不准确 一般不要用#来遍历表

a={[0]=1,-1,[-1]=3,4,5,[5]=6}
print("------01.ipairs迭代器遍历")
--ipairs
--ipairs 遍历 还是 从1开始往后遍历的 小于等于0的键得不到
--只能找到连续索引的 键 ，如果中间断序了，他也无法遍历后面的内容
for i,k in ipairs(a) do
	print("ipairs遍历键值"..i.."_"..k)
end	

print("------02.pairs迭代器遍历****")
for i,k in pairs(a) do
	print("pairs遍历键值"..i.."_"..k)
end	

print("------02.pairs迭代器遍历键****")
for i in pairs(a) do
	print("pairs遍历键"..i)
end	