using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

[CSharpCallLua]public interface ICSharpCallInterface
{
    int testInt
    {
        get;
        set;
    }
    bool testBoll
    {
        get;
        set;
    }
    bool testFloat
    {
        get;
        set;
    }
    string testString
    {
        get;
        set;
    }
    Action testFun
    {
        get;
        set;
    }
}

public class Lesson8_CallInterface : MonoBehaviour
{
    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        //从 Lua 的全局变量中找到 testClass,并把它映射成 C# 的ICSharpCallInterface 接口，保存到变量 obj 中
        ICSharpCallInterface obj = LuaMgr.GetInstance().Global.Get<ICSharpCallInterface>("testClass");
        Debug.Log(obj.testInt);
        Debug.Log(obj.testFloat);
        Debug.Log(obj.testString);
        obj.testFun();

        //接口拷贝是引用拷贝，改了值，lua表中的值也会改变
        obj.testInt = 10000;
        ICSharpCallInterface obj2 = LuaMgr.GetInstance().Global.Get<ICSharpCallInterface>("testClass");
        Debug.Log(obj2.testInt);
    }
}
