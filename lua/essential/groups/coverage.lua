-- Adapt TokyoNight's highlight coverage to Essential's palette and configuration.
local M = {}
local modules = require("essential.groups.support_modules")

local aliases = { ["grug-far"] = "grug_far" }
local function enabled(name, opts)
  local key = aliases[name] or name
  if name:match("^mini_") and opts.integrations.mini == false then return false end
  return opts.integrations[key] ~= false
end

function M.get(c, o)
  local util = require("essential.util")
  local colors = vim.deepcopy(c)
  local solid = o.float.solid
  if solid == nil then solid = c.variant == "dark" end
  colors.bg_float = o.transparent and c.none or (solid and c.surface_float or c.bg_float)
  colors.rainbow = { c.blue, c.yellow, c.green, c.orange, c.blue, c.yellow }
  colors.diff = {
    add = util.blend(c.git.add, c.bg, 0.16),
    change = util.blend(c.git.change, c.bg, 0.12),
    delete = util.blend(c.git.delete, c.bg, 0.14),
    text = util.blend(c.git.change, c.bg, 0.30),
  }
  local opts = vim.deepcopy(o)
  opts.style = c.variant == "light" and "day" or "night"
  opts.styles.sidebars = o.transparent and "transparent" or "normal"
  local hl = {}
  for _, name in ipairs(modules) do
    if name == "base" or name == "kinds" or enabled(name, o) then
      for group, spec in pairs(require("essential.groups.support." .. name).get(colors, opts)) do
        if type(spec) == "string" then spec = { link = spec } end
        if spec.style then
          spec = vim.tbl_extend("force", spec, spec.style)
          spec.style = nil
        end
        hl[group] = spec
      end
    end
  end
  hl.Foo = nil -- upstream demonstration group, not an editor/plugin highlight
  -- Kind colors are shared with Essential's existing completion and breadcrumb UI.
  for kind, key in pairs(require("essential.kinds")) do
    hl["LspKind" .. kind] = { fg = c[key] }
  end
  return hl
end

-- Language-specific captures inherit Essential's existing syntax, rather than
-- introducing upstream's alternate colors (e.g. JSX tags or Markdown headings).
function M.preserve_syntax(hl, own)
  for name in pairs(hl) do
    if name:sub(1, 1) == "@" and not own[name] and not name:match("^@lsp%.") then
      local parent = name:match("^(.*)%.[^.]+$")
      while parent do
        if own[parent] then
          hl[name] = { link = parent }
          break
        end
        parent = parent:match("^(.*)%.[^.]+$")
      end
    end
  end
  for _, name in ipairs({ "interface", "builtinType" }) do
    if hl["@lsp.type." .. name] then hl["@lsp.type." .. name] = { link = "@type" } end
  end
  for _, name in ipairs({ "type", "typeAlias" }) do
    if hl["@lsp.typemod." .. name .. ".defaultLibrary"] then
      hl["@lsp.typemod." .. name .. ".defaultLibrary"] = { link = "@type.builtin" }
    end
  end
end

return M
