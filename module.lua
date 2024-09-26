local locals = require("utilities.locals")

-- local i = 4
-- local function my_func()
--     local self = debug.getinfo(1, "f").func
--     local n = 1
--     local k, v = debug.getupvalue(self, n)
--     while k do
--         print(k, v)
--         n = n + 1
--         k, v = debug.getupvalue(self, n)
--     end

--     return i + 1
-- end

-- my_func()

debug.sethook(1, "l", function (...)
    print(...)
end)

print "hello"
