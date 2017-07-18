local cjson = require "cjson"
local req = require "dispatch.req"
local result = require "common.result"
local tag_service = require "service.tag_service"
local template = require("resty.template")

local _M = {}

-- 获取列表
function _M:list()
	local list = tag_service:list()
	ngx.say(cjson.encode(result:success("查询成功", list)))
end

-- 标签云页面
function _M:index()
	local list = tag_service:list()
	local context = {list = list }
	
	template.render("blog/tags.html", context)
end

return _M