--[[
    遍历
    foreach(table,(any,string|number,table)=>void):table
]]
local function foreach(tbl,callback)
    for key,value in pairs(tbl) do
        callback(value,key,tbl);
    end
end
return foreach;
