--[[
    规约
    reduce(table,(any:any):any):any
]]
local next=next;
local function reduce(tbl,callback)
    local _,left=next(tbl);
    for _,right in next,tbl,left do
        left=callback(left,right);
    end
    return left;
end
return reduce;
