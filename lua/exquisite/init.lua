---@class exquisite
local M = {}

--- Bump to invalidate every user's compiled cache after changing highlights.
M.version = "1.0.0"

local cache_dir = vim.fn.stdpath("cache") .. "/exquisite"
local configured = false
local key ---@type string?

---@param opts? exquisite.Config
function M.setup(opts)
  require("exquisite.config").set(opts)
  configured = true
  key = nil
end

---@return exquisite.Config
local function options()
  return require("exquisite.config").options
end

---@return string
local function cache_key()
  if not key then
    key = configured and require("exquisite.config").hash() or ("default-" .. M.version)
  end
  return key
end

---@param name string
---@return exquisite.Variant
local function resolve_variant(name)
  if name == "exquisite-light" then
    return "light"
  elseif name == "exquisite-dark" then
    return "dark"
  end
  local v = options().variant
  if v == "light" or v == "dark" then
    return v
  end
  return vim.o.background == "light" and "light" or "dark"
end

--- Full palette (base + derived) for a variant, after `on_colors`.
---@param variant? exquisite.Variant defaults to the current 'background'
---@return exquisite.Colors
function M.colors(variant)
  return require("exquisite.palette").get(variant or resolve_variant("exquisite"), options())
end

--- Final highlight table for a variant, after `on_highlights`.
---@param variant? exquisite.Variant
---@return table<string, exquisite.Style>
function M.highlights(variant)
  local o = options()
  return require("exquisite.groups").get(M.colors(variant), o)
end

---@param name string
---@param variant exquisite.Variant
---@return string
local function build(name, variant)
  local o = options()
  local c = require("exquisite.palette").get(variant, o)
  local hl = require("exquisite.groups").get(c, o)
  local term = o.terminal_colors and require("exquisite.terminal").ansi(c) or nil
  return require("exquisite.compiler").source(name, variant, hl, term)
end

---@param prefix string
---@param keep string
local function prune(prefix, keep)
  for file in vim.fs.dir(cache_dir) do
    if vim.startswith(file, prefix) and file ~= keep then
      os.remove(cache_dir .. "/" .. file)
    end
  end
end

--- Entry point used by `colors/*.lua`.
---@param name? "exquisite"|"exquisite-light"|"exquisite-dark"
function M.load(name)
  name = name or "exquisite"
  local variant = resolve_variant(name)

  if not options().cache then
    return assert(load(build(name, variant), "=exquisite"))()
  end

  local prefix = name .. "_" .. variant .. "_"
  local file = prefix .. cache_key()
  local path = cache_dir .. "/" .. file
  local fn = loadfile(path)
  if not fn then
    fn = require("exquisite.compiler").write(build(name, variant), path)
    prune(prefix, file)
  end
  fn()
end

--- Rebuild the cache for the active colorscheme (e.g. after editing an
--- `on_highlights` closure whose upvalues changed).
function M.compile()
  M.clear_cache()
  local name = vim.g.colors_name
  if name and vim.startswith(name, "exquisite") then
    vim.cmd.colorscheme(name)
  end
end

function M.clear_cache()
  vim.fn.delete(cache_dir, "rf")
  key = nil
end

--- Generate terminal/tool themes (ghostty, kitty, lazygit) from the palette.
---@param dir? string output directory, defaults to `<plugin>/extras`
function M.extras(dir)
  return require("exquisite.extras").generate(dir)
end

return M
