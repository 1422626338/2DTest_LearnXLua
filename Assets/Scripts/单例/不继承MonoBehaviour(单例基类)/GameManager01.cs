using UnityEngine;
public class GameManager01 : BaseManager<GameManager01>
{
    //默认有个公开的无参构造函数public GameManager01 (){}
    public int gold = 100;
    public void WriteMyName()
    {
        Debug.Log("调用了 GameManager01");
    }
    public void AddGold(int amount)
    {
        gold += amount;
        Debug.Log("当前金币" + gold);
    }
}
