--- Treesitter captures. Most captures fall back to the legacy groups through
--- Neovim's default links, so we only set what the default colorscheme hard-codes
--- plus the captures where style or meaning matters.

---@param c essential.Colors
---@param o essential.Config
return function(c, o)
  local s = o.styles
  local k = c.code
  local fg = c.fg

  ---@param color string
  ---@param style essential.Style
  local function with(color, style)
    return vim.tbl_extend("force", { fg = color }, style)
  end

  local function marker(color)
    return { fg = c.bg, bg = color, bold = true }
  end

  return {
    ["@variable"] = with(k.variable, s.variables),
    ["@variable.builtin"] = with(k.keyword, s.keywords),
    ["@variable.parameter"] = with(k.variable, s.variables),
    ["@variable.member"] = with(k.variable, s.variables),

    ["@constant"] = with(k.constant, s.constants),
    ["@constant.builtin"] = with(k.constant, s.constants),
    ["@module"] = { fg = fg },
    ["@module.builtin"] = { fg = fg },
    ["@label"] = with(k.keyword, s.keywords),

    ["@string"] = with(k.string, s.strings),
    ["@string.documentation"] = with(k.comment, s.comments),
    ["@string.regexp"] = with(k.string, s.strings),
    ["@string.escape"] = { fg = k.string, bold = true },
    ["@string.special.url"] = { fg = k.string, underline = true },
    ["@character.special"] = { fg = k.string, bold = true },

    ["@type"] = with(k.type, s.types),
    ["@type.builtin"] = with(k.type, s.types),
    ["@attribute"] = { fg = fg },
    ["@property"] = with(k.variable, s.variables),

    ["@function"] = with(k.func, s.functions),
    ["@function.builtin"] = with(k.func, s.functions),
    ["@function.call"] = with(k.func, s.functions),
    ["@function.method"] = with(k.func, s.functions),
    ["@function.method.call"] = with(k.func, s.functions),
    ["@constructor"] = with(k.type, s.types),
    ["@operator"] = with(k.punctuation, s.operators),

    ["@keyword"] = with(k.keyword, s.keywords),
    ["@keyword.function"] = with(k.keyword, s.keywords),
    ["@keyword.return"] = with(k.keyword, s.keywords),
    ["@keyword.operator"] = with(k.keyword, s.keywords),

    ["@punctuation"] = { fg = k.punctuation },
    ["@punctuation.special"] = { fg = k.punctuation },
    ["@tag"] = { fg = k.keyword },
    ["@tag.builtin"] = { fg = k.keyword },
    ["@tag.attribute"] = { fg = fg, italic = true },
    ["@tag.delimiter"] = { fg = k.punctuation },

    -- Comment markers: the one place code gets color.
    ["@comment.error"] = marker(c.red),
    ["@comment.warning"] = marker(c.yellow),
    ["@comment.todo"] = marker(c.accent),
    ["@comment.note"] = marker(c.cyan),

    -- Markup
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = k.keyword, bold = true },
    ["@markup.heading.1.delimiter.vimdoc"] = { fg = c.muted },
    ["@markup.heading.2.delimiter.vimdoc"] = { fg = c.muted },
    ["@markup.quote"] = { fg = k.comment, italic = true },
    ["@markup.math"] = { fg = fg },
    ["@markup.link"] = { fg = fg },
    ["@markup.link.label"] = { fg = fg, bold = true },
    ["@markup.link.url"] = { fg = k.string, underline = true },
    ["@markup.raw"] = { fg = k.string, bg = c.surface1 },
    ["@markup.raw.block"] = { fg = k.string },
    ["@markup.list"] = { fg = fg, bold = true },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.muted },

    ["@diff.plus"] = { fg = c.git.add },
    ["@diff.minus"] = { fg = c.git.delete },
    ["@diff.delta"] = { fg = c.git.change },
  }
end
