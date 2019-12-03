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
3. `BaseVariableTypeNameSet`
> 基础变量类型名称集合
* number    数字
* string    字符串
* table     表
* function  函数
* boolean   布尔值
* userdata  c数据
* nil       空
* thread    线程
4. `overload`
> 函数重载(基础)
* 定义函数
`define(table,function,...<string>):table`
* 匹配函数
`match(table,...<any>):function|nil`
**两者需要配合使用 只提供底层实现 需要自行封装改善代码风格**
```lua
local overload=import("modules/standard/base/overload")
local match,define=overload.match,overload.define
local funcSet={}
define(funcSet,function(str)
    print("this is a string");
end,"string")
define(funcSet,function(num)
    print("this is a number")
end,"number")
local args={"test msg"}
local funcBody=match(funcSet,table.unpack(args))
assert(funcBody,"not match")
funcBody(table.unpack(args))
```
```lua
define(funcSet,function()end)
define(funcSet,function(...)end,"...")
此时若参数列表为空 则优先匹配第一个函数体 `...`作为可变参数 优先级最低
```
5. Noop
> 空函数 (do nothing)
