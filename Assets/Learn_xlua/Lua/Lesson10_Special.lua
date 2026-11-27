GameObject = CS.UnityEngine.GameObject
UI = CS.UnityEngine.UI

local slider = GameObject.Find("Slider")
print(slider)
local sliderScripts = slider:GetComponent(typeof(UI.Slider))
print(sliderScripts)
sliderScripts.onValueChanged:AddListener(function (f)
	print(f)
end)