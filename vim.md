# VIM
<!-- TOC -->

- [VIM](#vim)
    - [文件操作](#文件操作)
        - [多文件编辑](#多文件编辑)

<!-- /TOC -->
## 文件操作

### 多文件编辑

1. 同时打开多个文件

    ``` vim file1 file2 ...fieln ```

    在这种情况下，如果要切换文件可以使用

    ``` :n ```编辑下一个文档

    ``` :2n ```编辑下两个文档

    ``` :N ```编辑上一个文档

2. 如果已经启动了vim，可以在命令模式下输入

    ``` :open file ```

    此时可以再打开一个文件

    ``` :e ../file1 ```

    在文件之间切换：
    
    ``` :bn ```下一个文件

    ``` :bp ```上一个文件

3. 同时显示多个文件（窗格）

    ``` :split ```或简写``` :sp ```横向分割

    ``` :vsplit ```或简写``` :vsp ```纵向分割

    多个窗格之间切换的方法

    ``` Ctrl+w+方向键 ```切换到前/下/上/后一个窗格

    ``` Ctrl+w+h/j/k/l ```同上

    ``` Ctrl+ww ```依次向后切换到下一个窗格
