using UnityEngine;

public class Test03 : MonoBehaviour
{
    void Start()
    {
        GameManager03 gameManager03_1 = GameManager03.GetInstance();
        GameManager03 gameManager03_2 = GameManager03.GetInstance();
        Debug.Log("gameManager03_1 和gameManager03_2 是否一样"+ReferenceEquals(gameManager03_1,gameManager03_2));
        
        //查看自动创建的游戏物体的名字
        Debug.Log("gameManager03_1的名字"+gameManager03_1.gameObject.name);
        Debug.Log("gameManager03_2的名字"+gameManager03_1.gameObject.name);
        gameManager03_1.AddGold(30);
        Debug.Log("gameManager03_2的金币"+gameManager03_2.gold);
    }
}
