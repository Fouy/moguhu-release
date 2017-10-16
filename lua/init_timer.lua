local cjson = require "cjson";
local configCache = ngx.shared.configCache;
local article_service = require "service.article_service"

-- 开启viewCount定时器
local delay = 3600
local handler
handler = function (premature)
	-- 查询所有IDS
	local ids = article_service:ids()

	for i,v in ipairs(ids) do
		local articleId = v["article_id"]
		-- ngx.log(ngx.ERR, "---hugege---" .. articleId)

		local viewsKey = "atricle:views:" .. articleId;
		local viewCount = configCache:get(viewsKey)
		if viewCount ~= nil and viewCount ~= "" then
			local param = {}
			param["viewCount"] = viewCount
			param["articleId"] = articleId
		    -- 更新文章查看数
		    article_service:updateCount(param)
		end
	end
	ngx.log(ngx.ERR, "viewCount缓存更新完成")

    if premature then
        return
    end
    local ok, err = ngx.timer.at(delay, handler)
    if not ok then
        ngx.log(ngx.ERR, "failed to create viewCount timer: ", err)
		return 
	end
end
local ok, err = ngx.timer.at(delay, handler)
if not ok then
    ngx.log(ngx.ERR, "failed to create viewCount timer: ", err)
return end

