local xml_gen = require("xml-generator")
local html = xml_gen.xml

---@param args { title: string?, request: lapis.Request?, main: XML.Component }
return xml_gen.component(function (args)
    local req = assert(args.request, "request is required")
    return html.html {
        html.head {
            html.meta {charset="utf-8"};
            html.title(args.title or "Fritsite");
            html.link {rel="stylesheet", href="/assets/fonts/TitillumWeb/font.css"};
            html.link {rel="stylesheet", href="/assets/styles.css"};
        };

        html.body {
            -- html.nav {
            --     class = "bg-blue-500 p-4 text-white";
            --     require("views.navigation") {request=req};
            -- };
            -- html.main {
            --     class = "flex-grow container mx-auto p-4";
            --     assert(args.main) {request=req};
            -- };
            -- html.footer {
            --     class = "bg-blue-500 p-4 text-white";
            --     require("views.footer");
            -- };

            html.div {class="min-h-screen flex flex-col future"} {
                html.header {class="p-4 future"} {
                    require("views.header") {request=req};
                };
                html.main {class="flex-grow p-4"} {
                    assert(args.main) {request=req};
                };
                html.footer {class="p-4 future"} {
                    require("views.footer");
                };
            }
        };
    }
end)
