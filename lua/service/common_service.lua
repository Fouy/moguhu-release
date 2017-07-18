local cjson = require "cjson"
local mysql = require("libs.mysql")

local _M = {}

-- 查询热门文章列表
function _M:hotList()
	local db = mysql:new()
	local sql = "select * from article where hot = 1 order by create_time desc limit 5"

	db:query("SET NAMES utf8")
	local res, err, errno, sqlstate = db:query(sql)
	db:close()
	if not res then
		ngx.say(err)
		return {}
	end

	return res
end

-- 查询相关文章列表
function _M:relaList( typeId )
	local db = mysql:new()
	local sql = "select * from article where type_id = %s order by create_time desc limit 5"
	sql = string.format(sql, typeId)

	db:query("SET NAMES utf8")
	local res, err, errno, sqlstate = db:query(sql)
	db:close()
	if not res then
		ngx.say(err)
		return {}
	end

	return res
end

return _M