local lapis = require("lapis")
local layout = require("views.layout")
local Path = require("utilities.Path")
---@type lapis.Application
local app = lapis.Application()

---@diagnostic disable-next-line: assign-type-mismatch
app.layout = false
---@param site XML.Node
---@return string, lapis.Request.options
local function render(site)
    local doc = ("<!DOCTYPE HTML>"..tostring(site))--, { content_type = "text/html" }
    return doc, {
        content_type = "text/html"
    }
end

---@param type string
---@param mime_type string?
local function register_asset_type(type, mime_type)
    mime_type = mime_type or ("text/"..type)
    app:get(type.." asset", "/assets/*."..type, function (self)
        local path = (Path.new "assets"/self.params.splat):add_extension(type)
        if not path:exists() then return { status = 404 }
        else return assert(path:read_all()), { content_type = mime_type } end
    end)
end

register_asset_type "css"
register_asset_type("ttf", "font/ttf")
-- register_asset_type "js"
register_asset_type "html"

app:get("index", "/", function(req)
    return render(layout {request=req, main=require("site.index")})
end)

app:get("page", "/*", function(req)
    local page = req.params.splat
    local ok, site = pcall(require, "site."..page)
 
    if not ok then
        local x, opts = render(layout {request=req, main=require("site.404")})
        opts.status = 404
        return x, opts
    end
    return render(layout {request=req, main=site})
end)

return app
