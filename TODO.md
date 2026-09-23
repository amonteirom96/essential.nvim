# exquisite-color.nvim — TODO

> Monocromático no código. Cor apenas onde ela carrega informação.

## Filosofia
- [ ] Código: **uma única cor** de texto (sem tons de cinza). Diferenciação só por estilo (itálico/negrito), configurável.
- [ ] Cor apenas onde carrega significado: git (add verde / change azul / delete vermelho), diagnósticos, kinds do LSP, ícones do mini.icons, busca, TODO/FIXME.
- [ ] Cores funcionais suaves, com contraste validado (WCAG) em ambos os fundos — nada que force a vista.

## Paleta
- [ ] Light: fundo branco puxado para amarelo claro (papel), texto cinza quase preto.
- [ ] Dark: fundo cinza, texto branco puxado para cinza.
- [ ] Acentos: red, orange, yellow, green, cyan, azure, blue, purple (+ UI derivada por blend).
- [ ] Script de validação de contraste (`scripts/contrast.lua`).

## Core (performance extrema)
- [ ] `colors/exquisite.lua` (segue `background`), `exquisite-light.lua`, `exquisite-dark.lua`.
- [ ] Compilação para bytecode (`string.dump`) em cache, chaveado por hash da config + versão.
- [ ] Cores emitidas como inteiros (sem parsing de string hex no `nvim_set_hl`).
- [ ] Zero `require` de plugins, zero autocmds no caminho quente.
- [ ] `:ExquisiteCompile` / `:ExquisiteClearCache`.
- [ ] Troca automática light/dark via `background` (Neovim 0.10+ detecta o terminal por OSC 11).

## Grupos do Neovim 0.12
- [ ] Editor/UI: Normal, NormalFloat, FloatBorder/Title/Footer, CursorLine, Visual, Search/CurSearch/IncSearch, Pmenu*, StatusLine, TabLine, WinBar, WinSeparator, Folded, MsgArea, OkMsg/StderrMsg/StdoutMsg, SnippetTabstop…
- [ ] Sintaxe legada (Comment, String, Function…) — todos monocromáticos.
- [ ] Treesitter (`@variable`, `@markup.*`, `@diff.*`, `@comment.todo/note/warning/error`…).
- [ ] LSP semantic tokens, LspReference*, LspInlayHint, LspCodeLens.
- [ ] Diagnostics (sign, virtual text, virtual lines, underline, floating, DiagnosticUnnecessary/Deprecated).
- [ ] Diff + Added/Changed/Removed, DiffTextAdd.
- [ ] Terminal colors (`g:terminal_color_0..15`).

## Integrações (plugins dos dotfiles)
- [ ] blink.cmp (menu, doc, signature, ghost text, **kinds coloridos**)
- [ ] mini.icons (cores corretas dos ícones)
- [ ] mini.pick / mini.extra
- [ ] mini.files
- [ ] mini.tabline
- [ ] gitsigns (sign, number, line, inline, preview, blame)
- [ ] dropbar (kinds coloridos, menu, preview)
- [ ] grug-far
- [ ] mason
- [ ] lazy.nvim
- [ ] nvim-treesitter
- [ ] Statusline dos dotfiles (`StMode*`, `St*`) via `on_highlights` documentado.

## Extras (gerados da mesma paleta)
- [ ] Gerador `lua/exquisite/extras/init.lua` (`:ExquisiteExtras` / headless).
- [ ] Ghostty (light/dark)
- [ ] Kitty (light/dark + `*.auto.conf`)
- [ ] Lazygit (light/dark)

## Configuração
- [ ] `variant`, `transparent`, `terminal_colors`, `dim_inactive`, `styles`, `float`, `ui`
- [ ] `on_colors(colors, variant)`, `on_highlights(hl, colors, variant)`
- [ ] `integrations` liga/desliga por plugin
- [ ] API pública: `require("exquisite").colors(variant)`

## Documentação
- [ ] README profissional (instalação, config, API, extras, filosofia)
- [ ] Banner SVG (`assets/banner.svg`)
- [ ] `doc/exquisite.txt` (`:h exquisite`)
- [ ] LICENSE (MIT)

## Qualidade
- [ ] Teste headless: carrega as 3 variantes, sem erros, cache funcionando.
- [ ] Benchmark de carregamento (cold vs cache).
