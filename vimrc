set nocompatible
set shell=/bin/bash
call plug#begin('~/.vim/plugged')
" Vim appearance
" Plugin 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'morhetz/gruvbox'

" Vim behavior
" Plugin 'scrooloose/syntastic'
" Plugin 'mattn/gist-vim'
" Plugin 'mattn/webapi-vim'
Plug 'gmarik/Vundle.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
" Plugin 'jgdavey/tslime.vim'
Plug 'kien/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'janko-m/vim-test'

"Ruby & Rails Related
" Plugin 'kana/vim-textobj-user.git'
" Plugin 'nelstrom/vim-textobj-rubyblock'
" Plugin 'thoughtbot/vim-rspec'
" Plugin 'tpope/vim-bundler'
" Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-rake'
" Plugin 'tpope/vim-rvm'
" Plugin 'vim-ruby/vim-ruby'

"Front end web plugins
" Plugin 'tpope/vim-haml'
" Plugin 'mattn/emmet-vim'

" Language related plugins
" Plugin 'tpope/vim-fireplace'
" Bundle 'xhr/vim-io'
" Bundle 'kovisoft/paredit'
" Bundle 'vim-pandoc/vim-pandoc'
" Bundle 'kovisoft/slimv'
Plug 'guns/vim-clojure-static'
Plug 'Keithbsmiley/swift.vim'
Plug 'jimenezrick/vimerl'
Plug 'mattonrails/vim-mix'
Plug 'dag/vim2hs'
Plug 'elixir-lang/vim-elixir'
Plug 'ElmCast/elm-vim'

" Swift Autocompletion related plugins
" Plugin 'mitsuse/autocomplete-swift'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'

call plug#end()

"General Setup
syntax on
runtime macros/matchit.vim
filetype plugin indent on
" Turn on omnicomplete, maybe?
if has("autocmd") && exists("+omnifunc")            
	autocmd Filetype *
				\   if &omnifunc == "" |
				\     setlocal omnifunc=syntaxcomplete#Complete |
				\   endif
	autocmd Filetype sml setl makeprg=mlton\ % errorformat=%EError:\ %f\ %l.%v.,%C\ \ %m,%WWarning:\ %f\ %l.%v.,%C\ \ %m
	autocmd Filetype ruby setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab foldmethod=syntax
	autocmd Filetype css setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab foldmethod=indent
	autocmd Filetype scss setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab foldmethod=indent
	autocmd Filetype haskell setl softtabstop=2 expandtab tabstop=2 shiftwidth=2 compiler gcc
	autocmd Filetype pandoc setl spell undofile spelllang=en_us
	autocmd Filetype mail setl spell spelllang=en_us
	autocmd Filetype markdown setl spell
	autocmd Filetype elixir compiler exunit
	autocmd Filetype racket setl makeprg=racket\ %
	autocmd Filetype txt setl spell
	autocmd Filetype swift setl makeprg=swift\ % errorformat=%f:%l:%c:\ error:\ %m
	autocmd Filetype eruby setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab foldmethod=syntax
	autocmd Bufread,BufNewFile *.css,*.scss,*.less setlocal foldmethod=indent
	autocmd bufwritepost .vimrc source $MYVIMRC
	autocmd bufwritepost vimrc source $MYVIMRC

	" Rainbow Parens stuff
	" au VimEnter * RainbowParenthesesToggle
	" au Syntax * RainbowParenthesesLoadRound
	" au Syntax * RainbowParenthesesLoadSquare
	" au Syntax * RainbowParenthesesLoadBraces
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
set grepprg=ag\ --nogroup\ --nocolor

" Set some variables for some plugins
let g:Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let g:airline_left_sep=' '
let g:airline_right_sep=' '
" let g:airline_section_z='BUF #%n'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = 'ag %s -l -nocolor -g ""'
let g:ctrlp_use_caching = 0
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
" cnoremap <C-l> ◊
" lnoremap <C-l> ◊

" Leader mappings
nnoremap <SPACE> <Nop>
let mapleader = "\<SPACE>"

nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <silent> <leader>k= mmgg=G`m<CR>
nnoremap <leader>K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>d :w<CR>:Dispatch<CR>
map <Leader>g :Gst<CR>
let test#strategy = "dispatch"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=*.DS_Store 

" Colors
"
" let base16colorspace=256
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='hard'
let g:airline_theme='gruvbox'
" highlight StatusLineNC guifg=#586E75 guibg=#EEE8D5 gui=reverse,bold ctermfg=7 ctermbg=12 cterm=reverse,bold
" highlight MatchParen cterm=bold gui=bold guifg=#FDF6E3 guibg=#D33682 ctermfg=015 ctermbg=005
highlight Comment cterm=italic gui=italic
highlight String cterm=italic gui=italic
" highlight Type cterm=italic gui=italic

" Spellbad settings
highlight clear SpellBad
highlight SpellBad guifg=#FFFFFF guibg=#FF0000 ctermfg=red cterm=underline
