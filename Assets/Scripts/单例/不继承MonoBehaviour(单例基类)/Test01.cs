using UnityEngine;
public class Test01 : MonoBehaviour
{
    private void Start()
    {
        GameManager01 manager01 = GameManager01.GetInstance();
        GameManager01 manager02 = GameManager01.GetInstance();

        // 测试01:判断是否为同一个对象
        Debug.Log("是否为同一个对象：" + ReferenceEquals(manager01, manager02)); //ture
        //测试02：调用方法
        manager01.WriteMyName();    //调用了 GameManager01
        //manager01添加金币
        manager01.AddGold(10);      //当前金币：110
        //读取manager02的金币
        Debug.Log("manager02的金币有："+ manager02.gold);   //"manager02的金币有：110
    }
}
