local xml_gen = require("xml-generator")
local html = xml_gen.xml

---@param args { title: string?, request: lapis.Request? }
return xml_gen.component(function (args, children)
    local req = assert(args.request, "request is required")
    return html.html {
        html.head {
            html.meta {charset="utf-8"};
            html.title(args.title or "Fritsite");
            html.link {rel="stylesheet", href="/assets/style.css"};
        };
        html.body {
            html.nav {
                class = "bg-blue-500 p-4 text-white";
                require("views.navigation")  { request=req };
            };
            html.main {
                class = "flex-grow container mx-auto p-4";
                children;
            };
            html.footer {
                class = "bg-blue-500 p-4 text-white";
                require("views.footer");
            };
        };
    }
end)
