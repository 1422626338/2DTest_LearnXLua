using UnityEngine;

public class GameManager02 : SingletonMono<GameManager02>
{
    public int gold = 20;
    protected override void Awake()
    {
        //它负责调用父类的 Awake()，让父类保存当前单例对象。
        base.Awake();
        Debug.Log("GameManager02 Awake 执行");
    }
    public void AddGold(int amount)
    {
        gold += amount;
        Debug.Log("当前金币"+gold);
    }
}
