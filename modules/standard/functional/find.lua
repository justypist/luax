--[[
    查找
    find(table,(any,string|number,table)=>boolean):any,string|number|table
]]
local function find(tbl,callback)
    for key,value in pairs(tbl) do
        if callback(value,key,tbl) then
            return value,key,tbl;
        end
    end
    return nil;
end
return find;
