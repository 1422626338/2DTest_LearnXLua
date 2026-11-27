print("****条件分支语句****")

--if 条件 then
-- ... 
--end

a= 9
if a> 5 then
	print("123")
end

if a < 5 then
	print("a<5")
else
	print("a>=5")
end


--多条件分支 (elseif 要连这些)
if a <5 then
	print("a<5")

elseif a==6 then
	print("a==6")
else 
	print("a~=6 and a>=5")
end

--lua中没有switch语句