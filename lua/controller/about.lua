local cjson = require "cjson"
local template = require("resty.template")

local _M = {}

_M._VERSION="0.1"

-- 关于页面
function _M:index()
	template.render("blog/about.html", {})
end

return _M