--- Code is one hue: every token is a tone of `fg` (see `c.code`). Roles differ
--- by strength (keywords and functions stronger, strings and constants softer,
--- punctuation and comments quieter) and by style (italic/bold, via `styles`).
--- The only colored tokens are the ones that carry out-of-band meaning:
--- TODO/FIXME/NOTE markers, diff lines and errors.

---@param c essential.Colors
---@param o essential.Config
return function(c, o)
  local s = o.styles
  local k = c.code

  ---@param fg string
  ---@param style essential.Style
  local function with(fg, style)
    return vim.tbl_extend("force", { fg = fg }, style)
  end

  local comment = with(k.comment, s.comments)
  local keyword = with(k.keyword, s.keywords)
  local func = with(k.func, s.functions)
  local variable = with(k.variable, s.variables)
  local str = with(k.string, s.strings)
  local typ = with(k.type, s.types)
  local const = with(k.constant, s.constants)
  local op = with(k.punctuation, s.operators)

  return {
    Comment = comment,
    SpecialComment = comment,

    Constant = const,
    String = str,
    Character = str,
    Number = const,
    Boolean = const,
    Float = const,

    Identifier = variable,
    Function = func,

    Statement = keyword,
    Conditional = keyword,
    Repeat = keyword,
    Label = keyword,
    Keyword = keyword,
    Exception = keyword,
    Operator = op,

    PreProc = keyword,
    Include = keyword,
    Define = keyword,
    Macro = keyword,
    PreCondit = keyword,

    Type = typ,
    StorageClass = keyword,
    Structure = typ,
    Typedef = typ,

    Special = { fg = c.fg },
    SpecialChar = { fg = k.string, bold = true },
    Tag = { fg = k.keyword },
    Delimiter = { fg = k.punctuation },
    Debug = { fg = c.fg },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = c.muted },
    Error = { fg = c.red, bold = true },
    Todo = { fg = c.bg, bg = c.accent, bold = true },
  }
end
