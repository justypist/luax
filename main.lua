-- 首先导入import modules 等模块
_G.import=require("modules/standard/core/import")
_G.modules=import("modules/standard/core/modules")
-- Application
local stringify=import("modules/standard/base/stringify")
print(stringify({
    a=1,b=2
}))
