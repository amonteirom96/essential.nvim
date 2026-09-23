local M = {}

---@alias essential.Variant "light"|"dark"
---@alias essential.Style vim.api.keyset.highlight

---@class essential.Config
---@field variant? "auto"|essential.Variant  "auto" follows 'background'
---@field transparent? boolean                  no background on Normal/floats/sign column
---@field terminal_colors? boolean              set g:terminal_color_0..15
---@field dim_inactive? boolean                 slightly different bg on unfocused windows
---@field muted_comments? boolean               comments in the muted UI tone instead of fg
---@field float? { solid?: boolean }            solid = filled floats without visible border
---@field styles? table<"comments"|"keywords"|"functions"|"variables"|"strings"|"types"|"constants"|"operators", essential.Style>
---@field integrations? table<string, boolean>
---@field cache? boolean                        compile highlights to bytecode (recommended)
---@field on_colors? fun(colors: essential.Colors, variant: essential.Variant)
---@field on_highlights? fun(hl: table<string, essential.Style>, colors: essential.Colors, variant: essential.Variant)
M.defaults = {
  variant = "auto",
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  muted_comments = false,
  float = { solid = false },
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = {},
    variables = {},
    strings = {},
    types = {},
    constants = {},
    operators = {},
  },
  integrations = {
    blink = true,
    dropbar = true,
    gitsigns = true,
    grug_far = true,
    lazy = true,
    mason = true,
    mini = true, -- icons, pick, extra, files, tabline
    semantic_tokens = true,
    treesitter = true,
  },
  cache = true,
  on_colors = nil,
  on_highlights = nil,
}

---@type essential.Config
M.options = vim.deepcopy(M.defaults)

---@param opts? essential.Config
function M.set(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
end

--- Deterministic serialization (sorted keys, functions as bytecode digest)
--- used to key the compiled cache. Changing any option invalidates it.
---@param v any
---@return string
local function serialize(v)
  local t = type(v)
  if t == "table" then
    local keys = vim.tbl_keys(v)
    table.sort(keys, function(a, b)
      return tostring(a) < tostring(b)
    end)
    local out = {}
    for i, k in ipairs(keys) do
      out[i] = tostring(k) .. "=" .. serialize(v[k])
    end
    return "{" .. table.concat(out, ",") .. "}"
  elseif t == "function" then
    local ok, dump = pcall(string.dump, v)
    return ok and vim.fn.sha256(dump) or tostring(v)
  end
  return tostring(v)
end

---@return string
function M.hash()
  return vim.fn.sha256(require("essential").version .. serialize(M.options)):sub(1, 16)
end

return M
