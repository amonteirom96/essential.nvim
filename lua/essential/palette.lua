local util = require("essential.util")

local M = {}

--- Base palettes. Everything else is derived from these ten colors.
--- `fg` is the ONE color used for code. Accents are reserved for places where
--- color carries meaning (git, diagnostics, LSP kinds, icons, search).
---@type table<"light"|"dark", essential.BasePalette>
M.base = {
  light = {
    bg = "#eef2f8", -- paper: white leaning to a soft, cool blue
    fg = "#262b36", -- near-black leaning to blue
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
    bg = "#232833", -- slate: dark gray leaning to blue
    fg = "#d0d6e1", -- white leaning to a cool blue-gray
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
---@field search string      background for search matches
---@field code essential.CodeColors  tones of `fg` for code roles
---@field git { add: string, change: string, delete: string }
---@field diag { error: string, warn: string, info: string, hint: string, ok: string }

--- Code roles. Every value is a tone of `fg` (same hue, different strength),
--- never a separate color.
---@class essential.CodeColors
---@field keyword string
---@field func string
---@field type string
---@field variable string
---@field string string
---@field constant string
---@field punctuation string
---@field comment string

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
  -- Tinted accent, same hue family as bg so it stays clean (a yellow blend
  -- turns muddy gray here). Stronger than surface3 so it reads apart from Visual.
  c.search = blend(c.accent, c.bg, is_light and 0.30 or 0.35)

  -- Code tones: one hue, several strengths. `strong` pushes fg away from bg,
  -- the others pull it toward bg. Every tone stays >= 4.5:1 on bg.
  local strong = is_light and util.darken(c.fg, 0.45) or util.lighten(c.fg, 0.55)
  local soft = blend(c.fg, c.bg, 0.88)
  local subtle = blend(c.fg, c.bg, 0.78)
  if opts.tones == false then
    strong, soft, subtle = c.fg, c.fg, c.fg
  end
  c.code = {
    keyword = strong,
    func = strong,
    type = c.fg,
    variable = c.fg,
    string = soft,
    constant = soft,
    punctuation = subtle,
    comment = opts.muted_comments and c.muted or opts.tones == false and c.fg or blend(c.fg, c.bg, 0.72),
  }

  c.git = { add = c.green, change = c.blue, delete = c.red }
  c.diag = { error = c.red, warn = c.yellow, info = c.blue, hint = c.cyan, ok = c.green }

  if opts.on_colors then
    opts.on_colors(c, variant)
  end
  return c
end

return M
