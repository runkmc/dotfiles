
" forget vi compatibility
set nocompatible
" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" General Plugins
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'SirVer/ultisnips'
Bundle 'gmarik/vundle'
Bundle 'tomtom/tlib_vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'altercation/vim-colors-solarized'

"Ruby & Rails Related
Bundle 'vim-ruby/vim-ruby'
Bundle 'kana/vim-textobj-user.git'
Bundle 'thoughtbot/vim-rspec'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-cucumber'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails'

" Languages & Frameworks other than Ruby/Rails
Bundle 'guns/vim-clojure-static'
Bundle 'davidoc/taskpaper.vim'
Bundle 'mattonrails/vim-mix'
Bundle 'elixir-lang/vim-elixir'
Bundle 'jimenezrick/vimerl'
Bundle 'xhr/vim-io'
Bundle 'tpope/vim-fireplace'
Bundle 'vim-pandoc/vim-pandoc'

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

" Put all the things in the path
set path=$PWD/**

"powerline
" python from powerline.bindings.vim import source_plugin; source_plugin()
" source /Users/Kevin/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
set noshowmode

" set some options
" Tabs and formatter
set formatprg=par
set tabstop=4
set shiftwidth=4
" Backspace like a normal person
set backspace=2

" Turn on folding in ruby files. I think.
let ruby_fold=1

" Eliminates pandoc inline highlighting. Speeds things up quite a bit
let g:pandoc_no_spans=1

" eRuby surrounds. - yss- for <% %>, yss= for <%= %>
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

" Disable angry paren matching in lisp/racket/clojure/scheme files
let g:paredit_electric_return=0
let g:paredit_mode=0

"add these subdirs to the path, always. It's just easier this way. Don't judge
"me

set showmatch
set matchtime=2
set noswapfile
set showmode
set autoindent
set number
set hidden
" Soft wrapping
set wrap
set nolist
set linebreak
set textwidth=79
set formatoptions=1
set lbr
set formatoptions=qrn1
set colorcolumn=85


" Set some variables for some plugins
" Turn on folding in ruby files. I think.
let ruby_fold=1
" Eliminates pandoc inline highlighting. Speeds things up quite a bit
let g:pandoc_no_spans=1
" eRuby surrounds. - yss- for <% %>, yss= for <%= %>
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
" Disable angry paren matching in lisp/racket/clojure/scheme files
let g:paredit_electric_return=0
let g:paredit_mode=0


" Some mappings
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap / /\v
nnoremap <leader>u :GundoToggle<CR>
nnoremap <S-Tab> <C-W>w
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap <Left> <C-PageUp>
nnoremap <Right> <C-PageDown>
nnoremap <Up> <Esc>:tabnew<CR> 
nnoremap <Down> <Esc>:tabc<CR> 
inoremap <Left> <C-PageUp>
inoremap <Right> <C-PageDown>
inoremap <Up> <Esc>:tabnew<CR> 
inoremap <Down> <Esc>:tabc<CR> 
nnoremap <leader>b :bp<bar>sp<bar>bn<bar>bd<CR>
" Leader zz keeps cursor in the center of the screen
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

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

set incsearch
set hlsearch

"system clipboard works in terminal:
set clipboard=unnamed

" Colors
if has('gui_running')
    set background=dark
else
    set background=light
endif

colorscheme solarized

" Spellbad settings
highlight clear SpellBad
highlight SpellBad guifg=#FFFFFF guibg=#FF0000 ctermfg=red cterm=underline

" first, enable status line always
set laststatus=2
" set statusline=%<%f\   " Filename
" set statusline+=%w%h%m%r " Options
" set statusline+=%{fugitive#statusline()} "  Git
" set statusline+=\ [%{&ff}/%Y]            " filetype
"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
" set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
" Set some highlights independent of colorscheme
" hi pandocStrong term=standout ctermfg=028 
" hi pandocEmphasis term=standout ctermfg=056

" Highlight Word, courtesy of Steve Losh {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

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
