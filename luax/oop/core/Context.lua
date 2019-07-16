--[[
    Context(table|nil):table
    生成新的上下文
]]
local Meta=import("Meta")
-- local _ENV=_G
local function Context(upvalue)
    upvalue = upvalue or _ENV;
    return Meta.setMetaField({},"index",upvalue);
end
return Context;
