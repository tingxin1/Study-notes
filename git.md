# git命令

## 查看历史——[```git log```](https://git-scm.com/docs/git-log/zh_HANS-CN)

```git log <file>```：查看指定文件或目录的历史提交。

```-p```：按补丁格式显示每个提交引入的差异。

```--stat```：显示每次提交的文件修改统计信息。

```--graph```：在日志旁以ASCII图形显示分支与合并历史。

```--pretty```：使用其它格式显示历史提交信息。可用的选项包括```oneline```、```short```、```full```、```fuller```和```format```（用来自定义自己的格式）。例如：```--pretty=oneline```。

```--abbrev-commit```：仅显示SHA-1校验和所有40个字符中的前几个字符。

```--oneline```：```--pretty=oneline --abbrev-commit```合用的简写。

```-n```:显示最近n次的提交。

```--since,--after```：仅显示指定时间之后的提交。时间格式可以是具体的某一天“2020-01-15”，也可以是相对时间“2weeks”

```--until, --before```：仅显示指定时间之前的提交。

```--grep```：仅显示含指定关键字的提交。

```--S```：仅显示添加或移除了某个关键字的提交。
