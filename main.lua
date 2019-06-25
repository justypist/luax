-- 首先导入import modules 等模块
_G.import=require("modules/standard/core/import")
_G.modules=import("modules/standard/core/modules")
-- Application
local clone=import("modules/standard/base/clone")
local t={1,2,3}
print(clone(t)==t and "true" or "false")
