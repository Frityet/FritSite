local html = require("xml-generator").xml
local component = require("xml-generator").component
local article = require("components.article")
local Path = require("utilities.Path")

local p = html.p
---@param args { request: lapis.Request }
return component(function(args)
    return html.div {class="future"} {
        article.section {title="Welcome to My Personal Website"} {
            p "This is where I showcase my skills, projects, and share a bit about myself."
        };
        article.section {title="About Me"} {
            p "I am a developer with a passion for creating awesome things with Lua."
        };
        article.section {title="My Projects"} {
            p "Check out some of the cool projects I've worked on."
        };
    }
end)
