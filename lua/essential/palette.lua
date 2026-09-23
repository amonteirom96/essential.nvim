local util = require("essential.util")

local M = {}

--- Base palettes. Everything else is derived from these ten colors.
--- `fg` is the ONE color used for code. Accents are reserved for places where
--- color carries meaning (git, diagnostics, LSP kinds, icons, search).
---@type table<"light"|"dark", essential.BasePalette>
M.base = {
  light = {
    bg = "#f6f3e8", -- paper: white leaning to a soft, quiet yellow
    fg = "#2e2c28", -- warm near-black gray
    red = "#a53d38",
    orange = "#904e1b",
    yellow = "#765d0c",
    green = "#366b2c",
    cyan = "#1a6a72",
    azure = "#266396",
    blue = "#3b5bb2",
    purple = "#764ba3",
  },
  dark = {
    bg = "#29292a", -- neutral gray
    fg = "#d4d2cc", -- white leaning to gray
    red = "#e8938d",
    orange = "#e0a574",
    yellow = "#d6bf7e",
    green = "#9fc48c",
    cyan = "#84bfc1",
    azure = "#85b5dd",
    blue = "#94a8e8",
    purple = "#bb9fe3",
  },
}

---@class essential.BasePalette
---@field bg string
---@field fg string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field cyan string
---@field azure string
---@field blue string
---@field purple string

---@class essential.Colors: essential.BasePalette
---@field variant "light"|"dark"
---@field none "NONE"
---@field bg_float string
---@field bg_dim string      background for inactive windows (dim_inactive)
---@field surface1 string    cursorline, subtle rows
---@field surface2 string    selection, active tab, statusline
---@field surface3 string    stronger selection / match paren
---@field border string
---@field muted string       UI chrome only (line numbers, whitespace) — never code
---@field accent string      single UI focal color (matches, prompts)
---@field git { add: string, change: string, delete: string }
---@field diag { error: string, warn: string, info: string, hint: string, ok: string }

--- Build the full, derived color table for a variant.
---@param variant "light"|"dark"
---@param opts essential.Config
---@return essential.Colors
function M.get(variant, opts)
  local b = vim.deepcopy(M.base[variant])
  local c = b --[[@as essential.Colors]]
  local is_light = variant == "light"
  local blend = util.blend

  c.variant = variant
  c.none = "NONE"

  c.surface1 = blend(c.fg, c.bg, is_light and 0.05 or 0.055)
  c.surface2 = blend(c.fg, c.bg, is_light and 0.10 or 0.11)
  c.surface3 = blend(c.fg, c.bg, is_light and 0.17 or 0.19)
  c.border = blend(c.fg, c.bg, is_light and 0.26 or 0.28)
  c.muted = blend(c.fg, c.bg, is_light and 0.52 or 0.50)
  c.bg_dim = is_light and blend(c.fg, c.bg, 0.03) or util.darken(c.bg, 0.12)
  c.bg_float = c.bg
  c.accent = c.blue

  c.git = { add = c.green, change = c.blue, delete = c.red }
  c.diag = { error = c.red, warn = c.yellow, info = c.blue, hint = c.cyan, ok = c.green }

  if opts.on_colors then
    opts.on_colors(c, variant)
  end
  return c
end

return M
