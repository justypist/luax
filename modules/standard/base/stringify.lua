--[[
    字符化
    stringify(table)
]]
local function stringify(var,indentation,links)
    -- 获取类型
    local t=type(var);
    -- 缓存
    links = links or {};
    if t=="string" then
        return '"'..var..'"';
    elseif t=="number" then
        return tostring(var);
    elseif t=="boolean" then
        return var and "true" or "false";
    elseif t=="function" then
        return "function";
    elseif t=="userdata" then
        return "userdata";
    elseif t=="nil" then
        return "nil";
    elseif t=="table" then
        -- 获取link
        -- 如果对象覆写了__tostring 则需要保证其正确性
        local link=tostring(var);
        if links[link] then
            return "<linkd:"..string.sub(link,8)..">";
        else
            links[link]=true;
        end
        -- 控制缩进
        indentation =indentation and indentation+1 or 1;
        local buffer="{<"..string.sub(link,8)..">\n";
        for k,v in pairs(var) do
            buffer=buffer..string.rep("  ",indentation)..k..":"..stringify(v,indentation,links)..(next(var,k)==nil and "\n" or ",\n");
        end
        -- 由于需要与键名对其 所以-1相当于与键名同层 缩进相同
        return buffer..string.rep("  ",indentation-1).."}";
    else
        return "unknown type:["..t.."]";
    end
end
return stringify;
