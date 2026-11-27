using System.Collections;
using UnityEngine;
using UnityEngine.Events;
using XLua;

[Hotfix]
public class HotfixTest
{
    public HotfixTest()
    {
        Debug.Log("HotfixTest的构造函数");

    }
    public void Speak(string str)
    {
        Debug.Log(str);
    }

    ~HotfixTest()
    {

    }
}

[Hotfix]
public class HotfixTest2<T>
{
    public void Test(T str)
    {
        Debug.Log(str);
    }
}



[Hotfix]
public class HotfixMain : MonoBehaviour
{
    HotfixTest hotfixTest;
    public int[] array = new int[] { 1, 2, 3 };
    //属性
    public int Age
    {
        get
        {
            return 0;
        }
        set
        {
            Debug.Log(value);
        }
    }
    public int this[int index]  //索引器固定写法 ： this[类型 下标]
    {
        get
        {
            if (index >= array.Length || index < 0)
            {
                Debug.Log("索引器不正确");
                return 0;
            }
            return array[index];
        }
        set
        {
            if (index >= array.Length || index < 0)
            {
                Debug.Log("索引器不正确");
                return;
            }
        }
    }

    //事件
    event UnityAction myEvent;


    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");

        Debug.Log(Add(10, 20));
        Speak("嘻嘻嘻嘻");

        hotfixTest = new HotfixTest();
        hotfixTest.Speak("构造函数的speak");


        Debug.Log("-----");
        //StartCoroutine(TestCoroutine());


        this.Age = 100;
        Debug.Log(this.Age);

        this[99] = 123;
        Debug.Log(this[99999]);

        //事件
        myEvent +=TestEvent;
        myEvent -= TestEvent;

        //
        HotfixTest2<string> t1 = new HotfixTest2<string>();
        t1.Test("123");
        HotfixTest2<int> t2 = new HotfixTest2<int>();
        t2.Test(1000);
    }
    void Update()
    {

    }
    private void TestEvent()
    {
        Debug.Log("testEvent");
    }

    IEnumerator TestCoroutine()
    {
        while (true)
        {
            yield return new WaitForSeconds(1f);
            Debug.Log("C#协程打印一次");
        }
    }

    public int Add(int a, int b)
    {
        return 0;
    }
    public static void Speak(string str)
    {
        Debug.Log("hahaha");
    }
}
