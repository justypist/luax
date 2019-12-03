--[[
    import
    导入 使用相对路径
]]
-- clone
local clone=nil;
clone=function(t)
    if type(t)~="table" then return t end;
    local copy={};
    for k,v in pairs(t) do
        copy[k]=clone(v);
    end
    return copy;
end
-- split
local split=function(string,pattern)
	local find,sub=string.find,string.sub;
    --第一个参数必须为string
    assert(type(string)=="string","#arg 1 必须为string类型");
    --结果
    local result={};
    --如果为空string 直接返回result
    if string=="" then return result;end;
    --步长
    local step=#pattern;
    --左右边界初始化
    local left,right=1,nil;
    --开始循环
    while true do
        --找到分隔符 禁用匹配模式
        right=find(string,pattern,left,true);
        --如果没找到下一个
        if not right then
            table.insert(result,sub(string,left));
            return result;
        end;
        --分割并添加到结果
        table.insert(result,sub(string,left,right-1));
        --移动左右边界
        left,right=right+step,nil;
    end
end
-- slice
local slice=function(arr,left,right)
    local res={};
    for k,v in pairs(arr) do
        if k>right then
            return res;
        elseif not (k<left) then
            table.insert(res,v);
        end;
    end
end
-- join
local join=function(arr,delimiter)
	local str=""
	for k,v in pairs(arr) do
		str=str..v
		if k<#arr then str=str..delimiter end
	end
	return str
end
-- combine
local combine=function(currentPathArr,relativePathArr)
    -- 合并相对路径
    for index,path in pairs(relativePathArr) do
        if path=="" then
            -- 空路径
            if index==1 then
                -- 且出现在开头
                -- 初始化
                while #currentPathArr>0 do
                    table.remove(currentPathArr)
                end
            else
                -- 格式错误
                error("路径格式错误")
            end
        elseif path==".." then
            -- 如果为 ..
            -- 则视为上一层
            assert(#currentPathArr>0,"路径访问越界")
            table.remove(currentPathArr);
        elseif path=="." then
            -- 如果为 .
            -- 则视为当前层
        else
            -- 否则 添加到当前路径
            table.insert(currentPathArr,path)
        end
    end
    return currentPathArr
end
-- 当前路径数组
local currentPathArr={}
function import(relativePath)
    -- print("输入:"..relativePath)
    -- 得到相对路径数组
    local relativePathAndModuleNameArr=split(relativePath,"/");
    -- 分离相对路径与模块名
    local moduleName=table.remove(relativePathAndModuleNameArr)
    -- print("模块名:"..moduleName)
    local relativePathArr=relativePathAndModuleNameArr
    -- print("路径名:"..join(relativePathArr,"/"),#relativePathArr)
    -- 当前路径数组备份
    local bak=clone(currentPathArr)
    -- print("备份路径:"..join(bak,"/"))
    -- 合并当前路径与相对路径
    currentPathArr = combine(currentPathArr,relativePathArr)
    -- print("合并后当前路径:"..join(currentPathArr,"/"))
    -- 得到绝对路径字符串
    local absoluteStr=join(currentPathArr,".")
    -- 合并绝对路径与模块名
    if absoluteStr~="" then
        absoluteStr=absoluteStr.."."..moduleName
    else
        absoluteStr=moduleName
    end
    -- print("绝对路径字符串:"..absoluteStr)
    -- 导入模块
    local module=require(absoluteStr)
    -- print("获取module:"..moduleName)
    -- 恢复当前路径数组
    currentPathArr=bak
    -- print("恢复路径:"..join(currentPathArr,"/"))
    -- 返回得到的模块
    return module
end
return import
