using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SingletonAutoMono<T> : MonoBehaviour where T:MonoBehaviour
{
    private static T instance;
    public static T GetInstance()
    {
        if(instance == null)
        {
            GameObject obj = new GameObject();
            //设置对象名字为脚本名
            obj.name = typeof(T).ToString();
            //让这个单例对象在场景切换时不被销毁
            DontDestroyOnLoad(obj);
            instance = obj.AddComponent<T>();
        }
        return instance;
    }
}
