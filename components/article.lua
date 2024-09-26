local component = require("xml-generator").component
local html = require("xml-generator").xml

local export = {}

---@param args { title: string }
export.section = component(function (args, kids)
    local title = assert(args.title, "title is required")
    return html.section {class="my-8"} {
        html.h2 {class="text-3xl font-bold mb-4"} (title);
        kids;
    }
end)

return export
