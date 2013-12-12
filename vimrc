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
" needed for dash.vim
Bundle 'rizzatti/funcoo.vim' 
Bundle 'rizzatti/dash.vim'
Bundle 'jgdavey/tslime.vim'

"Ruby & Rails Related
Bundle 'kana/vim-textobj-user.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-bundler'
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
	autocmd Bufread,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker
	au BufReadPost *.rkt,*.rktl setl filetype=scheme
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
set colorcolumn=79
set formatoptions+=1
set fo+=n
set fo+=q
set fo-=o
set fo-=r
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
set keywordprg=""

" Set some variables for some plugins
" Eliminates pandoc inline highlighting. Speeds things up quite a bit
" let g:pandoc_no_spans=1
" eRuby surrounds. - yss- for <% %>, yss= for <%= %>
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
" ctrlp plugin mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Airline statusbar settings
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='solarized'
let g:airline_section_z='%{rvm#statusline()} BUF #%n'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

" Some mappings
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap / /\v
nnoremap <Left> <C-PageUp>
nnoremap <Right> <C-PageDown>
nnoremap <Up> :tabnew<CR> 
nnoremap <Down> :tabc<CR> 
inoremap <Left> <C-PageUp>
inoremap <Right> <C-PageDown>
inoremap <Up> <Esc>:tabnew<CR> 
inoremap <Down> <Esc>:tabc<CR> 
vnoremap . :norm.<CR>

" Leader mappings
" Leader zz keeps cursor in the center of the screen
nnoremap <SPACE> <Nop>
let mapleader = "\<SPACE>"
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <silent> <leader>b :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>k4 :sp<CR>:vsp<CR><C-w>j:vsp<CR><C-w>k
nnoremap <silent> <leader>k6 :vsp<CR>:vsp<CR>:sp<CR><C-w>l:sp<CR><C-w>l:sp<CR><C-w>h<C-w>h
nnoremap <silent> <leader>k= mmgg=G`m<CR>
nnoremap <silent> <leader>kc :call Flipcolors()<CR>
nnoremap <silent> <leader>K <Plug>DashSearch
map <leader>kr :topleft 35 :split config/routes.rb<cr>zA
map <leader>kg :topleft 35 :split Gemfile<cr>
map <leader>kR :topleft 25 :split<cr>:enew<cr>:set buftype=nofile<cr>:read !rake routes<cr>
map <leader>kl :PromoteToLet<cr>
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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
highlight MatchParen cterm=bold gui=bold guifg=#FDF6E3 guibg=#D33682 ctermfg=015 ctermbg=005

" Spellbad settings
highlight clear SpellBad
highlight SpellBad guifg=#FFFFFF guibg=#FF0000 ctermfg=red cterm=underline

function! Flipcolors()
	if &background == "light"
		let &background = "dark"
	elseif &background == "dark"
		let &background = "light"
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET -- Stolen from Gary Bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
	:normal! dd
	" :exec '?^\s*it\>'
	:normal! P
	:.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
	:normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
