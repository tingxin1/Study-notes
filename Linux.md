# 我所知道的Linux

大学期间，免不了会接触Linux系统。我在大一就听老师提及，但是我的电脑硬件和Linux系统有些不兼容而且至今还没确定到底是哪的原因（可能是显卡）。在经历过无数次折腾后（这期间我试了四五个我所知道的Linux发行版）我终于放弃了在物理机上装Linux而转用虚拟机和服务器。（说多了都是泪）
<!-- TOC -->

- [我所知道的Linux](#%E6%88%91%E6%89%80%E7%9F%A5%E9%81%93%E7%9A%84linux)
    - [oh-my-zsh](#oh-my-zsh)
            - [安装比较简单](#%E5%AE%89%E8%A3%85%E6%AF%94%E8%BE%83%E7%AE%80%E5%8D%95)
            - [配置](#%E9%85%8D%E7%BD%AE)
    - [screen](#screen)
    - [Anaconda](#anaconda)
    - [Transmission(Linux下的BT下载工具)](#transmissionlinux%E4%B8%8B%E7%9A%84bt%E4%B8%8B%E8%BD%BD%E5%B7%A5%E5%85%B7)
    - [一些命令行技巧](#%E4%B8%80%E4%BA%9B%E5%91%BD%E4%BB%A4%E8%A1%8C%E6%8A%80%E5%B7%A7)
        - [C](#c)
        - [H](#h)
        - [P](#p)
        - [S](#s)

<!-- /TOC -->
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

oh-my-zsh的配置只需要修改 _~/.zshrc_ 文件(没有的话新建即可)。

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

## Transmission(Linux下的BT下载工具)

Transmission 是最流行的基于图形界面的 BitTorrent 客户端之一。transmission-cli 是它的简装的命令行版本。
- centos安装

    ```sudo yum install transmission-cli```
- 使用
    
    transmission-cli的使用非常简单。如果你懒于学习它的命令行选项，所有你要做的事情就是下载 .torrent 文件并运行命令。这会自动寻找可用的种子并从那里下载 ISO 文件。
    
    示例代码如下:

    ```
    $ wget http://releases.ubuntu.com/14.10/ubuntu-14.10-desktop-amd64.iso.torrent
    $ transmission-cli ubuntu-14.10-desktop-amd64.iso.torrent
    ```

## 一些命令行技巧

### C 
1. curl ifconfig.me

    如何在终端获得外部IP地址呢？这个命令就可以在你的终端显示你的外部IP地址。

### H
 1. history命令

    history命令用于显示指定数目的指令命令，读取历史命令文件中的目录到历史命令缓冲区和将历史命令缓冲区中的目录写入命令文件。历史命令是被保存在内存中的，当退出或者登录shell时，会自动保存或读取。在内存中，历史命令仅能够存储1000条历史命令，该数量是由环境变量HISTSIZE进行控制。

    在命令行中使用时，可以使用 **!** 来显示指定的历史命令，例如：
    
    ```!521``` ：显示历史命令中的第521条命令
   
    ```!!``` ：重复执行上一条命令（这就与最前面的**sudo!!** 对应上了）
   
    ```!str```：执行以str开头的命令（最后一个）

    history其他使用语法为：```history(option)(parameter)```

    option: 
    
    -c：清空当前历史命令。
    
    -a：将历史命令缓冲区中的命令写入历史命令文件中。

    -r：将历史文件中的命令杜如当前历史命令缓冲区。

    -w： 将当前历史命令缓冲区命令写入历史命令文件中。

    parameter： 

    n：打印最近的n条历史命令

### P
1. pv命令
    https://www.jianshu.com/p/64becdd8927c
### S
1. sudo!! 命令

    一些命令需要特殊的权限才能执行，忘记输sudo，会因权限不足而无法执行。在一些命令很长的情况下，再次输入整条命令会很麻烦，这时可以输入``` sudo!! ```.这样，你不需要重写整个命令，仅仅输入'!!'就可以抓取最后的命令。（当然你也可以使用方向键中的上键来回到上一条命令并在行首加上sudo。）