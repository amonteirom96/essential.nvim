--- Code is monochrome: every token uses `fg`. Structure comes from style
--- (italic/bold, configurable via `styles`), never from hue.
--- The only colored tokens are the ones that carry out-of-band meaning:
--- TODO/FIXME/NOTE markers, diff lines and errors.

---@param c exquisite.Colors
---@param o exquisite.Config
return function(c, o)
  local s = o.styles
  local fg = c.fg
  local comment = vim.tbl_extend("force", { fg = o.muted_comments and c.muted or fg }, s.comments)

  ---@param style exquisite.Style
  local function with(style)
    return vim.tbl_extend("force", { fg = fg }, style)
  end

  local keyword = with(s.keywords)
  local func = with(s.functions)
  local variable = with(s.variables)
  local str = with(s.strings)
  local typ = with(s.types)
  local const = with(s.constants)
  local op = with(s.operators)

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

    Special = { fg = fg },
    SpecialChar = { fg = fg, bold = true },
    Tag = { fg = fg },
    Delimiter = { fg = fg },
    Debug = { fg = fg },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = c.muted },
    Error = { fg = c.red, bold = true },
    Todo = { fg = c.bg, bg = c.accent, bold = true },
  }
end
