# oop基础工具
1. Meta
> 元操作

    - 获取元表中某一字段的值  
    - getMetaField(table,string):table|function|nil

    - 设定元表中某一字段的值  
    - setMetaField(table,string,function|table|nil):table

```lua
local t={}
Meta.setMetaField(t,"index",function(t)
    return 999
end)
print(t.a,t.adsad)
```
