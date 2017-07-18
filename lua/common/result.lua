local _M = {}

function _M:error( msg )
	return _M:new(false, "9999", msg, nil)
end

function _M:success( msg, data )
	return _M:new(true, "1000", msg, data)
end

function _M:new(success, code, msg, data)
    local temp = {}
    setmetatable(temp, _M)
    temp.success = success
    temp.code = code
    temp.msg = msg
    temp.data = data
    return temp
end

return _M
