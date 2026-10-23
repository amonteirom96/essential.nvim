-- Run with a UI: nvim -u NONE -i NONE --cmd 'set rtp^=.' -c "lua dofile('tests/preview.lua')"
require("essential").setup({ cache = false })
vim.o.inccommand = "split"
vim.api.nvim_buf_set_lines(0, 0, -1, false, { "foo", "foo", "foo" })
local draws = 0
local original = vim.api.nvim_win_set_hl_ns
vim.api.nvim_win_set_hl_ns = function(win, ns)
  local preview = vim.api.nvim_get_hl(ns, { name = "Normal" })
  local expected = require("essential").colors().surface2
  assert(preview.bg == tonumber(expected:sub(2), 16), "preview namespace background: " .. vim.inspect(preview))
  assert(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)), ":t") == "[Preview]", "ordinary window was recolored")
  draws = draws + 1
  return original(win, ns)
end
local variants = { "essential-dark", "essential-light", "habamax" }
local function run(i)
  if not variants[i] then
    print("PREVIEW UI OK")
    vim.cmd("qa!")
    return
  end
  vim.cmd.colorscheme(variants[i])
  draws = 0
  vim.api.nvim_input(":%s#foo#bar#g")
  vim.defer_fn(function()
    local good = i == 3 and draws == 0 or i < 3 and draws > 0
    vim.api.nvim_input("<Esc>")
    vim.defer_fn(function()
      if not good or vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] ~= "foo" then
        vim.api.nvim_err_writeln("FAIL preview UI: " .. variants[i] .. ", draws=" .. draws)
        vim.cmd("cquit")
      else
        run(i + 1)
      end
    end, 50)
  end, 150)
end
vim.defer_fn(function() run(1) end, 50)
