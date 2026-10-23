-- inccommand's [Preview] split is created with autocommands suppressed.
-- Select its background during redraw, without changing window options.
local M = {}
local ns
local installed = false

function M.setup()
  ns = ns or vim.api.nvim_create_namespace("essential.preview")
  if installed then return end
  installed = true
  vim.api.nvim_set_decoration_provider(ns, {
    on_start = function()
      if not vim.g.colors_name or not vim.g.colors_name:match("^essential") then return false end
      -- :colorscheme clears non-default namespaces after loading its script.
      local spec = vim.api.nvim_get_hl(0, { name = "EssentialPreview" })
      if not vim.deep_equal(spec, vim.api.nvim_get_hl(ns, { name = "Normal" })) then
        for _, name in ipairs({ "Normal", "NormalNC", "SignColumn", "FoldColumn", "EndOfBuffer" }) do
          vim.api.nvim_set_hl(ns, name, spec)
        end
      end
      return true
    end,
    on_win = function(_, win, buf)
      if vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t") == "[Preview]"
        and vim.bo[buf].buftype == "nofile" then
        vim.api.nvim_win_set_hl_ns(win, ns)
      end
    end,
  })
end

return M
