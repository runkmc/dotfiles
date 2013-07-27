" forget vi compatibility
set nocompatible
" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" General Plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'runkmc/vim-airline'

"Ruby & Rails Related
Bundle 'kana/vim-textobj-user.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'

" Languages & Frameworks other than Ruby/Rails
Bundle 'dag/vim2hs'
Bundle 'davidoc/taskpaper.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'guns/vim-clojure-static'
Bundle 'jimenezrick/vimerl'
Bundle 'mattonrails/vim-mix'
Bundle 'tpope/vim-fireplace'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'xhr/vim-io'

" Unused plugins that I still want to keep track of
" Bundle 'Townk/vim-autoclose'

"General Setup
syntax on
filetype plugin indent on
runtime macros/matchit.vim
" Turn on omnicomplete, maybe?
if has("autocmd") && exists("+omnifunc")            
	autocmd Filetype *
				\   if &omnifunc == "" |
				\     setlocal omnifunc=syntaxcomplete#Complete |
				\   endif
	autocmd Filetype ruby setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab foldmethod=syntax
	autocmd Filetype pandoc setl spell undofile spelllang=en_us
	autocmd Filetype mail setl spell spelllang=en_us
	autocmd Filetype txt setl spell
	autocmd Filetype eruby setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab foldmethod=syntax
	au BufReadPost *.rkt,*.rktl set filetype=scheme
	autocmd bufwritepost .vimrc source $MYVIMRC
	autocmd bufwritepost vimrc source $MYVIMRC

	" these are here in case I ever want to install the autoclose plugin again.
	" autocmd FileType clojure let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "'")
	" autocmd FileType lisp let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "'")
	" autocmd FileType scheme let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "'")

	" Rainbow Parens stuff
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
endif

"General settings
set path=$PWD/**
set formatprg=par
"system clipboard works in terminal:
set clipboard=unnamed
set autoindent
set backspace=2 " Backspace like a normal person
set colorcolumn=85
set formatoptions+=qn1
set formatoptions-=ro
set nofoldenable
set laststatus=2
set hidden
set hlsearch
set incsearch
set lbr
set linebreak
set matchtime=2
set nolist
set noshowmode
set noswapfile
set number
set shiftround
set shiftwidth=4
set showmatch
set showmode
set tabstop=4
set textwidth=79
set wrap " Soft wrapping


" Set some variables for some plugins
" Eliminates pandoc inline highlighting. Speeds things up quite a bit
let g:pandoc_no_spans=1
" eRuby surrounds. - yss- for <% %>, yss= for <%= %>
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
" Disable angry paren matching in lisp/racket/clojure/scheme files
let g:paredit_electric_return=0
let g:paredit_mode=0
" Turn on folding in ruby files. I think.
" let ruby_fold=1
" Eliminates pandoc inline highlighting. Speeds things up quite a bit
let g:pandoc_no_spans=1
" eRuby surrounds. - yss- for <% %>, yss= for <%= %>
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
" Disable angry paren matching in lisp/racket/clojure/scheme files
let g:paredit_electric_return=0
let g:paredit_mode=0
" ctrlp plugin mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Some mappings
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap / /\v
nnoremap <Left> <C-PageUp>
nnoremap <Right> <C-PageDown>
nnoremap <Up> <Esc>:tabnew<CR> 
nnoremap <Down> <Esc>:tabc<CR> 
inoremap <Left> <C-PageUp>
inoremap <Right> <C-PageDown>
inoremap <Up> <Esc>:tabnew<CR> 
inoremap <Down> <Esc>:tabc<CR> 
vnoremap . :norm.<CR>

" Leader mappings
" Leader zz keeps cursor in the center of the screen
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <leader>u :GundoToggle<CR>
map <Leader>rr :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
nnoremap <silent> <leader>b :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>k4 :sp<CR>:vsp<CR><C-w>j:vsp<CR><C-w>k
nnoremap <silent> <leader>k6 :vsp<CR>:vsp<CR>:sp<CR><C-w>l:sp<CR><C-w>l:sp<CR><C-w>h<C-w>h
nnoremap <silent> <leader>ks :set spell!<CR>
nnoremap <silent> <leader>k= mmgg=G`m<CR>
nnoremap <silent> <leader>kc :call Flipcolors()<CR>
nnoremap <silent> <leader>kn :call Nutoggle()<CR>
map <leader>kr :topleft 35 :split config/routes.rb<cr>zA
map <leader>kg :topleft 35 :split Gemfile<cr>
map <leader>kR :topleft 25 :split<cr>:enew<cr>:set buftype=nofile<cr>:read !rake routes<cr>
map <leader>l :PromoteToLet<cr>

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=*.hg,*.git,*.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store 

" Colors
set background=light
colorscheme solarized
highlight StatusLine guifg=#FDF6E3 guibg=#073642 gui=bold ctermfg=15 ctermbg=10 cterm=bold
highlight StatusLineNC guifg=#586E75 guibg=#EEE8D5 gui=reverse,bold ctermfg=7 ctermbg=12 cterm=reverse,bold
"
" Airline statusbar settings
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='solarized'
let g:airline_section_z='%{rvm#statusline()} BUF #%n'

" Spellbad settings
highlight clear SpellBad
highlight SpellBad guifg=#FFFFFF guibg=#FF0000 ctermfg=red cterm=underline

" Some functions
function! Nutoggle()
	if &nu == 1
		set rnu
	elseif &rnu == 1
		set nu
	endif
endfunction

function! Flipcolors()
	if &background == "light"
		let &background = "dark"
	elseif &background == "dark"
		let &background = "light"
	endif
endfunction

" source $HOME/.dotfiles/vim/misc/statusline.vim

" Set some highlights independent of colorscheme
" hi pandocStrong term=standout ctermfg=028 
" hi pandocEmphasis term=standout ctermfg=056

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
	:normal! dd
	" :exec '?^\s*it\>'
	:normal! P
	:.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
	:normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight Word, courtesy of Steve Losh {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <leader>` :noh<cr>:call clearmatches()<cr>

function! HiInterestingWord(n) " {{{
	" Save our location.
	normal! mz

	" Yank the current word into the z register.
	normal! "zyiw

	" Calculate an arbitrary match ID.  Hopefully nothing else is using it.
	let mid = 86750 + a:n

	" Clear existing matches, but don't worry if they don't exist.
	silent! call matchdelete(mid)

	" Construct a literal pattern that has to match at boundaries.
	let pat = '\V\<' . escape(@z, '\') . '\>'

	" Actually match the words.
	call matchadd("InterestingWord" . a:n, pat, 1, mid)

	" Move back to our original location.
	normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

" }}}
