--[[
    规约
    fold(table,any,(any,any,string|number,table):any):any
]]
local function fold(tbl,initValue,callback)
    for key,value in pairs(tbl) do
        initValue=callback(initValue,value,key,tbl);
    end
    return initValue;
end
return fold;
