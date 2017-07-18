local cjson = require "cjson"
local req = require "dispatch.req"
local result = require "common.result"
local template = require("resty.template")

local _M = {}

-- 404页面
function _M:four04()
	template.render("404.html", {})
end

return _M