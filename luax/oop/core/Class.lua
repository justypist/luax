--[[
    Class(name):
    类
]]
local Context=import("Context");
local function Class(ClassName)
    return function(ClassBody)
        local ctx=Context();
        ClassBody(ctx);
        return ctx;
    end
end
return Class;
