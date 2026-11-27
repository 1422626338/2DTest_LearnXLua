using System;
using UnityEngine;

public class Lesson4_CallVariable : MonoBehaviour
{
    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        //使用lua解析器luaEnv中的 Gloable属性
        int i = LuaMgr.GetInstance().Global.Get<int>("testNumber");
        Debug.Log("testNumber:" + i);

        //同样是值拷贝，不会影响原来的值
        //i =10;
        //int i2 = LuaMgr.GetInstance().Global.Get<int>("testNumber");
        //Debug.Log("testNumber:" + i2);

        //改值
        LuaMgr.GetInstance().Global.Set("testNumber",55);
        int i2 = LuaMgr.GetInstance().Global.Get<int>("testNumber");
        Debug.Log("testNumber:" + i2);

        int local = LuaMgr.GetInstance().Global.Get<int>("testLoacal");
        Debug.Log("testLoacal:" + local);

        bool b = LuaMgr.GetInstance().Global.Get<bool>("testBool");
        Debug.Log("testBool:" + b);

        float f = LuaMgr.GetInstance().Global.Get<float>("testFloat");
        Debug.Log("testFloat:" + f);

        Double d = LuaMgr.GetInstance().Global.Get<double>("testDouble");
        Debug.Log("testDouble:" + d);

        String s = LuaMgr.GetInstance().Global.Get<string>("testString");
        Debug.Log("testBool:" + s);
    }
}
