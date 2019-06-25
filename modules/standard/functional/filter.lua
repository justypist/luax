--[[
    过滤
    filter(table,(any,string|number,table)=>boolean):table
]]
assert(table and table.remove,"table.remove 函数缺失")
assert(type,"type 函数缺失")
local remove=table.remove;
local function filter(tbl,callback)
    for key,value in pairs(tbl) do
        local result=callback(value,key,table);
        if not result then
            if type(key)=="string" then
                rawset(tbl,key,nil);
            else
                remove(tbl,key);
            end
        end
    end
end
return filter;
