# 核心库
1. `import(string)`
> 使用相对路径字符串导入指定模块
```
    string: 路径字符串（使用 '/' 分割目录）
        '.' :当前路径
        '..':返回上一层路径
        '/':(以'/'开头 相当于require(string))

    样例:
        local get=import("http/get")
        local get-import("./get")
        local get=import("/http/get") 
```
---
2. `modules(...<string>)`
> 批量导入子模块
```
样例:
----dir
    a.lua
    b.lua
    init.lua: 
        return modules("a","b")
main.lua: 
        local lib=import("dir/init")
        print(lib.a,lib.b)
```
3. `optional(!nil,string):!nil`
> 判断参数是否存在 否则抛出异常
```lua
--local a=100
local b=optional(a,"a") -- 若未定义a 则抛出异常
print(b)
```
