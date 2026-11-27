using UnityEngine;

public class GameManager03 : SingletonAutoMonoScripts<GameManager03>
{
    public int gold = 100;
    private void Awake()
    {
        Debug.Log("GameManager03执行了Awake");
    }
    public void AddGold(int amount)
    {
        gold += amount;
        Debug.Log("当前金币"+gold);
    }
}
