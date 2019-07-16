--[[
    FnCombine
    函数合并
    FnCombine(...<function>):function
]]
local functional=import("../functional");
print("functional",functional)
local foreach,reduce=functional.foreach,functional.reduce;
local function FnCombine(...)
    local fns={...};
    foreach(fns,function(fn)
        assert(type(fn)=="function","FnCombine 参数只能包含可变数量function")
    end);
    return reduce(fns,function(left,right)
        return function(...)
            return right(left(...));
        end;
    end);
end
return FnCombine;
