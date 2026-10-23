-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/glepnir/lspsaga.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    DefinitionCount            = { fg = c.azure },
    DefinitionIcon             = { fg = c.blue },
    DiagnosticInformation      = "DiagnosticInfo",
    DiagnosticWarning          = "DiagnosticWarn",
    LspFloatWinBorder          = { fg = c.border },
    LspFloatWinNormal          = { bg = c.bg_float },
    LspSagaBorderTitle         = { fg = c.cyan },
    LspSagaCodeActionBorder    = { fg = c.blue },
    LspSagaCodeActionContent   = { fg = c.azure },
    LspSagaCodeActionTitle     = { fg = c.yellow },
    LspSagaDefPreviewBorder    = { fg = c.green },
    LspSagaFinderSelection     = { fg = c.select },
    LspSagaHoverBorder         = { fg = c.blue },
    LspSagaRenameBorder        = { fg = c.green },
    LspSagaSignatureHelpBorder = { fg = c.orange },
    ReferencesCount            = { fg = c.azure },
    ReferencesIcon             = { fg = c.blue },
    TargetWord                 = { fg = c.cyan },
  }
end

return M
