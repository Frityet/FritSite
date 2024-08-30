---@diagnostic disable: lowercase-global
rockspec_format = "3.0"
package = "fritsite"
version = "dev-1"
source = {
   url = "git+https://github.com/Frityet/fritsite"
}
description = {
   homepage = "https://github.com/Frityet/fritsite",
   license = "MIT"
}
dependencies = {
   "lua ~> 5.1",
   "luaxmlgenerator >= 1.1.0",
   "luafilesystem",
   "penlight",
   "lapis",
   "luasocket"
}
build = {
   type = "builtin",
   modules = {

   },
}
