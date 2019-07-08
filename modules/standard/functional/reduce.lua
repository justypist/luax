--[[
    规约
    reduce(table,any,(any,any,string|number,table):any):any
]]
local function reduce(tbl,initValue,callback)
    for key,value in pairs(tbl) do
        initValue=callback(initValue,value,key,tbl);
    end
    return initValue;
end
return reduce;
