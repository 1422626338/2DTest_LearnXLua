using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Lesson3_LuaMgr : MonoBehaviour
{
    void Awake()
    {
        //初始化解析器
        LuaMgr.GetInstance().Init();
        //执行脚本
        LuaMgr.GetInstance().DoLuaFile("Main");
    }
}
