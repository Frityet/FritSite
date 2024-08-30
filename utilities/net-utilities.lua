local socket = require("socket")

local export = {}

---@return integer
function export.get_free_port()
    local server = assert(socket.bind("*", 0))
    local _, port = server:getsockname()
    server:close()
    return port
end

return export
