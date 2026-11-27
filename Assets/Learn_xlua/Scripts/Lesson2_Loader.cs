using System.IO;
using UnityEngine;
using XLua;

public class Lesson2_Loader : MonoBehaviour
{
    void Start()
    {
        LuaEnv env = new LuaEnv();
        //这两行顺序不能变
        env.AddLoader(MyCustomLoader);  
        env.DoString("require('Main')");    //XLua 调用 MyCustomLoader，传入 filePath = "Main"，

    }
    //自动执行
    private byte[] MyCustomLoader(ref string filePath)
    {
        //通过函数中的逻辑去加载Lua文件
        //传入到参数 是require 执行的lua脚本文件名字
        //拼接一个Lua文件所在的路径
        string path = Application.dataPath + "/Learn_xlua/Lua/" + filePath +".lua";
        Debug.Log(path);

        //有路径 就去加载文件，
        //File类：C#提供的文件读写的类
        //判断文件是否存在
        if (File.Exists(path))
        {
            //读取文件内容并转换为 byte[] 返回给 XLua
            return File.ReadAllBytes(path);
        }
        else
        {
            Debug.Log("MyCustomLoader重定向失败，文件名为："+filePath);
        }
        return null;
    }
}
