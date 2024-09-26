local html = require("xml-generator").xml
local component = require("xml-generator").component

local h1, p, div = html.h1, html.p, html.div

---@param args { request: lapis.Request }
return component(function(args)
    return div {
        h1 {class="text-3xl font-bold mb-4 text-center"} "Fritsite",
        p "Website programmed in pure lua, which generates HTML to be viewed on a web browser";
        p "This is a project I am working on to showcase my skills and to learn more about web development.";
    }
end)
