# essential.nvim — TODO

> Monocromático no código. Cor apenas onde ela carrega informação.

## Filosofia
- [x] Código: **uma única cor** de texto (sem tons de cinza). Diferenciação só por estilo (itálico/negrito), configurável.
- [x] Cor apenas onde carrega significado: git (add verde / change azul / delete vermelho), diagnósticos, kinds do LSP, ícones do mini.icons, busca, TODO/FIXME.
- [x] Cores funcionais suaves, com contraste validado (WCAG) em ambos os fundos — nada que force a vista.

## Paleta
- [x] Light: fundo branco puxado para amarelo claro (papel), texto cinza quase preto.
- [x] Dark: fundo cinza, texto branco puxado para cinza.
- [x] Acentos: red, orange, yellow, green, cyan, azure, blue, purple (+ UI derivada por blend).
- [x] Script de validação de contraste (`scripts/contrast.lua`).

## Core (performance extrema)
- [x] `colors/essential.lua` (segue `background`), `essential-light.lua`, `essential-dark.lua`.
- [x] Compilação para bytecode (`string.dump`) em cache, chaveado por hash da config + versão.
- [x] Cores emitidas como inteiros (sem parsing de string hex no `nvim_set_hl`).
- [x] Zero `require` de plugins, zero autocmds no caminho quente.
- [x] `:EssentialCompile` / `:EssentialClearCache`.
- [x] Troca automática light/dark via `background` (Neovim 0.10+ detecta o terminal por OSC 11).

## Grupos do Neovim 0.12
- [x] Editor/UI: Normal, NormalFloat, FloatBorder/Title/Footer, CursorLine, Visual, Search/CurSearch/IncSearch, Pmenu*, StatusLine, TabLine, WinBar, WinSeparator, Folded, MsgArea, OkMsg/StderrMsg/StdoutMsg, SnippetTabstop…
- [x] Sintaxe legada (Comment, String, Function…) — todos monocromáticos.
- [x] Treesitter (`@variable`, `@markup.*`, `@diff.*`, `@comment.todo/note/warning/error`…).
- [x] LSP semantic tokens, LspReference*, LspInlayHint, LspCodeLens.
- [x] Diagnostics (sign, virtual text, virtual lines, underline, floating, DiagnosticUnnecessary/Deprecated).
- [x] Diff + Added/Changed/Removed, DiffTextAdd.
- [x] Terminal colors (`g:terminal_color_0..15`).

## Integrações (plugins dos dotfiles)
- [x] blink.cmp (menu, doc, signature, ghost text, **kinds coloridos**)
- [x] mini.icons (cores corretas dos ícones)
- [x] mini.pick / mini.extra
- [x] mini.files
- [x] mini.tabline
- [x] gitsigns (sign, number, line, inline, preview, blame)
- [x] dropbar (kinds coloridos, menu, preview)
- [x] grug-far
- [x] mason
- [x] lazy.nvim
- [x] nvim-treesitter
- [x] Statusline dos dotfiles (`StMode*`, `St*`) via `on_highlights` documentado.

## Extras (gerados da mesma paleta)
- [x] Gerador `lua/essential/extras/init.lua` (`:EssentialExtras` / headless).
- [x] Ghostty (light/dark)
- [x] Kitty (light/dark + `*.auto.conf`)
- [x] Lazygit (light/dark)

## Configuração
- [x] `variant`, `transparent`, `terminal_colors`, `dim_inactive`, `styles`, `float`, `ui`
- [x] `on_colors(colors, variant)`, `on_highlights(hl, colors, variant)`
- [x] `integrations` liga/desliga por plugin
- [x] API pública: `require("essential").colors(variant)`

## Documentação
- [x] README profissional (instalação, config, API, extras, filosofia)
- [x] Banner SVG (`assets/banner.svg`)
- [x] `doc/essential.txt` (`:h essential`)
- [x] LICENSE (MIT)

## Qualidade
- [x] Teste headless: carrega as 3 variantes, sem erros, cache funcionando.
- [x] Benchmark de carregamento (cold vs cache).
