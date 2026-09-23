--- Treesitter captures. Most captures fall back to the legacy groups through
--- Neovim's default links, so we only set what the default colorscheme hard-codes
--- plus the captures where style or meaning matters.

---@param c exquisite.Colors
---@param o exquisite.Config
return function(c, o)
  local s = o.styles
  local fg = c.fg

  ---@param style exquisite.Style
  local function with(style)
    return vim.tbl_extend("force", { fg = fg }, style)
  end

  local function marker(color)
    return { fg = c.bg, bg = color, bold = true }
  end

  return {
    ["@variable"] = with(s.variables),
    ["@variable.builtin"] = with(s.keywords),
    ["@variable.parameter"] = with(s.variables),
    ["@variable.member"] = with(s.variables),

    ["@constant"] = with(s.constants),
    ["@constant.builtin"] = with(s.constants),
    ["@module"] = { fg = fg },
    ["@module.builtin"] = { fg = fg },
    ["@label"] = with(s.keywords),

    ["@string"] = with(s.strings),
    ["@string.documentation"] = vim.tbl_extend("force", { fg = o.muted_comments and c.muted or fg }, s.comments),
    ["@string.regexp"] = with(s.strings),
    ["@string.escape"] = { fg = fg, bold = true },
    ["@string.special.url"] = { fg = fg, underline = true },
    ["@character.special"] = { fg = fg, bold = true },

    ["@type"] = with(s.types),
    ["@type.builtin"] = with(s.types),
    ["@attribute"] = { fg = fg },
    ["@property"] = with(s.variables),

    ["@function"] = with(s.functions),
    ["@function.builtin"] = with(s.functions),
    ["@function.call"] = with(s.functions),
    ["@function.method"] = with(s.functions),
    ["@function.method.call"] = with(s.functions),
    ["@constructor"] = with(s.types),
    ["@operator"] = with(s.operators),

    ["@keyword"] = with(s.keywords),
    ["@keyword.function"] = with(s.keywords),
    ["@keyword.return"] = with(s.keywords),
    ["@keyword.operator"] = with(s.keywords),

    ["@punctuation"] = { fg = fg },
    ["@punctuation.special"] = { fg = fg },
    ["@tag"] = { fg = fg },
    ["@tag.builtin"] = { fg = fg },
    ["@tag.attribute"] = { fg = fg, italic = true },
    ["@tag.delimiter"] = { fg = fg },

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
    ["@markup.heading"] = { fg = fg, bold = true },
    ["@markup.heading.1.delimiter.vimdoc"] = { fg = c.muted },
    ["@markup.heading.2.delimiter.vimdoc"] = { fg = c.muted },
    ["@markup.quote"] = { fg = fg, italic = true },
    ["@markup.math"] = { fg = fg },
    ["@markup.link"] = { fg = fg },
    ["@markup.link.label"] = { fg = fg, bold = true },
    ["@markup.link.url"] = { fg = fg, underline = true },
    ["@markup.raw"] = { fg = fg, bg = c.surface1 },
    ["@markup.raw.block"] = { fg = fg },
    ["@markup.list"] = { fg = fg, bold = true },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.muted },

    ["@diff.plus"] = { fg = c.git.add },
    ["@diff.minus"] = { fg = c.git.delete },
    ["@diff.delta"] = { fg = c.git.change },
  }
end
