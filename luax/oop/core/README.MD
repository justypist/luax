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
2. MetaField
> 元字段

identifier|name|operator
:--:|:-----:|:--:
add|加|+
sub|减|-
mul|乘|*
div|除|/
mod|模|%
pow|幂|^
unm|负|-
idiv|整除|//
band|按位与|&
bor|按位或|`|`
bxor|按位异或|~
bnot|按位否|~
shl|左移|<<
shr|右移|>>
concat|连接|..
len|取长|#
eq|相等|==
lt|小于|<
le|小于等于|<=
call|调用|()
index|索引|
newindex|新值|
gc|垃圾回收|
