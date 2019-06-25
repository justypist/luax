# 基础库
1. `stringify(any):string`
> 将任意参数字符化
```
local t={
    a=1,b=2
}
print(stringify(t))
```
2. `clone(any):any`
> 深度克隆
```
local t={a=1,b=2}
local t2=clone(t)
print(t==t2 and "true" or "false")
```
