using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ABTest : MonoBehaviour
{
    public Image image;

    void Start()
    {
        GameObject obj2 = ABMgr.GetInstance().LoadRes("model", "Cube", typeof(GameObject)) as GameObject;
        obj2.transform.position = Vector3.up * 2;
        GameObject obj = ABMgr.GetInstance().LoadRes<GameObject>("model", "Cube");
        obj.transform.position = Vector3.up;

        //异步加载
        ABMgr.GetInstance().LoadResAsync("model", "Cube", (obj) =>
        {
            GameObject obj3 = obj as GameObject;
            obj3.transform.position = Vector3.up * 3;
        });
        //02.
        ABMgr.GetInstance().LoadResAsync("model", "Cube", typeof(GameObject), (obj) =>
{
    GameObject obj3 = obj as GameObject;
    obj3.transform.position = Vector3.up * 3;
});

        //03.异步加载（根据泛型指定类型）
        ABMgr.GetInstance().LoadResAsync<GameObject>("model", "Cube", (obj) =>
        {
            obj.transform.position = Vector3.up * 3;
        });

        ABMgr.GetInstance().LoadResAsync<GameObject>("model", "Cube", (obj) =>
{
    obj.transform.position = -Vector3.up * 3;
});

        //     //同步加载
        //     //第一步 加载 AB包
        //     AssetBundle ab = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "model");
        //     //第二步 加载AB包中的资源
        //     //如果只用名字加载，会出现同名不同类型，分不清是哪一个资源
        //     //建议使用 泛型加载 或 Type指定类型
        //     //GameObject obj = ab.LoadAsset<GameObject>("Cube");
        //     GameObject obj = ab.LoadAsset("Cube", typeof(GameObject)) as GameObject;

        //     //依赖包的关键知识点 - 利用主包获取依赖信息
        //     //加载主包
        //     AssetBundle abMain = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "PC");
        //     //加载主包中的固定文件
        //     AssetBundleManifest abManifest = abMain.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
        //     //从固定文件中获取依赖信息  查询 model 的所有依赖包
        //     string[] strs = abManifest.GetAllDependencies("model");
        //     //得到了 依赖包的名字   
        //     for(int i=0;i<strs.Length;i++)
        //     {
        //         Debug.Log(strs[i]);
        //         //加载所有依赖包
        //         AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + strs[i]);
        //     }

        //     Instantiate(obj);
        //     //同一个AB包可以加载多个资源，但是同一个AB包只能加载一次，第二次加载会返回null
        //     //AssetBundle ab2 = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "model");
        //     GameObject obj2 = ab.LoadAsset("Sphere",typeof(GameObject)) as GameObject;
        //     Instantiate(obj2);

        //     ab.Unload(false); //卸载AB包ab  为true时，会把资源也写在掉，不推荐  ；为false时，只卸载AB包，资源还在内存中



        //     //异步加载 -->协程
        //    // StartCoroutine(LoadABAsync());

    }

    IEnumerator LoadABAsync()
    {
        //第一步 加载 AB包
        AssetBundleCreateRequest abcr = AssetBundle.LoadFromFileAsync(Application.streamingAssetsPath + "/" + "image");
        yield return abcr;
        //第二步 加载AB包中的资源
        AssetBundleRequest abr = abcr.assetBundle.LoadAssetAsync("im", typeof(Sprite));
        yield return abr;
        Sprite sprite = abr.asset as Sprite;
        image.sprite = sprite;
        // Instantiate(abr.asset);
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            //卸载AB包  为true时，会把资源也写在掉，不推荐  ；为false时，只卸载AB包，资源还在内存中
            AssetBundle.UnloadAllAssetBundles(false);
        }
    }
}
