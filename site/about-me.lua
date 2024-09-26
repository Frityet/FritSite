local html = require("xml-generator").xml
local component = require("xml-generator").component

---@param args { request: lapis.Request }
return component(function(args)
    return html.div {
        html.p "This is all about me!"
    }
end)
