# 我所知道的Linux

大学期间，免不了会接触Linux系统。我在大一就听老师提及，但是我的电脑硬件和Linux系统有些不兼容而且至今还没确定到底是哪的原因（可能是显卡，[已解决](#无法进入图形化界面)）。在经历过无数次折腾后（这期间我试了四五个我所知道的Linux发行版）我终于放弃了在物理机上装Linux而转用虚拟机和服务器。（说多了都是泪）
<<<<<<< HEAD
<!-- TOC -->

- [我所知道的Linux](#我所知道的linux)
  - [Install Linux](#install-linux)
  - [使用git自动部署代码到服务器](#%e4%bd%bf%e7%94%a8git%e8%87%aa%e5%8a%a8%e9%83%a8%e7%bd%b2%e4%bb%a3%e7%a0%81%e5%88%b0%e6%9c%8d%e5%8a%a1%e5%99%a8)
    - [遇到的问题](#%e9%81%87%e5%88%b0%e7%9a%84%e9%97%ae%e9%a2%98)
  - [系统备份与恢复](#%e7%b3%bb%e7%bb%9f%e5%a4%87%e4%bb%bd%e4%b8%8e%e6%81%a2%e5%a4%8d)
    - [备份](#%e5%a4%87%e4%bb%bd)
    - [恢复](#%e6%81%a2%e5%a4%8d)
- [oh-my-zsh](#oh-my-zsh)

  - [安装比较简单](#安装比较简单)
  - [配置](#配置)
- [WPS](#wps)

  - [字体缺失问题解决](#字体缺失问题解决)
- [screen](#screen)
- [Tmux](#tmux)
- [Anaconda](#anaconda)

  - [基本操作](#基本操作)
  - [一些问题](#一些问题)
- [Transmission(Linux下的BT下载工具)](#transmissionlinux下的bt下载工具)
- [解决Mendeley Linux下无法输入中文](#解决mendeley-linux下无法输入中文)
- [一些命令行技巧](#一些命令行技巧)

  - [C](#c)
  - [H](#h)
  - [P](#p)
  - [S](#s)

=======
- [我所知道的Linux](#%e6%88%91%e6%89%80%e7%9f%a5%e9%81%93%e7%9a%84linux)
  - [Install Linux](#install-linux)
    - [无法进入图形化界面(双显卡切换)](#%e6%97%a0%e6%b3%95%e8%bf%9b%e5%85%a5%e5%9b%be%e5%bd%a2%e5%8c%96%e7%95%8c%e9%9d%a2%e5%8f%8c%e6%98%be%e5%8d%a1%e5%88%87%e6%8d%a2)
    - [安装CUDA以及cudnn](#%e5%ae%89%e8%a3%85cuda%e4%bb%a5%e5%8f%8acudnn)
  - [系统备份与恢复](#%e7%b3%bb%e7%bb%9f%e5%a4%87%e4%bb%bd%e4%b8%8e%e6%81%a2%e5%a4%8d)
    - [备份](#%e5%a4%87%e4%bb%bd)
    - [恢复](#%e6%81%a2%e5%a4%8d)
  - [oh-my-zsh](#oh-my-zsh)
    - [安装比较简单](#%e5%ae%89%e8%a3%85%e6%af%94%e8%be%83%e7%ae%80%e5%8d%95)
    - [配置](#%e9%85%8d%e7%bd%ae)
  - [WPS](#wps)
    - [字体缺失问题解决](#%e5%ad%97%e4%bd%93%e7%bc%ba%e5%a4%b1%e9%97%ae%e9%a2%98%e8%a7%a3%e5%86%b3)
  - [screen](#screen)
  - [Anaconda](#anaconda)
    - [基本操作](#%e5%9f%ba%e6%9c%ac%e6%93%8d%e4%bd%9c)
    - [一些问题](#%e4%b8%80%e4%ba%9b%e9%97%ae%e9%a2%98)
  - [Transmission(Linux下的BT下载工具)](#transmissionlinux%e4%b8%8b%e7%9a%84bt%e4%b8%8b%e8%bd%bd%e5%b7%a5%e5%85%b7)
    - [解决Mendeley Linux下无法输入中文](#%e8%a7%a3%e5%86%b3mendeley-linux%e4%b8%8b%e6%97%a0%e6%b3%95%e8%be%93%e5%85%a5%e4%b8%ad%e6%96%87)
  - [一些命令行技巧](#%e4%b8%80%e4%ba%9b%e5%91%bd%e4%bb%a4%e8%a1%8c%e6%8a%80%e5%b7%a7)
    - [C](#c)
    - [H](#h)
    - [P](#p)
    - [S](#s)
>>>>>>> b6359de (more)
## Install Linux

### 无法进入图形化界面(双显卡切换)

最近闲来无事又开始鼓捣Windows+Linux双系统，这次安装的是manjaro。毫无意外的又遇到了之前提到的无法进入图形化界面问题，但是这次在网上找到了正确的解决方案：

在Grub菜单启动界面（也就是让你选择系统的那个界面）按[E]编辑，找到quite并在后面加入(注意空格):

```acpi_osi=! acpi_osi=’Windows 2009’```

或者

```acpi_osi=! acpi_osi=Linux acpi_osi=’Windows 2015’ pcie_port_pm=off```

(很多硬件厂商的BIOS驱动都对Linux不友好，无法顺利加载ACPI模块，而导致无法驱动独立显卡,acpi_osi=’Windows 2009’的意思是告诉ACPI模块，我是‘Windows 7’，别闹情绪了，赶紧工作吧。)

接着按[Ctrl]+[x]或[F10]保存更改并启动系统。

顺利进入系统后打开终端更改配置文件

```sudo vim /etc/default/grub```

给 “**GRUB_CMLINE_LINUX_DEFAULT**”添加你可以正常启动Linux的‘acpi_osi’参数，选择上面两句中的任意一句，注意仍然是加在quite后面。

最后更新Grub文件,即可永久解决不能启动图形界面的问题

```sudo update-grub```

在经过上述设置之后，笔记本使用的是inter的集显，在日常使用是的确是比独显省不少电，但是最近在做一些机器学习方面的东西，训练神经网络时想利用一下电脑上的N卡。在网上查阅资料后发现bumblebee支持指定程序使用N卡，使用方法很简单，只需要在命令前面加一个```optirun```就可以了。比如，我是用的是Python训练神经网络，在运行时需要输入命令：```optirun python filename```，这样在训练时就可以使用N卡了。
<<<<<<< HEAD
=======
<<<<<<< HEAD

> 参考文章
> [Manjaro Linux 配置Intel与Nvidia双显卡切换](https://mtaoist.xyz/2018/03/19/Bumblebee/)

### 安装CUDA以及cudnn

CUDA、cudnn、显卡的驱动三者的版本号必须对应，具体操作应该先查看当前显卡型号并安装显卡驱动，之后根据显卡驱动的版本号找到其所[对应的CUDA版本](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html),然后根据所安装的CUDA版本选择对应的cudnn版本。

> 参考文章
> [Ubuntu18.04安装CUDA10、CUDNN](https://blog.csdn.net/qq_32408773/article/details/84112166)

## 使用git自动部署代码到服务器

> 参考文章[使用 Git 实现 项目的自动化部署](https://juejin.im/post/5d74569e5188253e547f504f)

### 遇到的问题

1. 配置好公钥后登录还是需要密码：

   首先将公钥拷贝到服务器时尽量使用```ssh-copy-id -i ~/.ssh/id_rsa username@server_ip```

   其次需要确认```~/.ssh```和```authorized_keys```的权限问题应该分别为700和600。

## 系统备份与恢复

### 备份

linux秉承一切从文件出发的原则，备份系统就相当于将整个/(根目录)打包，使用下面的命令：

```
tar cvpzf backup.tgz --exclude=/proc --exclude=/lost+found --exclude=/backup.tgz --exclude=/tmp --exclude=/mnt --exclude=/run --exclude=/media / --warning=no-file-change
```

解释一下命令的意思：

tar命令参数：

-c： 新建一个备份文档

-v： 显示详细信息

-p： 保存权限，并应用到所有文件

-z： 用gzip压缩备份文档，减小空间

-f： 指定压缩包名称（带路径），只能做最后一个参数

–exclude： 排除指定目录，不进行备份

所排除的目录：
/proc：一个虚拟文件系统，系统运行的每一个进程都会自动在这个目录下面创建一个进程目录。

/tmp：一个临时文件夹，系统的一些临时文件会放在这里。

/lost+found：系统发生错误时（比如非法关机），可以在这里找回一些丢失文件。

/media：多媒体挂载点，像u盘、移动硬盘、windons分区等都会自动挂载到这个目录下。

/mnt：临时挂载点，你可以自己挂载一些文件系统到这里。

/run：系统从启动以来产生的一些信息文件。

/backup.tgz：排除备份文件自身，否则会出现一些意想不到的问题。

### 恢复

=======
>>>>>>> e006232 (optirun)
>>>>>>> ac970d1 (optirun)
> 参考文章
> [Manjaro Linux 配置Intel与Nvidia双显卡切换](https://mtaoist.xyz/2018/03/19/Bumblebee/)

### 安装CUDA以及cudnn

CUDA、cudnn、显卡的驱动三者的版本号必须对应，具体操作应该先查看当前显卡型号并安装显卡驱动，之后根据显卡驱动的版本号找到其所[对应的CUDA版本](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html),然后根据所安装的CUDA版本选择对应的cudnn版本。
> 参考文章
> [Ubuntu18.04安装CUDA10、CUDNN](https://blog.csdn.net/qq_32408773/article/details/84112166)

## 系统备份与恢复

### 备份

linux秉承一切从文件出发的原则，备份系统就相当于将整个/(根目录)打包，使用下面的命令：
```
tar cvpzf backup.tgz --exclude=/proc --exclude=/lost+found --exclude=/backup.tgz --exclude=/tmp --exclude=/mnt --exclude=/run --exclude=/media / --warning=no-file-change
```
解释一下命令的意思：

tar命令参数：

-c： 新建一个备份文档

-v： 显示详细信息

-p： 保存权限，并应用到所有文件

-z： 用gzip压缩备份文档，减小空间

-f： 指定压缩包名称（带路径），只能做最后一个参数

–exclude： 排除指定目录，不进行备份

所排除的目录：
/proc：一个虚拟文件系统，系统运行的每一个进程都会自动在这个目录下面创建一个进程目录。

/tmp：一个临时文件夹，系统的一些临时文件会放在这里。

/lost+found：系统发生错误时（比如非法关机），可以在这里找回一些丢失文件。

/media：多媒体挂载点，像u盘、移动硬盘、windons分区等都会自动挂载到这个目录下。

/mnt：临时挂载点，你可以自己挂载一些文件系统到这里。

/run：系统从启动以来产生的一些信息文件。

/backup.tgz：排除备份文件自身，否则会出现一些意想不到的问题。

### 恢复


## oh-my-zsh

这是我使用过的最好用的终端，网上也有很多人推荐这个终端。

### 安装比较简单

1. 首先确保联网并已经安装zsh和git，没有安装的话使用下面命令安装

    ```sudo apt install zsh git -y```   #For Ubuntu/Debian

    ```sudo yum install zsh git -y```   #For Centos

2. 从GitHub上下载并启用oh-my-zsh

    ```sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"```

    启用时需要输入一下用户密码。

3. 设置oh-my-zsh为默认终端

    ```chsh -s /bin/zsh```
    
    再次输入密码即可完成。
### 配置

oh-my-zsh的配置只需要修改 _~/.zshrc_ 文件(没有的话新建即可)。

## WPS

在办公套件中，Microsoft office绝对是最好用的，可是无奈Linux下使用不了，那么就只好换WPS了（个人不太喜欢自带的liboffice）。

### 字体缺失问题解决

启动WPS for Linux后，出现提示"系统缺失字体" 。

出现提示的原因是因为WPS for Linux没有自带windows的字体，只要在Linux系统中加载字体即可。

具体操作步骤如下：

1. 下载缺失的字体文件，然后复制到Linux系统中的/usr/share/fonts文件夹中。

    国外下载地址：https://www.dropbox.com/s/lfy4hvq95ilwyw5/wps_symbol_fonts.zip

    国内下载地址：https://pan.baidu.com/s/1eS6xIzo

    （上述数据来源网络，侵删）

    下载完成后，解压并进入目录中，继续执行：

    ```sudo cp * /usr/share/fonts```

2. 执行以下命令,生成字体的索引信息：

    ```sudo mkfontscale```

    ```sudo mkfontdir```

3. 运行fc-cache命令更新字体缓存。

    ```sudo fc-cache```

4. 重启wps即可，字体缺失的提示不再出现。
   
> 参考文章
> [WPS for Linux（ubuntu）字体配置(字体缺失解决办法)](https://www.cnblogs.com/liangml/p/5969404.html)

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

### 基本操作

- 安装Anaconda直接从官网下载安装包安装即可。安装完成后需要配置一下环境变量，在～/.bashrc(如果用zsh的话，修改～/.zshrc)中添加下面一句

    ```export PATH=/home/username/anaconda3/bin:$PATH```

    注意修改**username**为自己的用户名。另外上面那一句不能写成export PATH=\$PATH:/home/lishanliao/anaconda3/bin,因为这样的话虽然是把Anaconda的路径加了进去，在系统搜索命令时，是先搜索\$PATH的路径，再搜索‘/home/lishanliao/anaconda3/bin’这部分路径，如果在\$PATH路径中有其他版本的python(例如Python2.7)，那么就不会执行Anaconda了。之后在终端运行下面的命令更新配置文件。

    ```source ~/.bashrc```或者```source ~/.zshrc```
- 添加Anaconda镜像
  
  添加国内镜像可以让我们下载软件的速度快很多，一般添加[清华的镜像](https://mirror.tuna.tsinghua.edu.cn/help/anaconda/)，修改～/.condarc文件，在其中加入下面内容:
  ```
  channels:
  - defaults
  show_channel_urls: true
  default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  ```

- 创建一个名为env_name的环境，指定Python版本是3.*（不用管是3.*.x，conda会为我们自动寻找3.*.x中的最新版本）

    ```conda create --name env_name python=3.*```
 
- 创建完环境后，使用activate激活某个环境

    ```activate env_name``` # for Windows

    ```conda activate env_name``` # for Linux & Mac

    激活后，会发现terminal输入的地方多了python3\*的字样，实际上，此时系统做的事情就是把默认Python环境（例如Python2.7）从PATH中去除，再把3.\*对应的命令加入PATH.
    此时，再次输入

    ```python --version```

    可以得到*Python 3.\*.\* :: Anaconda 4.\*.\* (64-bit)*，即系统已经切换到了3.*的环境

- 如果想返回默认的python环境，运行

    ```deactivate env_name``` # for Windows

    ```conda deactivate env_name``` # for Linux & Mac
 
- 删除一个已有的环境

    ```conda remove --name python34 --all```

### 一些问题
  
1. 在某一步conda可能会让你运行```conda init```命令，这是初始话conda默认环境，在这之后你的终端可能会多出(base)字样，如果你不习惯可以在终端运行
   
    ```conda config --set auto_activate_base false```

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
### 解决Mendeley Linux下无法输入中文

https://www.findhao.net/easycoding/2287.html

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

    Pipe Viewer工具监控通过管道的数据的进度信息, 已消耗的时间, 进度条显示的完成百分比, 当前管道的吞吐量, 已传输的数据量, 预计完成的时间等。详见：[利用pv命令监视数据的处理进度](https://www.jianshu.com/p/64becdd8927c)
### S
1. sudo!! 命令

    一些命令需要特殊的权限才能执行，忘记输sudo，会因权限不足而无法执行。在一些命令很长的情况下，再次输入整条命令会很麻烦，这时可以输入``` sudo!! ```.这样，你不需要重写整个命令，仅仅输入'!!'就可以抓取最后的命令。（当然你也可以使用方向键中的上键来回到上一条命令并在行首加上sudo。）
