local lapis = require("lapis")
local layout = require("views.layout")
local pretty = require("pl.pretty")
local html = require("xml-generator").xml
local Path = require("utilities.path-utilities")
---@type lapis.Application
local app = lapis.Application()


---@diagnostic disable-next-line: assign-type-mismatch
app.layout = false

local function render(site)
    return ("<!DOCTYPE HTML>"..tostring(site)), { content_type = "text/html" }
end

---@param type string
---@param mime_type string?
local function register_asset_type(type, mime_type)
    mime_type = mime_type or ("text/"..type)
    app:get("/assets/*."..type, function (self)
        local path = (Path.new "assets"/self.params.splat):add_extension(type)
        print("Looking for "..tostring(path))
        if not path:exists() then return { status = 404 }
        else return assert(path:read_all()), { content_type = mime_type } end
    end)
end

-- app:get("/assets/*.css", function (self)
--     local path = (Path.new "site"/self.params.splat):add_extension("css")
--     print("Looking for "..tostring(path))
--     if not path:exists() then return { status = 404 }
--     else return assert(path:read_all()), { content_type = "text/css" } end
-- end)
register_asset_type "css"
-- register_asset_type "js"
register_asset_type "html"

app:get("/", function(req)
    return render(layout(require("site.index")) {request=req})
end)

return app
