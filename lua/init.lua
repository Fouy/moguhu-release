local cjson = require "cjson";
local configCache = ngx.shared.configCache;

local resourcesFile =  io.open("/Users/xuefeihu/hugege/code-sublime/01-moguhu/config/resources.properties", "r");
local resourcesStr = resourcesFile:read("*a");
resourcesFile:close();


local resourcesJson = cjson.decode(resourcesStr);
ngx.log(ngx.ERR, ">>>>>>>>>>>>>>>>>>>>>>>>>>>Begin Config<<<<<<<<<<<<<<<<<<<<<<<<<<");
for k,v in pairs(resourcesJson) do
	configCache:set(k, v, 0)
	ngx.log(ngx.ERR, "key:" .. k .. ", value:" .. v);
end
ngx.log(ngx.ERR, "<<<<<<<<<<<<<<<<<<<<<<<<<<<End Config>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
