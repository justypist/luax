--[[
    映射
    map(table,(any,string|number,table)=>any):table
]]
local function map(tbl,callback)
    for key,value in pairs(tbl) do
        rawset(tbl,key,callback(value,key,tbl))
    end
end
return map;
