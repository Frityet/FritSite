local config = require("lapis.config")
local net_utils = require("utilities.net-utilities")

local port = net_utils.get_free_port()
config("development", {
    server = "nginx",
    code_cache = "off",
    num_workers = "1",
    port = port,
})

print("Server starting at http://localhost:"..port)
