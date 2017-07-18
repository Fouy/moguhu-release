local mysql = require "resty.mysql"
local configCache = ngx.shared.configCache;

local config = {
	host = configCache:get("mysql.host"),
	port = configCache:get("mysql.port"),
	database = configCache:get("mysql.database"),
	user = configCache:get("mysql.user"),
	password = configCache:get("mysql.password"),
	max_package_size = configCache:get("mysql.max_package_size"),
	charset = configCache:get("mysql.charset")
}

local _M = {}

function _M.new( self )
	local db, err = mysql:new()
	if not db then
		return nil
	end
	db:set_timeout(1000)

	local ok, err, errno, sqlstate = db:connect(config)

	if not ok then
		return nil
	end
	db.close = close
	return db
end


function close( self )
	local sock = self.sock
	if not sock then
		return nil, "not initialized"
	end
	if self.subscribed then
		return nil, "subscribed state"
	end
	return sock:setkeepalive(10000, 50)
end

return _M
