:setlocal makeprg=ghc\ %
:nnoremap <buffer> <Leader>r :w<CR>:silent !clear<CR>:execute "!ghc " . expand("%:p")<CR>
:nnoremap <buffer> K :execute '!open https://www.haskell.org/hoogle/?hoogle=' . expand("<cword>")<CR>
:setlocal errorformat=
                \%-G,
                \%-Z\ %#,
                \%W%f:%l:%c:\ Warning:\ %m,
                \%E%f:%l:%c:\ %m,
                \%E%>%f:%l:%c:,
                \%+C\ \ %#%m,
                \%W%>%f:%l:%c:,
                \%+C\ \ %#%tarning:\ %m,

