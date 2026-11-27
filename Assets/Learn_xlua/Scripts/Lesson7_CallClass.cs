using System;
using Unity.VisualScripting;
using UnityEngine;

public class CallLuaClass
{
    //在这个类中 去声明成员变量
    //名字一定要和lua那边的一样
    //必须是公共的，（私有和protected无法赋值）
    //这个自定义中的 变量 可以更多，也可以更少
    //如果变量比lua中的少，就会忽略它。如果变量比lua中多，不会赋值，也会忽略
    public int testInt;
    public bool testBool;
    public float testFloat;
    public float testString;
    public Action testFun;

    public CallLuaInClass testInClass;
    public void Test()
    {
        
    }
}

public class CallLuaInClass
{
    public int testInInt;
}


public class Lesson7_CallClass : MonoBehaviour
{
    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        CallLuaClass obj = LuaMgr.GetInstance().Global.Get<CallLuaClass>("testClass");
        Debug.Log(obj.testInt);
        Debug.Log(obj.testBool);
        Debug.Log(obj.testFloat);
        Debug.Log(obj.testString);

        Debug.Log("嵌套打印" + obj.testInClass.testInInt);

        obj.testFun();

        //值拷贝，改变了它，不会改变Lua表里的内容
        obj.testInt = 100;
        CallLuaClass obj2 = LuaMgr.GetInstance().Global.Get<CallLuaClass>("testClass");
        Debug.Log(obj2.testInt);    //打印的还是lua里的值，不是100
    }
}
