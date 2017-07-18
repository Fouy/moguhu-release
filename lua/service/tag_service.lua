local cjson = require "cjson"
local mysql = require("libs.mysql")

local _M = {}

-- 查询列表
function _M:list()
	local db = mysql:new()
	local sql = "select * from tag"

	db:query("SET NAMES utf8")
	local res, err, errno, sqlstate = db:query(sql)
	db:close()
	if not res then
		ngx.say(err)
		return {}
	end

	return res
end

-- 查询详情
function _M:detail( tagId )
	local db = mysql:new()
	local sql = "select * from tag where tag_id = %d"
	sql = string.format(sql, tonumber(tagId))

	db:query("SET NAMES utf8")
	local res, err, errno, sqlstate = db:query(sql)
	db:close()
	if not res then
		ngx.say(err)
		return {}
	end

	return res[1]
end

return _M
