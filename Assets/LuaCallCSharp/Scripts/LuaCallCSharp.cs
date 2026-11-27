using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UIElements;
using UnityEngine.Video;
using XLua;

#region 第一次课：Lua调用C#类
//自定义类
[XLua.LuaCallCSharp]
public class Test1
{
    public void Speak(string str)
    {
        Debug.Log("Test1:" + str);
    }
}
namespace MrWang
{
    [XLua.LuaCallCSharp]
    public class Test2
    {
        public void Speak(string str)
        {
            Debug.Log("Test2:" + str);
        }
    }
}
#endregion

#region     第二次课：Lua调用C#枚举
//自定义枚举
[XLua.LuaCallCSharp]
public enum E_MyEnum
{
    Idle,
    Move,
    Atk
}
#endregion


#region   第三次课：数组、list、字典
[XLua.LuaCallCSharp]
public class Lesson3
{
    public int[] array = new int[5] { 1, 2, 3, 4, 5 };
    public List<int> list = new List<int>();
    public Dictionary<int, string> dic = new Dictionary<int, string>();
    public void Test()
    {
        //array.Length;
    }
}
#endregion


#region 第四次课：拓展方法 必须使用特性[XLua.LuaCallCSharp]
//如果要在Lua中 使用拓展方法，一定要在工具类前加上[XLua.LuaCallCSharp]特性
//建议Lua中要使用的类前都加上[XLua.LuaCallCSharp]特性，可以提升性能
//如果不加，除了拓展方法对应的类报错，其他类虽然不会报错，但是效率低
//lua是通过反射机制去调用 C#中的类
[XLua.LuaCallCSharp]
public static class Tools
{
    //Lesson4的拓展方法
    public static void Move(this Lesson4 obj)
    {
        Debug.Log(obj.name + "移动");
    }
}

[XLua.LuaCallCSharp]
public class Lesson4
{
    public string name = "阿林";
    public void Speak(String str)
    {
        Debug.Log(str);
    }
    public static void Eat()
    {
        Debug.Log("吃东西");
    }
}
#endregion


#region ref和out
public class Lesson5
{
    public int RefFun(int a, ref int b, ref int c, int d)
    {
        b = a + d;
        c = d;
        return 100;
    }
    public int OutFun(int a, out int b, out int c, int d)
    {
        b = a;
        c = d;
        return 200;
    }
    public int RefOutFun(int a, out int b, ref int c)
    {
        b = a * 10;
        c = a * 20;
        return 300;
    }
}
#endregion

#region 函数重载
public class Lesson6
{
    public int Calc()
    {
        return 100;
    }
    public int Calc(int a, int b)
    {
        return a + b;
    }
    public int Calc(int a)
    {
        return a;
    }
    public float Calc(float a)
    {
        return a;
    }
}

#endregion

#region Lesson7 委托和事件
public class Lesson7
{
    //声明委托和事件
    //委托和事件最大的区别，
    //委托是一个类型（可以随便赋值、外部调用）
    // 事件是委托的一层封装，只允许【+=、-=】订阅和取消订阅，禁止外部直接赋值,禁止外部主动 Invoke ()
    public UnityAction del;
    public event UnityAction eventAction;
    public void DoEvent()
    {
        if (eventAction != null)
        {
            eventAction();
        }
    }

    //因为外部不能直接调用事件赋值，所以这里需要手动包裹个清空方法
    public void ClearEvent()
    {
        if (eventAction != null)
            eventAction = null;
    }

}
#endregion

#region  二维数组遍历
public class Lesson8
{
    public int[,] array = new int[2, 3] { { 1, 2, 3 }, { 4, 5, 6 } };
    // public lesson8()
    // {
    //     array[0,0] = 1;
    // }
}

#endregion

#region Lesson9拓展方法
[LuaCallCSharp]
public static class Lesson9
{
    public static bool IsNull(this UnityEngine.Object obj)
    {
        return obj == null;
    }
}
#endregion

#region 系统类型加特性
public static class Lesson10
{
    // 配置 C# 要调用的 Lua 函数所对应的委托类型
    [CSharpCallLua]
    public static List<Type> csharpCallLuaList = new List<Type>()
    {
      typeof(UnityAction<float>)
    };

    [LuaCallCSharp] // 配置 Lua 要访问的 C# 类型
    public static List<Type> luaCallCSharp = new List<Type>()
    {
      typeof(GameObject)
    };
}

#endregion

#region  Class12
public class Lesson12
{
    public interface ITest
    {

    }
    public class TestFather
    {

    }
    public class TestChild : TestFather, ITest
    {

    }
    public void TestFun1<T>(T a, T b) where T : TestFather
    {
        Debug.Log("有参数有约束的泛型方法");
    }
    public void TestFun2<T>(T a)
    {
        Debug.Log("有参数无约束");
    }
    public void TestFun3<T>() where T : TestFather
    {
        Debug.Log("有约束但无参数 ");
    }
    public void TestFun4<T>() where T : ITest
    {
        Debug.Log("有约束有参数 ，但是约束不是类");
    }
}

#endregion


[XLua.LuaCallCSharp]
public class LuaCallCSharp : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        //在C#中，给物体添加脚本有两种方式，Unity中一般使用第一种，Lua中只能使用第二中（lua不支持无参泛型）
        //this.gameObject.AddComponent<BoxCollider2D>();
        //this.gameObject.AddComponent(typeof(BoxCollider2D) );

        //调用【静态方法】CreatePrimitive，属于 GameObject 类本身,创建默认的模型
        //GameObject cap = GameObject.CreatePrimitive(PrimitiveType.Capsule);
    }
}
