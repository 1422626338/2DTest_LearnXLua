using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public class Lesson9_CallLuaTable : MonoBehaviour
{
    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        //不建议使用LuaTable和LuaFunction，因为效率低
        LuaTable table = LuaMgr.GetInstance().Global.Get<LuaTable>("testClass");
        Debug.Log(table.Get<int>("testInt"));
        Debug.Log(table.Get<bool>("testBool"));
        Debug.Log(table.Get<float>("testFloat"));
        Debug.Log(table.Get<string>("testString"));

        table.Get<LuaFunction>("testFun").Call();
        //改 引用
        table.Set<string,int>("testInt",55);
        Debug.Log(table.Get<int>("testInt"));
        LuaTable table2 = LuaMgr.GetInstance().Global.Get<LuaTable>("testClass");
        Debug.Log(table2.Get<int>("testInt"));

        table.Dispose();
        table2.Dispose();
    }
}
