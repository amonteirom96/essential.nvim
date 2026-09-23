if vim.g.loaded_essential then
  return
end
vim.g.loaded_essential = true

local cmd = vim.api.nvim_create_user_command

cmd("EssentialCompile", function()
  require("essential").compile()
end, { desc = "essential: rebuild the compiled highlight cache" })

cmd("EssentialClearCache", function()
  require("essential").clear_cache()
end, { desc = "essential: delete the compiled highlight cache" })

cmd("EssentialExtras", function(args)
  local out = require("essential").extras(args.args ~= "" and args.args or nil)
  vim.notify("essential: extras written to " .. out)
end, { nargs = "?", complete = "dir", desc = "essential: generate ghostty/kitty/lazygit themes" })
