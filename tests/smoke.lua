-- nvim --headless -u NONE --cmd "set rtp^=." -l tests/smoke.lua
local ok_all = true
local function check(cond, msg)
  if not cond then ok_all = false; print("FAIL: " .. msg) end
end

vim.env.XDG_CACHE_HOME = vim.fn.tempname()
local ex = require("essential")

for _, name in ipairs({ "essential-light", "essential-dark", "essential" }) do
  local ok, err = pcall(vim.cmd.colorscheme, name)
  check(ok, name .. ": " .. tostring(err))
  check(vim.g.colors_name == name, name .. ": colors_name=" .. tostring(vim.g.colors_name))
  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  check(normal.fg and normal.bg, name .. ": Normal has fg/bg")
  -- code is one hue in several tones: roles differ, but only in strength
  local function fg(g)
    return vim.api.nvim_get_hl(0, { name = g, link = false }).fg
  end
  check(fg("@variable") == normal.fg and fg("Type") == normal.fg, name .. ": variables/types use fg")
  check(fg("Keyword") == fg("Function") and fg("Keyword") ~= normal.fg, name .. ": keywords/functions stronger")
  check(fg("String") == fg("Number") and fg("String") ~= normal.fg, name .. ": strings/constants softer")
  check(fg("Comment") ~= fg("String") and fg("Comment") ~= normal.fg, name .. ": comments quieter")
  check(fg("@function.call") == fg("Function"), name .. ": treesitter follows legacy tones")
  -- statusline groups ship with the theme
  check(vim.api.nvim_get_hl(0, { name = "StGit" }).fg == vim.api.nvim_get_hl(0, { name = "GitSignsAdd" }).fg, name .. ": StGit uses git add")
  check(vim.api.nvim_get_hl(0, { name = "StModeNormal" }).bg ~= nil, name .. ": StModeNormal")
  -- color where it matters
  local add = vim.api.nvim_get_hl(0, { name = "GitSignsAdd" }).fg
  local del = vim.api.nvim_get_hl(0, { name = "GitSignsDelete" }).fg
  check(add and del and add ~= del and add ~= normal.fg, name .. ": gitsigns colored")
  check(vim.api.nvim_get_hl(0, { name = "BlinkCmpKindFunction" }).fg ~= vim.api.nvim_get_hl(0, { name = "BlinkCmpKindVariable" }).fg, name .. ": kinds differ")
  check(vim.api.nvim_get_hl(0, { name = "MiniIconsRed" }).fg ~= nil, name .. ": mini.icons")
  check(vim.g.terminal_color_1 ~= nil, name .. ": terminal colors")
end

-- background switch follows for "essential"
vim.cmd.colorscheme("essential")
vim.o.background = "light"
local light_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
check(light_bg == tonumber(ex.colors("light").bg:sub(2), 16), "auto variant follows background=light")
vim.o.background = "dark"
check(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == tonumber(ex.colors("dark").bg:sub(2), 16), "auto variant follows background=dark")

-- cache written and setup invalidates key
local dir = vim.fn.stdpath("cache") .. "/essential"
check(#vim.fn.readdir(dir) >= 3, "cache files exist")
ex.setup({ transparent = true })
vim.cmd.colorscheme("essential-dark")
check(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == nil, "transparent applied after setup")
ex.setup({ on_highlights = function(hl) hl.Normal.fg = "#ff0000" end })
vim.cmd.colorscheme("essential-dark")
check(vim.api.nvim_get_hl(0, { name = "Normal" }).fg == 0xff0000, "on_highlights applied")

-- tones = false: every code role is plain fg
ex.setup({ tones = false })
vim.cmd.colorscheme("essential-dark")
local nfg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg
for _, g in ipairs({ "String", "Function", "Keyword", "Comment", "Number", "Operator" }) do
  check(vim.api.nvim_get_hl(0, { name = g, link = false }).fg == nfg, "tones=false: " .. g)
end

-- highlights never produce invalid specs
for _, v in ipairs({ "light", "dark" }) do
  for n, spec in pairs(ex.highlights(v)) do
    for _, k in ipairs({ "fg", "bg", "sp" }) do
      local x = spec[k]
      check(x == nil or x == "NONE" or (type(x) == "string" and x:match("^#%x%x%x%x%x%x$")), ("%s %s.%s=%s"):format(v, n, k, tostring(x)))
    end
  end
end

print(ok_all and "ALL OK" or "FAILURES")
if not ok_all then os.exit(1) end
