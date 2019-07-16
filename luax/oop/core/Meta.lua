--[[
    Meta
    元操作
]]
local getmetatable,setmetatable=getmetatable,setmetatable;
local rawget,rawset=rawget,rawset;
-- 元表中字段映射
local MetaField=import("MetaField");
-- 获取元表中某一字段的值
-- getMetaField(table,string):table|function|nil
local function getMetaField(t,fieldName)
    local realMetaFieldName=MetaField[fieldName];
    assert(realMetaFieldName,"getMetaField 元字段不存在于MetaField");
    local meta=getmetatable(t) or {};
    return rawget(meta,realMetaFieldName);
end
-- 设定元表中某一字段的值
-- setMetaField(table,string,function|table|nil):table
local function setMetaField(t,fieldName,fieldValue)
    local realMetaFieldName=MetaField[fieldName];
    assert(realMetaFieldName,"getMetaField 元字段不存在于MetaField");
    local meta=getmetatable(t) or {};
    rawset(meta,realMetaFieldName,fieldValue);
    return setmetatable(t,meta);
end
local Meta={
    getMetaField=getMetaField,
    setMetaField=setMetaField
}
return Meta;
