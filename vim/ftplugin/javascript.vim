:setl makeprg=node\ % 
:setl errorformat=%Z%p^,%A%f:%l,%C%m 
:nnoremap <buffer> K :execute '!open https://developer.mozilla.org/en-US/search?topic=js\&q=' . expand("<cword>")<CR>
nnoremap <Leader>r :w<CR>:silent !clear<CR>:execute "!node " . expand("%:p")<CR>

