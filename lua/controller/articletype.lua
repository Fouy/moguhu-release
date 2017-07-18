local cjson = require "cjson"
local req = require "dispatch.req"
local result = require "common.result"
local article_type_service = require "service.article_type_service"
local common_service = require "service.common_service"
local template = require("resty.template")

local _M = {}

-- 获取类型列表
function _M:list()
	local list = article_type_service:list()
	ngx.say(cjson.encode(result:success("查询成功", list)))
end

-- 类型页面
function _M:type()
	local list = article_type_service:list()
	local context = {list = list}
	
	-- 增加热门文章数据
	context["hotList"] = common_service:hotList()
	template.render("blog/type.html", context)
end

return _M