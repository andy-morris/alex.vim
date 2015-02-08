"
" Syntax file for the Alex lexer generator
" <http://haskell.org/alex>
"

set isk+='

syn include @Haskell syntax/haskell.vim
unlet b:current_syntax
syn region alexHsSnippet matchgroup=alexDelim start="{" end="}" contains=@Haskell,alexHsBraces,alexHsMComment,alexHsPragma
" this is needed because {} aren't a region in haskell.vim so alexHsSnippet
" ends on the first } it sees
syn region alexHsPragma start="{-#" end="#-}" contained
syn region alexHsMComment start="{-\ze[^#]" end="-}" contained
syn region alexHsBraces matchgroup=alexDelim start="{\ze[^-]" end="}" contained contains=@Haskell,alexHsBraces
syn match alexDelim ";"
syn region alexString start=+"+ skip=+\\"+ end=+"+ contains=alexStrQuoteEscape
syn match alexStrQuoteEscape +\\"\|\\\\+ contained
syn match alexEscape "\\\(x\x\+\|o\o\+\|\d\+\|.\)"
syn match alexDecimal "\d\+"
syn match alexComment "--.*"

syn match alexWrapper "%wrapper"
syn match alexSmac "\$\a\k*"
syn match alexRmac "@\a\k*"

syn match alexColonDash "\(\a\k*\_s*\)\?:-"

" ^, /, or $ outside of an smac
syn match alexContext "[\^/]\|\$\ze\A"

syn region alexStartCode start="<" end=">" contains=alexSCZero,alexSCDigitErr nextgroup=alexSCBraced skipwhite skipempty
syn match alexSCZero "0" contained
syn match alexSCDigitErr "[1-9]" contained
syn region alexSCBraced matchgroup=alexSCBraces start="{" end="}" contains=TOP contained

syn match alexREMod "\V|\|*\|+\|?"
syn match alexRERange "{\s*\d\+\s*,\s*\d\+\s*}" contains=alexDecimal

syn match alexDelim "[[\]]"
syn match alexSetOp "[#.~]"
" this gubbins matches a '-' without another next to it
" just matching "-" also matches the ones used in comments
syn match alexSetOp "-\@<!--\@!"

" bleh
syn sync fromstart

hi def link alexComment         Comment
hi def link alexDelim           Delimiter
hi def link alexHsMComment      hsComment
hi def link alexHsPragma        hsPragma
hi def link alexString          String
hi def link alexEscape          Special
hi def link alexDecimal         Number
hi def link alexStrQuoteEscape  Special
hi def link alexWrapper         PreProc
hi def link alexSmac            Identifier
hi def link alexRmac            alexSmac
hi def link alexColonDash       Structure
hi def link alexContext         Keyword
hi def link alexStartCode       Keyword
hi def link alexSCZero          Number
hi def link alexSCDigitErr      Error
hi def link alexSCBraces        Delimiter
hi def link alexREMod           Keyword
hi def link alexRERange         Keyword
hi def link alexSetOp           Keyword

let b:current_syntax = "alex"
