using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Test02 : MonoBehaviour
{
    private void Start()
    {
        GameManager02 manager02_1 = GameManager02.GetInstance();
        GameManager02 manager02_2 = GameManager02.GetInstance();
        Debug.Log("mager02_1是否为空" + (manager02_1 == null));
         // 测试是不是同一个组件对象
         Debug.Log("manager02_1 和manager02_2是否为同一个对象"+ReferenceEquals(manager02_1,manager02_2));

         //测试共享数据
         manager02_1.AddGold(20);
         Debug.Log("manager02_2的金币"+manager02_2.gold);
    }
}
