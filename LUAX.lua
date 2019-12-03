-- LUAX
-- for lua5.3
-- 具体实现
-- 单文件版本
---
-- _LUAX = nil
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
local dump = import("luax/common/base/dump")
---

-- 元表操作
--
local meta = import("luax/oop/core/Meta")
--

-- 添加监听
-- 禁止直接注册全局环境
meta.setMetaField(_ENV,"__newindex",function(ENV,k,v)
    error("禁止创建全局变量",2)
end)
-- 禁止访问不存在的全局环境
meta.setMetaField(_ENV,"__index",function(ENV,k)
    local v = rawget(ENV,k)
    assert(v,"全局变量["..stringify(k).."]不存在",2)
    return v
end)
-- 禁止修改全局环境的元表
meta.setMetaField(_ENV,"__metatable",true)
--
