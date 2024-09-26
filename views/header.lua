local xml_gen = require("xml-generator")
local html = xml_gen.xml
local Path = require("utilities.Path")

---@param args { request: lapis.Request? }
return xml_gen.component(function(args)
    local request = assert(args.request, "request is required")

    return html.nav {class="container mx-auto flex justify-between items-center"} {
        html.a "frityet.net" {href="/", class="text-2xl font-bold"};
        html.div {class="flex"} {
            function()
                ---@async
                ---@param text string
                ---@param ref string
                local function lnk(text, ref)
                    return coroutine.yield(html.a { text, href=ref, class="mr-4" });
                end

                for page in Path.new("site"):find("lua$") do
                    local name = page:name():gsub("%.lua$", "")
                    local pdir = page:parent_directory()
                    local non_site_dir = pdir:name() ~= "site"
                    if tonumber(name) ~= nil or (non_site_dir and name ~= "init") then goto next end
                    -- if tonumber(name) == nil and not (non_site_dir and name ~= "index") then
                    --     name = name == "index" and pdir:name() or name
                    --     lnk(name:gsub("-", " "), "/"..(name:lower()));
                    -- end

                    if name == "init" then
                        lnk(pdir:name():gsub("-", " "), "/"..(pdir:name():lower()));
                    else
                        lnk(name:gsub("-", " "), "/"..(name:lower()));
                    end

                    ::next::
                end

            end
        };
    };
end)
