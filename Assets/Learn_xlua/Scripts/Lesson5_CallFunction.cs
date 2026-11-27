using System;
using Unity.Mathematics;
using UnityEngine;
using UnityEngine.Events;
using XLua;

//无参无返回值的委托
public delegate void CustomCall();

//有参有返回值的委托，要加识别[CSharpCallLua] ，加了过好要在编辑器里生成Lua代码
[CSharpCallLua] public delegate int CustomCall2(int a);

//多返回值的委托
[CSharpCallLua] public delegate int CunstomCall3(int a,out int b,out bool c,out string d,out int e);
[CSharpCallLua] public delegate int CunstomCall4(int a,ref int b,ref bool c,ref string d,ref int e);
[CSharpCallLua] public delegate void CustomCall5(string a, params int[] args);//变长参数的类型 是根据实际情况来定的

public class Lesson5_CallFunction : MonoBehaviour
{
    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        //无参无返回值的获取
        //委托
        CustomCall call = LuaMgr.GetInstance().Global.Get<CustomCall>("testFun");
        call();

        //Unity自带委托
        UnityAction ua = LuaMgr.GetInstance().Global.Get<UnityAction>("testFun");
        ua();

        //C#提供的委托
        Action ac = LuaMgr.GetInstance().Global.Get<Action>("testFun");
        ac();

        //XLua提供的一种获取函数的方式（少用）
        LuaFunction lf = LuaMgr.GetInstance().Global.Get<LuaFunction>("testFun");
        lf.Call();


        //有参有返回值
        CustomCall2 customCall2 = LuaMgr.GetInstance().Global.Get<CustomCall2>("testFun2");
        Debug.Log("有参有返回值："+customCall2(10));
        
        //C#自带,第一个int是参数，最后一个是返回值
        Func<int,int> sFun = LuaMgr.GetInstance().Global.Get<Func<int,int>>("testFun2");
        Debug.Log("有参有返回值："+sFun(20));

        //XLua提供
        LuaFunction lf2 = LuaMgr.GetInstance().Global.Get<LuaFunction>("testFun2");
        Debug.Log("有参有返回值："+ lf2.Call(30)[0]);   //返回数组里的第0个


        //多返回值
        CunstomCall3 call3 = LuaMgr.GetInstance().Global.Get<CunstomCall3>("testFun3");
        int b;
        bool c;
        string d;
        int e;
        Debug.Log("第一个返回值："+call3(100,out b,out c,out d,out e));

        CunstomCall4 call4 = LuaMgr.GetInstance().Global.Get<CunstomCall4>("testFun3");
        int b1 =0;
        bool c1 = true;
        string d1 = "";
        int e1 = 0;
        Debug.Log("第一个返回值："+call4(200,ref b1,ref c1,ref d1,ref e1));

        //Xlua
        LuaFunction lf3 = LuaMgr.GetInstance().Global.Get<LuaFunction>("testFun3");
        object[] objs = lf3.Call(1000);
        for(int i = 0; i < objs.Length; i++)
        {
            Debug.Log("第" + i + "个返回值是：" + objs[i]);
        }


        //变长参数
        CustomCall5 call5 = LuaMgr.GetInstance().Global.Get<CustomCall5>("testFun4");
        call5("123",55,66,77,88,99);

        LuaFunction lf4 = LuaMgr.GetInstance().Global.Get<LuaFunction>("testFun4");
        lf4.Call("456",78,5,6);
    }

}
