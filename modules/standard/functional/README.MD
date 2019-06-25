# 函数式接口
> 所有函数式接口内对于数据的 **修改/删除/添加** 均为原始操作，不会触发元表
1. `foreach(table,(any,string|number,table)=>void):table`
> 遍历一个表 对于表中每个键值对使用回调函数进行处理
```
样例
local t={
    a=1,
    b=2,
    c=3
}
-- 输出表中所有键值对
foreach(t,function(v,k,t)
    print(k,v)
end)
```
2. `map(table,(any,string|number,table)=>any):table`
> 映射一个表 对于表中每个键值对使用回调函数进行处理并用回调函数的返回值替换原值
```
local t={
    a=1,
    b=2,
    c=3
}
-- 将表中所有数值放大一倍
map(t,function(v,k,t)
    return v*2
end)
```
3. `filter(table,(any,string|number,table)=>boolean):table`
> 过滤一个表 对于表中每个键值对使用回调函数进行判断 将回调函数返回值为非false|nil的键值对添加到新表中返回
```
local t={
    a=1,
    b=20,
    c=100,
    d=200
}
-- 过滤表中值小于等于50的键值对
local result=filter(t,function(v,k,t)
    return v>50
end)
```
4. `fold(table,any,(any,any,string|number,table)=>any):any`
> 规约一个表 使用初始值依次对表中每个元素使用回调函数处理 并根据回调函数的返回值更新初始值 返回规约后的最终值
```
local t={1,5,10,20}
local sum=reduce(0,function(left,right)
    return left+right
end)
print(sum)
```
5. `every(table,(any,string|number,table)=>boolean):boolean`
> 遍历一个表 依次使用表内元素调用回调函数 期间回调函数一旦返回false则整个函数立刻返回false 否则最终返回true
```
local t={1,2,3,4,5}
local flag=every(t,function(v)
    return v<10
end)
print(flag and "true" or "false")
```
6. `some(table,(any,string|number,table)=>boolean):boolean`
> 遍历一个表 依次使用表内元素调用回调函数 期间回调函数一旦返回true则整个函数立刻返回true 否则最终返回false
```
local t={1,2,3,4,5}
local flag=some(t,function(v)
    return v>3
end)
print(flag and "true" or "false")
```
7. `find(table,(any,string|number,table)=>boolean):any,string|number|table`
> 遍历一个表 依次使用表内元素调用回调函数 期间回调函数一旦返回true则整个函数立刻返回相应value,key,table 否则最终返回nil
```
local t={
    {
        name="a",
        age=10
    },{
        name="b",
        age=18
    }
}
local result=find(t,function(v)
    return v.age>=18
end)
print(result.name)
```
