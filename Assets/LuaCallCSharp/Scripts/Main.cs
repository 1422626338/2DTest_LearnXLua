using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Main : MonoBehaviour
{
    void Start()
    {
        LuaMgr.GetInstance().Init();
        //调用名为"Main"的Lua脚本文件
        LuaMgr.GetInstance().DoLuaFile("Main");
    }
}
