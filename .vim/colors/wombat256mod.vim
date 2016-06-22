set background=dark

let colors_name = "wombat256mod"


" General colors
hi Normal       ctermfg=252 ctermbg=235
hi Cursor       ctermfg=234 ctermbg=228
hi Visual       ctermfg=252 ctermbg=238
hi VisualNOS    ctermfg=252 ctermbg=238
hi Search       ctermfg=177 ctermbg=242
hi Folded       ctermfg=103 ctermbg=237
hi Title        ctermfg=230
hi StatusLine   ctermfg=230 ctermbg=238
hi VertSplit    ctermfg=238 ctermbg=238
hi StatusLineNC ctermfg=242 ctermbg=238
hi LineNr       ctermfg=242
hi SpecialKey   ctermfg=242 ctermbg=235
hi WarningMsg   ctermfg=203
hi ErrorMsg     ctermfg=196 ctermbg=236
hi TabLine      ctermfg=242 ctermbg=235
hi TabLineFill  ctermfg=242 ctermbg=235
hi TabLineSel   ctermfg=252 ctermbg=239
hi ColorColumn  ctermbg=241

" Vim >= 7.0 specific colors
if version >= 700
hi CursorLine             ctermbg=236
hi MatchParen ctermfg=228 ctermbg=101
hi Pmenu      ctermfg=230 ctermbg=238
hi PmenuSel   ctermfg=232 ctermbg=192
endif

" Diff highlighting
hi DiffAdd                ctermbg=17
hi DiffDelete ctermfg=234 ctermbg=60
hi DiffText               ctermbg=53
hi DiffChange             ctermbg=237

" Syntax highlighting
hi Keyword    ctermfg=111
hi Statement  ctermfg=111
hi Constant   ctermfg=173
hi Number     ctermfg=173
hi PreProc    ctermfg=173
hi Function   ctermfg=192
hi Identifier ctermfg=192
hi Type       ctermfg=186
hi Special    ctermfg=229
hi String     ctermfg=113
hi Comment    ctermfg=242
hi Todo       ctermfg=101

" Links
hi! link FoldColumn   Folded
hi! link CursorColumn CursorLine
hi! link NonText      LineNr
