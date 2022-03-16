## 安装步骤

### 硬件状态检测程序

硬件检测程序是安装在各个节点上，用于实时监测硬件的状态，并将硬件的参数信息统一汇总，对外用一个统一的api展示，供主服务器的数据收集程序调用。

1. **安装依赖**

DCGM（[Data Center GPU Manager](https://developer.nvidia.com/dcgm)）是一套用于在集群环境中管理和监控NVIDIA Data Center GPU的工具。它包括活动运行状况监视、全面诊断、系统警报和治理策略(包括电源和时钟管理)。在官网下载得到一个`.deb`包，然后直接安装即可。

```bash
sudo dpkg -i datacenter-gpu-manager*.deb
```

安装[golang](https://golang.org/doc/install)

下载`.deb`包，然后根据安装教程使用tar命令解压

```bash
sudo tar -C /usr/local -xzf go*.tar.gz
```

然后需要配置环境变量，在`.profile`文件的最后一行添加：

```bash
export PATH=$PATH:/usr/local/go/bin
```

然后使用```source ~/.profile```使配置生效。

由于编译安装过程中需要sudo权限，所以需要单独为sudo配置环境，参考：[sudo 找不到命令 go](https://www.cnblogs.com/chr-wonder/p/8464224.html)

具体做法：编辑`/etc/sudoers` 文件，将`/usr/local/go/bin`添加到

```bash
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

添加之后为

```bash
Defaults        secure_path="/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

2. **安装[GPU Monitoring Tools](https://github.com/NVIDIA/gpu-monitoring-tools)**

最简单直接的方法就是使用docker，但是并不推荐，因为程序要检测硬件状态，直接装在物理机上比较好，资源消耗也比用docker小，所以使用手动编译安装。

```bash
$ git clone https://github.com/NVIDIA/gpu-monitoring-tools.git
$ cd gpu-monitoring-tools
$ make binary
$ sudo make install
...
$ dcgm-exporter &
$ curl localhost:9400/metrics
# HELP DCGM_FI_DEV_SM_CLOCK SM clock frequency (in MHz).
# TYPE DCGM_FI_DEV_SM_CLOCK gauge
# HELP DCGM_FI_DEV_MEM_CLOCK Memory clock frequency (in MHz).
# TYPE DCGM_FI_DEV_MEM_CLOCK gauge
# HELP DCGM_FI_DEV_MEMORY_TEMP Memory temperature (in C).
# TYPE DCGM_FI_DEV_MEMORY_TEMP gauge
...
DCGM_FI_DEV_SM_CLOCK{gpu="0", UUID="GPU-604ac76c-d9cf-fef3-62e9-d92044ab6e52"} 139
DCGM_FI_DEV_MEM_CLOCK{gpu="0", UUID="GPU-604ac76c-d9cf-fef3-62e9-d92044ab6e52"} 405
DCGM_FI_DEV_MEMORY_TEMP{gpu="0", UUID="GPU-604ac76c-d9cf-fef3-62e9-d92044ab6e52"} 9223372036854775794
...
```

3. 添加开机启动服务
