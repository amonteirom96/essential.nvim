-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  local ret = {
    RenderMarkdownBullet    = {fg = c.orange}, -- horizontal rule
    RenderMarkdownCode      = { bg = c.surface1 },
    RenderMarkdownDash      = {fg = c.orange}, -- horizontal rule
    RenderMarkdownTableHead = { fg = c.orange},
    RenderMarkdownTableRow  = { fg = c.orange},
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline"
  }
  for i, color in ipairs(c.rainbow) do
    ret["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.1) }
    ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
  end
  return ret
end

return M
