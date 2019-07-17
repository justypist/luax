-- LUAX
-- for lua5.3
-- 具体实现
-- 单文件版本
---
_LUAX = nil
---

-- 核心
---
import=require("luax.common.core.import");
modules=require("luax.common.core.modules");
optional=require("luax.common.core.optional")
---

-- 函数式
---
local functional=import("luax/common/functional/init");
---

-- 字符化
---
local stringify=import("luax/common/base/stringify");
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
		-- 函数式
		foreach=functional.foreach,
		map=functional.map,
		reduce=functional.reduce,
		filter=functional.filter,
		every=functional.every,
		find=functional.find,
		some=functional.some,
        -- 协程
        coroutine=coroutine,
        -- 字符串
        string=string,
		stringify=stringify,
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
        pcall=pcall,
        xpcall=xpcall,
		dofile=dofile,
        loadfile=loadfile,
        assert=assert,
        error=error,
		-- 打印
		print=print,
		dump=function(...)
			foreach({...},function(v)
				print(stringify(v))
			end)
		end,
        -- 包管理
        require=require,
        package=package,
		import=import,
		modules=modules,
        -- 类型
        tonumber=tonumber,
        tostring=tostring,
        type=type,
        -- 保留原全局表
        _G=_G,
		-- 版本
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
            error("Variable["..key.."] mustn't be defined as Global Variable",2)
        end,
        -- 防止元表被修改
        __metatable=true
    })
    -- 指向自身
    -- _LUAX_ENVIRONMENT._LUAX_ENVIRONMENT=_LUAX_ENVIRONMENT;
    -- 替换当前上下文
    _ENV=_LUAX_ENVIRONMENT;
end
-- 打印测试是否配置上下文成功
-- dump(_ENV)

