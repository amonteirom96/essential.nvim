local c = require("essential").colors()
local ret = {}
for mode, color in pairs({ normal = c.blue, insert = c.green, visual = c.variant == "light" and c.cyan or c.red,
  replace = c.orange, command = c.azure, terminal = c.cyan }) do
  ret[mode] = {
    left = { { c.bg, color }, { color, c.surface2 } },
    middle = { { c.fg, c.surface2 } },
    right = { { c.bg, color }, { color, c.surface2 } },
  }
end
ret.normal.error = { { c.bg, c.diag.error } }
ret.normal.warning = { { c.bg, c.diag.warn } }
ret.inactive = {
  left = { { c.muted, c.surface1 } }, middle = { { c.muted, c.surface1 } }, right = { { c.muted, c.surface1 } },
}
ret.tabline = {
  left = { { c.muted, c.surface1 } }, middle = { { c.muted, c.bg } },
  right = { { c.muted, c.surface1 } }, tabsel = { { c.fg, c.surface2 } },
}
return ret
