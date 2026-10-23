-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  return {
    Foo                         = { bg = c.azure, fg = c.fg },

    Comment                     = { fg = c.comment, style = opts.styles.comments }, -- any comment
    ColorColumn                 = { bg = c.bg }, -- used for the columns set with 'colorcolumn'
    Conceal                     = { fg = c.muted }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor                      = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor                     = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM                    = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn                = { bg = c.surface1 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine                  = { bg = c.surface1 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory                   = { fg = c.blue }, -- directory names (and other special names in listings)
    DiffAdd                     = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange                  = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete                  = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText                    = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer                 = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg                    = { fg = c.diag.error }, -- error messages on the command line
    VertSplit                   = { fg = c.border }, -- the column separating vertically split windows
    WinSeparator                = { fg = c.border, bold = true }, -- the column separating vertically split windows
    Folded                      = { fg = c.blue, bg = c.muted }, -- line used for closed folds
    FoldColumn                  = { bg = opts.transparent and c.none or c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn                  = { bg = opts.transparent and c.none or c.bg, fg = c.muted }, -- column where |signs| are displayed
    SignColumnSB                = { bg = c.bg_float, fg = c.muted }, -- column where |signs| are displayed
    Substitute                  = { bg = c.orange, fg = c.bg }, -- |:substitute| replacement text highlighting
    LineNr                      = { fg = c.muted }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr                = { fg = c.orange, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    LineNrAbove                 = { fg = c.muted },
    LineNrBelow                 = { fg = c.muted },
    MatchParen                  = { fg = c.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg                     = { fg = c.comment, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea                     = { fg = c.comment }, -- Area for messages and cmdline
    MoreMsg                     = { fg = c.blue }, -- |more-prompt|
    NonText                     = { fg = c.muted }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal                      = { fg = c.fg, bg = opts.transparent and c.none or c.bg }, -- normal text
    NormalNC                    = { fg = c.fg, bg = opts.transparent and c.none or opts.dim_inactive and c.surface1 or c.bg }, -- normal text in non-current windows
    NormalSB                    = { fg = c.fg, bg = c.bg_float }, -- normal text in sidebar
    NormalFloat                 = { fg = c.fg, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder                 = { fg = c.border, bg = c.bg_float },
    FloatTitle                  = { fg = c.border, bg = c.bg_float },
    Pmenu                       = { bg = c.bg_float, fg = c.fg }, -- Popup menu: normal item.
    PmenuMatch                  = { bg = c.bg_float, fg = c.yellow }, -- Popup menu: Matched text in normal item.
    PmenuSel                    = { bg = Util.blend_bg(c.muted, 0.8) }, -- Popup menu: selected item.
    PmenuMatchSel               = { bg = Util.blend_bg(c.muted, 0.8), fg = c.yellow }, -- Popup menu: Matched text in selected item.
    PmenuSbar                   = { bg = Util.blend_fg(c.bg_float, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb                  = { bg = c.muted }, -- Popup menu: Thumb of the scrollbar.
    Question                    = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine                = { bg = c.select, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search                      = { bg = c.search, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch                   = { bg = c.orange, fg = c.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch                   =  "IncSearch",
    SpecialKey                  = { fg = c.muted }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad                    = { sp = c.diag.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap                    = { sp = c.diag.warn, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal                  = { sp = c.diag.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare                   = { sp = c.diag.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine                  = { fg = c.fg, bg = c.surface2 }, -- status line of current window
    StatusLineNC                = { fg = c.muted, bg = c.surface2 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine                     = { bg = c.surface2, fg = c.muted }, -- tab pages line, not active tab page label
    TabLineFill                 = { bg = opts.transparent and c.none or c.bg }, -- tab pages line, where there are no labels
    TabLineSel                  = { fg = c.bg, bg = c.blue }, -- tab pages line, active tab page label
    Title                       = { fg = c.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual                      = { bg = c.select }, -- Visual mode selection
    VisualNOS                   = { bg = c.select }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg                  = { fg = c.diag.warn }, -- warning messages
    Whitespace                  = { fg = c.muted }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu                    = { bg = c.select }, -- current match in 'wildmenu' completion
    WinBar                      = "StatusLine" , -- window bar
    WinBarNC                    = "StatusLineNC", -- window bar in inactive windows

    Bold                        = { bold = true, fg = c.fg }, -- (preferred) any bold text
    Character                   = { fg = c.green }, --  a character constant: 'c', '\n'
    Constant                    = { fg = c.orange }, -- (preferred) any constant
    Debug                       = { fg = c.orange }, --    debugging statements
    Delimiter                   =  "Special", --  character that needs attention
    Error                       = { fg = c.diag.error }, -- (preferred) any erroneous construct
    Function                    = { fg = c.blue, style = opts.styles.functions }, -- function name (also: methods for classes)
    Identifier                  = { fg = c.azure, style = opts.styles.variables }, -- (preferred) any variable name
    Italic                      = { italic = true, fg = c.fg }, -- (preferred) any italic text
    Keyword                     = { fg = c.cyan, style = opts.styles.keywords }, --  any other keyword
    Operator                    = { fg = c.fg }, -- "sizeof", "+", "*", etc.
    PreProc                     = { fg = c.cyan }, -- (preferred) generic Preprocessor
    Special                     = { fg = c.yellow }, -- (preferred) any special symbol
    Statement                   = { fg = c.azure }, -- (preferred) any statement
    String                      = { fg = c.green }, --   a string constant: "this is a string"
    Todo                        = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Type                        = { fg = c.yellow }, -- (preferred) int, long, char, etc.
    Underlined                  = { underline = true }, -- (preferred) text that stands out, HTML links
    debugBreakpoint             = { bg = Util.blend_bg(c.diag.info, 0.1), fg = c.diag.info }, -- used for breakpoint colors in terminal-debug
    debugPC                     = { bg = c.bg_float }, -- used for highlighting the current line in terminal-debug
    dosIniLabel                 = "@property",
    helpCommand                 = { bg = c.surface1, fg = c.blue },
    htmlH1                      = { fg = c.azure, bold = true },
    htmlH2                      = { fg = c.blue, bold = true },
    qfFileName                  = { fg = c.blue },
    qfLineNr                    = { fg = c.muted },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own.
    LspReferenceText            = { bg = c.muted }, -- used for highlighting "text" references
    LspReferenceRead            = { bg = c.muted }, -- used for highlighting "read" references
    LspReferenceWrite           = { bg = c.muted }, -- used for highlighting "write" references
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.select, 0.4), bold = true },
    LspCodeLens                 = { fg = c.comment },
    LspInlayHint                = { bg = Util.blend_bg(c.surface3, 0.1), fg = c.muted },
    LspInfoBorder               = { fg = c.border, bg = c.bg_float },
    ComplHint                   = { fg = c.surface1 },

    -- diagnostics
    DiagnosticError             = { fg = c.diag.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn              = { fg = c.diag.warn }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo              = { fg = c.diag.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint              = { fg = c.diag.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary       = { fg = c.surface1 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextError  = { bg = Util.blend_bg(c.diag.error, 0.1), fg = c.diag.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn   = { bg = Util.blend_bg(c.diag.warn, 0.1), fg = c.diag.warn }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo   = { bg = Util.blend_bg(c.diag.info, 0.1), fg = c.diag.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint   = { bg = Util.blend_bg(c.diag.hint, 0.1), fg = c.diag.hint }, -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError    = { undercurl = true, sp = c.diag.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn     = { undercurl = true, sp = c.diag.warn }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo     = { undercurl = true, sp = c.diag.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint     = { undercurl = true, sp = c.diag.hint }, -- Used to underline "Hint" diagnostics

    -- Health
    healthError                 = { fg = c.diag.error },
    healthSuccess               = { fg = c.green },
    healthWarning               = { fg = c.diag.warn },

    -- diff (not needed anymore?)
    diffAdded                   = { bg = c.diff.add, fg = c.git.add },
    diffRemoved                 = { bg = c.diff.delete, fg = c.git.delete },
    diffChanged                 = { bg = c.diff.change, fg = c.git.change },
    diffOldFile                 = { fg = c.yellow, bg=c.diff.delete },
    diffNewFile                 = { fg = c.yellow, bg=c.diff.add },
    diffFile                    = { fg = c.blue },
    diffLine                    = { fg = c.comment },
    diffIndexLine               = { fg = c.azure },
    helpExample                 = { fg = c.comment },
  }
end

return M
