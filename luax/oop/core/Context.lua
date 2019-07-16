--[[
    Context
    上下文
]]
local Meta=import("Meta")
local _ENV=_G
local function Context(upvalue)
    upvalue = upvalue or _ENV
    return Meta.setMetaField({},{__index=upvalue})
end
