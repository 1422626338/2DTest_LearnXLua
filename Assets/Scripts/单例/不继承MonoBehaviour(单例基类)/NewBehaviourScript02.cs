using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript02 : MonoBehaviour
{
    #region 单例模式
    private static NewBehaviourScript02 instance;
    public static NewBehaviourScript02 GetInstance()
    {
        //继承了Mono的脚本，不能直接new
        //只能通过拖拽对象 或者 添加脚本api addComponent 去加脚本
        //U3D内部帮我们实例化它
        return instance;
    }


    void Awake()
    {
        //将该脚本赋值给instance
        instance = this;
    }
    #endregion

    public  void Test()
    {
        Debug.Log(NewBehaviourScript02.GetInstance().name);
    }
}

public class NewBehaviourScript03 : MonoBehaviour
{
    private static NewBehaviourScript03 instance;
    public static NewBehaviourScript03 GetInstance()
    {
        return instance;
    }
    private void Awake()
    {
        //这个脚本挂在到那个的物体脚本赋值给instance
        instance = this;
    }
}
