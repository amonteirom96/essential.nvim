local util = require("essential.util")

local M = {}

--- ANSI 16-color table derived from the palette. Used by `:terminal` and by the
--- ghostty/kitty extras, so the editor and the terminal always match.
---@param c essential.Colors
---@return string[] 0-indexed colors
function M.ansi(c)
  local light = c.variant == "light"
  local bright = light and function(x)
    return util.darken(x, 0.12)
  end or function(x)
    return util.lighten(x, 0.14)
  end

  -- TUIs use white for text/borders and black for filled accent labels.
  -- Keep white mapped to readable text in light mode as well.
  return {
    [0] = light and c.surface1 or c.surface3,
    c.red,
    c.green,
    c.yellow,
    c.blue,
    c.purple,
    c.cyan,
    c.fg,
    c.muted,
    bright(c.red),
    bright(c.green),
    bright(c.yellow),
    bright(c.blue),
    bright(c.purple),
    bright(c.cyan),
    light and util.darken(c.fg, 0.3) or util.lighten(c.fg, 0.4),
  }
end

return M
