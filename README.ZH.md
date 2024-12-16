# Publish PowerShell

How to publish a powershell module(Pothole Record)  

如何发布一个PowerShell模块的踩坑记录，中文[点这里](./README.ZH.md)  

## 新建项目

以项目名`ExampleModule`为例：  
1. 新建文件夹`ExampleModule`  
2. 新建文件`ExampleModule/ExampleModule.psm1`  

并且，可选地，您可以：  
3. 新建文件`ExampleModule/test.ps1`，用于测试自己的模块  
4. 新建文件`ExampleModule/publish.ps1`，用于记录发布使用的命令  

## 简单示例

PowerShell的模块里允许使用高级函数创建自己的命令(恶趣味的微软还为它起了个名字cmdlet)
高级函数必须使用`[CmdletBinding()]`进行标记，且必须在`param()`里指定所有参数
```pwsh
function test {
    [CmdletBinding()]
    param (
        [string]$para1,
        [string]$para2
    )
    
    process {
        echo $para1
        echo $para2
    }
}
```
使用这个命令(或者说cmdlet)的时候，您必须指定参数：  
这种繁琐的用法正是官方建议的：`test -para1 "Hello" -para2 "World"`

因此，在您的`test.ps1`文件中，您可以导入模块并调用test命令：
```pwsh
Import-Module "./ExampleModule.psm1"

test aaa bbb
```
运行脚本，可以在`ExampleModule`目录里打开终端，Windows可以直接使用`./test.ps1`运行脚本，其它系统(确保您正确配置了PowerShell)则需要使用`pwsh ./test.ps1`来运行脚本

但是，如果您已经执行了一次`test.ps1`脚本，或者说执行了`Import-Module "./ExampleModule.psm1"`，接下来对于模块代码的修改可能不会生效，您必须先执行一次`Remove-Module ExampleModule`移除原先的模块，因此建议您的`test.ps1`文件这样写：  
```pwsh
Remove-Module ExampleModule
Import-Module "./ExampleModule.psm1"

test aaa bbb
```

## 更灵活的写法

为了能够更灵活地控制每个参数，而不必每个都写参数名和参数值，您可以这样：
```pwsh
function test {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$args
    )
    
    process {
        $length = $args.Length

        for ($i = 0; $i -lt $length; $i++) {
            Write-Output "Argument $i  $($args[$i])"
        }
    }
}
```

此外，您还可以使用`Alias(别名)`创建新的命令：`Set-Alias print Write-Host`  

在`test.ps1`中测试一下：  
```pwsh
Remove-Module ExampleModule
Import-Module "./ExampleModule.psm1"

print xxx
test aaa bbb
```

此外，如果将`Write-Output`中的一个空格换成了`:`，可能会报错。如下图所示：  
```pwsh
for ($i = 0; $i -lt $length; $i++) {
    # 
    Write-Output "Argument $i: $($args[$i])"
}
```
报错与`$i:`相关，建议使用空格分隔。  

## 发布自己的模块
