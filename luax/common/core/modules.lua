--[[
    modules
    导入模块下指定文件
]]
return function(...)
    local modules={}
    for _,v in pairs({...}) do
        modules[v]=import(v)
    end
    return modules
end
