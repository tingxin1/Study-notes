

## 可视化

### 1. Tensorboard
tensorboard原本是tensorflow的可视化工具，但是由于其简单易用，有人通过python库将pytorch中的参数传入tensorboard中进行显示，环境要求：**tensorflow、tensorboard、tensorboardx**。但是pytorch1.2.0版本就已经内置支持tensorboard了，所以如果pytorch>=1.2.0只需要安装**tensorboard**就可以使用了。

```python
from torch.utils.tensorboard import SummaryWriter
```

### 2. Visdom
Visdom是Facebook在2017年发布的一款针对PyTorch的可视化工具。visdom由于其功能简单，一般会被定义为服务器端的matplot，也就是说我们可以直接使用python的控制台模式进行开发并在服务器上执行，将一些可视化的数据传送到Visdom服务上，通过Visdom服务进行可视化。

Visdom在显示神经网络训练数据方面的易用性远不如tensorboard。

> 参考文章
> [PyTorch之—可视化](https://blog.csdn.net/wsp_1138886114/article/details/87602112)