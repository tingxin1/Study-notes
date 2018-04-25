# 我所知道的Linux

大学期间，免不了会接触Linux系统。我在大一就听老师提及，但是我的电脑硬件和Linux系统有些不兼容而且至今还没确定到底是哪的原因（可能是显卡）。在经历过无数次折腾后（这期间我试了四五个我所知道的Linux发行版）我终于放弃了在物理机上装Linux而转用虚拟机和服务器。（说多了都是泪）

## Anaconda
- 创建一个名为python34的环境，指定Python版本是3.4（不用管是3.4.x，conda会为我们自动寻找3.4.x中的最新版本）

    ```conda create --name env_name python=3.*```
 
- 安装好后，使用activate激活某个环境

    ```activate env_name``` # for Windows

    ```source activate env_name``` # for Linux & Mac

    激活后，会发现terminal输入的地方多了python3\*的字样，实际上，此时系统做的事情就是把默认2.7环境从PATH中去除，再把3.\*对应的命令加入PATH.
    此时，再次输入

    ```python --version```

    可以得到*Python 3.\*.\* :: Anaconda 4.\*.\* (64-bit)*，即系统已经切换到了3.*的环境

- 如果想返回默认的python 2.7环境，运行

    ```deactivate env_name``` # for Windows

    ```source deactivate env_name``` # for Linux & Mac
 
- 删除一个已有的环境

    ```conda remove --name python34 --all```