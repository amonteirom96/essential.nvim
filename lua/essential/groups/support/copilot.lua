-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/zbirenbaum/copilot.lua"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CopilotAnnotation = { fg = c.surface1 },
    CopilotSuggestion = { fg = c.surface1 },
  }
  return ret
end

return M
