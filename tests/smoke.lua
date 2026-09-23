-- nvim --headless -u NONE --cmd "set rtp^=." -l tests/smoke.lua
local ok_all = true
local function check(cond, msg)
  if not cond then ok_all = false; print("FAIL: " .. msg) end
end

vim.env.XDG_CACHE_HOME = vim.fn.tempname()
local ex = require("exquisite")

for _, name in ipairs({ "exquisite-light", "exquisite-dark", "exquisite" }) do
  local ok, err = pcall(vim.cmd.colorscheme, name)
  check(ok, name .. ": " .. tostring(err))
  check(vim.g.colors_name == name, name .. ": colors_name=" .. tostring(vim.g.colors_name))
  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  check(normal.fg and normal.bg, name .. ": Normal has fg/bg")
  -- code is monochrome: every syntax group has fg == Normal.fg
  for _, g in ipairs({ "String", "Function", "Keyword", "@variable", "Type", "Number", "@function.call", "Comment" }) do
    local h = vim.api.nvim_get_hl(0, { name = g, link = false })
    check(h.fg == normal.fg, ("%s: %s fg %s ~= Normal %s"):format(name, g, tostring(h.fg), tostring(normal.fg)))
  end
  -- color where it matters
  local add = vim.api.nvim_get_hl(0, { name = "GitSignsAdd" }).fg
  local del = vim.api.nvim_get_hl(0, { name = "GitSignsDelete" }).fg
  check(add and del and add ~= del and add ~= normal.fg, name .. ": gitsigns colored")
  check(vim.api.nvim_get_hl(0, { name = "BlinkCmpKindFunction" }).fg ~= vim.api.nvim_get_hl(0, { name = "BlinkCmpKindVariable" }).fg, name .. ": kinds differ")
  check(vim.api.nvim_get_hl(0, { name = "MiniIconsRed" }).fg ~= nil, name .. ": mini.icons")
  check(vim.g.terminal_color_1 ~= nil, name .. ": terminal colors")
end

-- background switch follows for "exquisite"
vim.cmd.colorscheme("exquisite")
vim.o.background = "light"
local light_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
check(light_bg == tonumber(ex.colors("light").bg:sub(2), 16), "auto variant follows background=light")
vim.o.background = "dark"
check(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == tonumber(ex.colors("dark").bg:sub(2), 16), "auto variant follows background=dark")

-- cache written and setup invalidates key
local dir = vim.fn.stdpath("cache") .. "/exquisite"
check(#vim.fn.readdir(dir) >= 3, "cache files exist")
ex.setup({ transparent = true })
vim.cmd.colorscheme("exquisite-dark")
check(vim.api.nvim_get_hl(0, { name = "Normal" }).bg == nil, "transparent applied after setup")
ex.setup({ on_highlights = function(hl) hl.Normal.fg = "#ff0000" end })
vim.cmd.colorscheme("exquisite-dark")
check(vim.api.nvim_get_hl(0, { name = "Normal" }).fg == 0xff0000, "on_highlights applied")

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
