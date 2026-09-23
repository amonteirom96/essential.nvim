if vim.g.loaded_exquisite then
  return
end
vim.g.loaded_exquisite = true

local cmd = vim.api.nvim_create_user_command

cmd("ExquisiteCompile", function()
  require("exquisite").compile()
end, { desc = "exquisite: rebuild the compiled highlight cache" })

cmd("ExquisiteClearCache", function()
  require("exquisite").clear_cache()
end, { desc = "exquisite: delete the compiled highlight cache" })

cmd("ExquisiteExtras", function(args)
  local out = require("exquisite").extras(args.args ~= "" and args.args or nil)
  vim.notify("exquisite: extras written to " .. out)
end, { nargs = "?", complete = "dir", desc = "exquisite: generate ghostty/kitty/lazygit themes" })
