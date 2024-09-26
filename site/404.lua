local html = require("xml-generator").xml
local component = require("xml-generator").component
local article = require("components.article")

---@param args { request: lapis.Request }
return component(function(args)
    return html.div {
        article.section {title="404: Page Not Found"} {
            html.p "The page you are looking for does not exist."
        }
    }
end)
