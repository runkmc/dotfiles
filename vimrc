
set nocompatible
" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'godlygeek/tabular'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'jgdavey/tslime.vim'
Plugin 'edkolev/tmuxline.vim'

"Ruby & Rails Related
Plugin 'kana/vim-textobj-user.git'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-bundler'
" Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'

"Front end web plugins
" Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'

" Languages & Frameworks other than Ruby/Rails
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'Keithbsmiley/swift.vim'
Bundle 'jimenezrick/vimerl'
Bundle 'mattonrails/vim-mix'
" Bundle 'vim-pandoc/vim-pandoc'
" Bundle 'kovisoft/slimv'
Bundle 'dag/vim2hs'
" Bundle 'davidoc/taskpaper.vim'
Plugin 'elixir-lang/vim-elixir'
" Bundle 'xhr/vim-io'
" Bundle 'kovisoft/paredit'
" Plugin 'scrooloose/syntastic'
" Plugin 'mattn/gist-vim'
" Plugin 'mattn/webapi-vim'
call vundle#end()

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
	autocmd Filetype css setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab foldmethod=syntax
	autocmd Filetype scss setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab foldmethod=syntax
	autocmd Filetype haskell setl softtabstop=4 expandtab
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
set autoindent
set backspace=2 " Backspace like a normal person
set clipboard=unnamed
set colorcolumn=79
set fo+=n
set fo+=q
set fo-=o
set fo-=r
set formatoptions+=1
set hidden
set hlsearch
set incsearch
set keywordprg=""
set laststatus=2
set lbr
set linebreak
set matchtime=2
set nofoldenable
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
let g:Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:airline_left_sep=' '
let g:airline_right_sep=' '
" let g:airline_section_z='BUF #%n'
let g:airline_theme='solarized'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
let g:rspec_command = "Dispatch rspec {spec}"
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 1

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
" in order to enable lmaps...
set iminsert=1
set imsearch=-1
cnoremap <C-l> ◊
lnoremap <C-l> ◊

" Leader mappings
" Leader zz keeps cursor in the center of the screen
nnoremap <SPACE> <Nop>
let mapleader = "\<SPACE>"
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <silent> <leader>K <Plug>DashSearch
nnoremap <silent> <leader>k= mmgg=G`m<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>n :call RunNearestSpec()<CR>

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=*.DS_Store 

" Colors
set background=dark
colorscheme solarized
highlight StatusLineNC guifg=#586E75 guibg=#EEE8D5 gui=reverse,bold ctermfg=7 ctermbg=12 cterm=reverse,bold
highlight MatchParen cterm=bold gui=bold guifg=#FDF6E3 guibg=#D33682 ctermfg=015 ctermbg=005

" Spellbad settings
highlight clear SpellBad
highlight SpellBad guifg=#FFFFFF guibg=#FF0000 ctermfg=red cterm=underline
