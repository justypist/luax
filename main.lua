-- 首先导入import modules 等模块
_G.import=require("modules/standard/core/import")
_G.modules=import("modules/standard/core/modules")
-- Application
local functional=import("modules/standard/functional/init")
local t={a=1,b=2,3}
functional.foreach(t,function(v,k)
    print(k,v)
end)
functional.map(t,function(v,k)
    return v*100
end)
t=functional.filter(t,function(v,k)
    return v>150
end)
local result=functional.fold(t,0,function(l,r)
    return l+r
end)
print(result)
local flag=functional.every(t,function(v)
    return v>200
end)
print(flag and "true" or "false")
