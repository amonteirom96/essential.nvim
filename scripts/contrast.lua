-- Validates WCAG contrast of every palette color against its background.
-- Usage: nvim --headless -u NONE --cmd "set rtp^=." -l scripts/contrast.lua

local util = require("exquisite.util")
local palette = require("exquisite.palette")

local MIN_TEXT, MIN_UI = 4.5, 3.0
local keys = { "fg", "red", "orange", "yellow", "green", "cyan", "azure", "blue", "purple" }
local failed = false

for _, variant in ipairs({ "light", "dark" }) do
  local c = palette.get(variant, {})
  print(("\n%s  bg=%s"):format(variant:upper(), c.bg))
  for _, k in ipairs(keys) do
    local r = util.contrast(c[k], c.bg)
    local r2 = util.contrast(c[k], c.surface2)
    local ok = r >= MIN_TEXT and r2 >= MIN_TEXT
    failed = failed or not ok
    print(("  %-7s %s  on bg %5.2f  on surface2 %5.2f  %s"):format(k, c[k], r, r2, ok and "ok" or "FAIL"))
  end
  local m = util.contrast(c.muted, c.bg)
  failed = failed or m < MIN_UI
  print(("  %-7s %s  on bg %5.2f  (UI chrome, min %.1f)"):format("muted", c.muted, m, MIN_UI))
end

if failed then
  os.exit(1)
end
