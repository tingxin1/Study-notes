# 我所知道的Linux

大学期间，免不了会接触Linux系统。我在大一就听老师提及，但是我的电脑硬件和Linux系统有些不兼容而且至今还没确定到底是哪的原因（可能是显卡）。在经历过无数次折腾后（这期间我试了四五个我所知道的Linux发行版）我终于放弃了在物理机上装Linux而转用虚拟机和服务器。（说多了都是泪）

## oh-my-zsh
这是我使用过的做好用的终端，网上也有很多人推荐这个终端。

#### 安装比较简单

1. 首先确保联网并已经安装zsh和git，没有安装的话使用下面命令安装

    ```sudo apt install zsh git -y```   #For Ubuntu/Debian

    ```sudo yum install zsh git -y```   #For Centos

2. 从GitHub上下载并启用oh-my-zsh

    ```sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"```

    启用时需要输入一下用户密码。

3. 设置oh-my-zsh为默认终端

    ```chsh -s /bin/zsh```
    
    再次输入密码即可完成。

#### 配置

oh-my-zsh的配置只需要修改 _~/.zshrc_ 文件(没有的话新建即可)。在*一些配置文件*文件夹下有简单的配置样例。

## screen
screen是linux下的一种多重视窗管理程序。在远程登录Linux服务器进行操作时非常实用。在使用telnet或SSH远程登录linux时，如果连接非正常中断，正在运行的程序也会被杀死，重新连接时，系统将开一个新的session，无法恢复原来的session.screen命令可以解决这个问题。Screen工具是一个终端多路转接器，在本质上，这意味着你能够使用一个单一的终端窗口运行多终端的应用。

```screen -S name```	#Create a new screen

```screen -r name```	#Back to closed screen

```screen -ls```		#list all screens

```Ctrl+a+d```		    #save and exit

```exit```			    #exit screen

```screen -wipe name```	#delete screen

让每个screen会话窗口有单独的日志文件。
在screen配置文件/etc/screenrc最后添加下面一行：

```logfile /tmp/screenlog_%t.log```

%t是指window窗口的名称，对应screen的-t参数。所以我们启动screen的时候要指定窗口的名称

```screen -L -t window1 -dmS test```

的意思是启动test会话，test会话的窗口名称为window1。屏幕日志记录在/tmp/screenlog_window1.log。如果启动的时候不加-L参数，在screen session下按ctrl+a H，日志也会记录在/tmp/screenlog_window1.log。



## Anaconda
- 创建一个名为env_name的环境，指定Python版本是3.*（不用管是3.*.x，conda会为我们自动寻找3.*.x中的最新版本）

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