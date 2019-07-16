--[[
    重载
    overload
    define(table,function,...<string>):table
    match(table,...<any>):function|nil
]]
local BaseVariableTypeNameSet=import("BaseVariableTypeNameSet");
local type,pairs,rawget,rawset,assert,insert=type,pairs,rawget,rawset,assert,table.insert;

local FunctionBodyIndexName="FunctionBody";
local VariableParameterIdentifier="...";

-- 定义函数至函数集
local function define(funcSet,funcBody,...)
    assert(type(funcSet)=="table","overload.define #arg 1 must be table");
    assert(type(funcBody)=="function","overload.define #arg 2 must be function");
    local argTypeNameList={...};
    local _funcSet=funcSet;
    for index,typeName in pairs(argTypeNameList) do
        assert(type(typeName)=="string",
            "overload.define #arg "..index.." must be string");
        assert(rawget(BaseVariableTypeNameSet,typeName) or typeName==VariableParameterIdentifier,
            "overload.define #arg "..index.."["..typeName.."] must be exist in BaseVariableTypeNameSet");
        rawset(_funcSet,typeName,rawget(_funcSet,typeName) or {});
        _funcSet=rawget(_funcSet,typeName);
    end
    rawset(_funcSet,FunctionBodyIndexName,funcBody);
    return funcSet;
end
-- 函数集中匹配函数体 > 中间过程
local function matchFuncBody(funcSet,argTypeNameList,index)
    index = index or 1;
    if index>#argTypeNameList then return nil end;
    local argTypeName=rawget(argTypeNameList,index);
    if rawget(funcSet,argTypeName) then
        if index==#argTypeNameList then
            return rawget(rawget(funcSet,argTypeName),FunctionBodyIndexName);
        end
        local funcBody=matchFuncBody(rawget(funcSet,argTypeName),argTypeNameList,index+1);
        if type(funcBody)=="function" then return funcBody;end
    end
    if rawget(funcSet,VariableParameterIdentifier) then
        return rawget(rawget(funcSet,VariableParameterIdentifier),FunctionBodyIndexName);
    end
    return nil;
end
-- 函数集中匹配函数体
local function match(funcSet,...)
    local args={...};
    local argTypeNameList={};
    for index,arg in pairs(args) do insert(argTypeNameList,type(arg));end
    if #args==0 then return rawget(funcSet,FunctionBodyIndexName) or rawget(funcSet,VariableParameterIdentifier);end
    return matchFuncBody(funcSet,argTypeNameList);
end
local overload={
    define=define,
    match=match
};
return overload;
