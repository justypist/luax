--[[
    倾倒
    dump(...):void
]]
local stringify=import("stringify");
local print=print;
local function dump(...)
    for _,v in pairs({...}) do
        print(stringify(v))
    end
end
return dump;
