local xml_gen = require("xml-generator")
local html = xml_gen.xml

---@param args { request: lapis.Request? }
return xml_gen.component(function(args)
    local request = assert(args.request, "request is required")

    --todo, auto-generate this based off pages in site/
    return html.div {class="container mx-auto flex justify-between items-center"} {
        html.a "frityet.net" {href="#", class="text-2xl font-bold"};
        html.div {
            function()
                ---@async
                ---@param text string
                ---@param ref string
                local function lnk(text, ref)
                    return coroutine.yield(html.a { text, href=ref, class="mr-4" });
                end
                local pages = {
                    { "Home", "#home" },
                    { "About", "#about" },
                    { "Projects", "#projects" },
                    { "Contact", "#contact" }
                }
                for _, page in ipairs(pages) do
                    lnk(page[1], page[2]);
                end
            end
        };
    };
end)
