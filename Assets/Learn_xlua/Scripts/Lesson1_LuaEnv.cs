using UnityEngine;
using XLua;

public class Lesson1_LuaEnv : MonoBehaviour
{
    void Start()
    {
        //Lua解析器 能够让我们在Unity中执行Lua
        LuaEnv env = new LuaEnv();//实例化一个lua解析器对象 ;这个解析器一般都要做成唯一的，提升性能，所以也没有销毁

        //执行Lua语言
        env.DoString("print('你好世界')");
        
        //执行一个Lua脚本， Lua知识点：多脚本执行：require
        //默认寻找脚本路径是在 Resources下，
        // 并且 这里可能是通过 Resources.Load去加载的Lua脚本，只能加载.txt、bytes等文件
        //所以Lua脚本后缀要加一个.txt
        env.DoString("require('Main')");

        //帮助我们清除Lua中我们没有手动释放的对象、垃圾回收
        //帧更新中定时执行 或者 切场景时执行
        env.Tick(); //垃圾回收

        ///env.Dispose() 销毁Lua解析器
    }

}
