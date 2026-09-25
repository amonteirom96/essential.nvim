--- Groups for a hand-written statusline (`%#StModeNormal#`, `%#StGit#`, ...).
--- Colors come from the palette, so git and diagnostics match gitsigns and
--- the diagnostic signs without any `on_highlights`.
--- Each mode gets a filled block plus a `Sep` group for the powerline edge.

---@param c essential.Colors
---@param o essential.Config
return function(c, o)
  local bg = c.surface2
  local hl = {
    StProject = { fg = c.accent, bg = bg },
    StGit = { fg = c.git.add, bg = bg },
    StGitAdd = { fg = c.git.add, bg = bg },
    StGitChange = { fg = c.git.change, bg = bg },
    StGitDelete = { fg = c.git.delete, bg = bg },
    StError = { fg = c.diag.error, bg = bg },
    StWarn = { fg = c.diag.warn, bg = bg },
    StInfo = { fg = c.diag.info, bg = bg },
    StHint = { fg = c.diag.hint, bg = bg },
    StLsp = { fg = c.accent, bg = bg },
  }

  local modes = {
    Normal = c.blue,
    Insert = c.green,
    Visual = c.red,
    Replace = c.orange,
    Command = c.purple,
    Other = c.cyan,
  }
  for mode, color in pairs(modes) do
    hl["StMode" .. mode] = { fg = c.bg, bg = color, bold = true }
    hl["StMode" .. mode .. "Sep"] = { fg = color, bg = bg }
  end

  return hl
end
