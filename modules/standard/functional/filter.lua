--[[
    过滤
    filter(table,(any,string|number,table)=>boolean):table
]]
assert(table and table.insert,"table.insert 函数缺失")
assert(type,"type 函数缺失")
assert(rawset,"rawset 函数缺失")
local insert=table.insert;
local rawset=rawset;
local function filter(tbl,callback)
    local new={}
    for key,value in pairs(tbl) do
        local result=callback(value,key,table);
        if result then
            if type(key)=="string" then
                rawset(new,key,value);
            else
                insert(new,value);
            end
        end
    end
    return new;
end
return filter;
