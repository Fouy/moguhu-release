local _M = {}

--获取文件名
function _M:getFileName(str)
    local idx = str:match(".+()%.%w+$")
    if(idx) then
        return str:sub(1, idx-1)
    else
        return str
    end
end

--获取扩展名
function _M:getExtension(str)
    return str:match(".+%.(%w+)$")
end

return _M