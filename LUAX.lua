-- LUAX
-- for lua5.3
-- 具体实现
-- 单文件版本
---
_LUAX = nil
---

-- LUAX 环境配置
do
    -- 配置
    _LUAX_ENVIRONMENT = setmetatable({
        -- 表
        table=table,
        rawset=rawset,
        rawget=rawget,
        rawequal=rawequal,
        rawlen=rawlen,
        getmetatable=getmetatable,
        setmetatable=setmetatable,
        -- 协程
        coroutine=coroutine,
        -- 字符串
        string=string,
        utf8=utf8,
        -- 迭代器
        pairs=pairs,
        ipairs=ipairs,
        next=next,
        select=select,
        -- 数学
        math=math,
        -- 系统
        os=os,
        -- 输入输出
        io=io,
        file=file,
        -- 调试运行
        debug=debug,
        print=print,
        pcall=pcall,
        xpcall=xpcall,
        assert=assert,
        error=error,
        dofile=dofile,
        loadfile=loadfile,
        -- 包管理
        require=require,
        package=package,
        -- 类型
        tonumber=tonumber,
        tostring=tostring,
        type=type,
        -- 杂项
        _G=_G,
        LUA_VERSION=_VERSION:match("%d+%.?%d*"),
        -- 空操作
        Noop=function()end,
    },{
        -- 禁止访问未定义变量
        __index=function(this,key)
            error("Variable["..key.."] is not found",2);
        end,
        -- 禁止定义全局变量
        __newindex=function(this,key,value)
            error("Variable["..key.."] mustn't be defined as Global Variable")
        end,
        -- 防止元表被修改
        __metatable=true
    })
    -- 指向自身
    _LUAX_ENVIRONMENT._LUAX_ENVIRONMENT=_LUAX_ENVIRONMENT;
    -- 环境变量生效
    _ENV=_LUAX_ENVIRONMENT;
end
