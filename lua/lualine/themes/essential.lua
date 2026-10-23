local c = require("essential").colors()
local ret = {}
for mode, color in pairs({ normal = c.blue, insert = c.green, visual = c.variant == "light" and c.cyan or c.red,
  replace = c.orange, command = c.azure, terminal = c.cyan }) do
  ret[mode] = {
    a = { fg = c.bg, bg = color, gui = "bold" },
    b = { fg = color, bg = c.surface2 },
    c = { fg = c.fg, bg = c.surface2 },
  }
end
ret.inactive = {
  a = { fg = c.muted, bg = c.surface1 },
  b = { fg = c.muted, bg = c.surface1 },
  c = { fg = c.muted, bg = c.surface1 },
}
return ret
