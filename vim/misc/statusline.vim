" NeatStatus (c) 2012 Lukasz Grzegorz Maciak
" Neat and simple status line - because Powerline is overrated
"    _   _            _   ____  _        _             
"   | \ | | ___  __ _| |_/ ___|| |_ __ _| |_ _   _ ___ 
"   |  \| |/ _ \/ _` | __\___ \| __/ _` | __| | | / __|
"   | |\  |  __/ (_| | |_ ___) | || (_| | |_| |_| \__ \
"   |_| \_|\___|\__,_|\__|____/ \__\__,_|\__|\__,_|___/
"   Vim plugin by Luke Maciak (c) 2012
"
" Loosely based on a script by Tomas Restrepo (winterdom.com)
" " Original available here:
" http://winterdom.com/2007/06/vimstatusline

set ls=2 " Always show status line
let g:last_mode=""

" Color Scheme Settings
" You can redefine these in your .vimrc

if !exists('g:NeatStatusLine_color_normal')
    let g:NeatStatusLine_color_normal    = 'guifg=#FDF6E3 guibg=#DC322F gui=bold ctermfg=15 ctermbg=1 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_insert')
    let g:NeatStatusLine_color_insert    = 'guifg=#FDF6E3 guibg=#859900 gui=bold ctermfg=15 ctermbg=2 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_replace')
    let g:NeatStatusLine_color_replace='guifg=#FDF6E3 guibg=#B58900 gui=bold ctermfg=15 ctermbg=3 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_visual')
    let g:NeatStatusLine_color_visual='guifg=#FDF6E3 guibg=#268BD2 gui=bold ctermfg=15 ctermbg=4 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_position')
    let g:NeatStatusLine_color_position='guifg=#FDF6E3 guibg=#D33682 gui=bold ctermfg=15 ctermbg=5 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_modified')
    let g:NeatStatusLine_color_modified='guifg=#FDF6E3 guibg=#2AA198 gui=bold ctermfg=15 ctermbg=6 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_line')
    let g:NeatStatusLine_color_line='guifg=#FDF6E3 guibg=#CB4B16 gui=bold ctermfg=15 ctermbg=9 cterm=bold'
endif

if !exists('g:NeatStatusLine_color_filetype')
    let g:NeatStatusLine_color_filetype='guifg=#FDF6E3 guibg=#6C71C4 gui=bold ctermfg=15 ctermbg=13 cterm=bold'
endif

if !exists('g:NeatStatusLine_separator')
    let g:NeatStatusLine_separator = '|'
endif

let g:NeatStatusLine_color_red='guifg=#FDF6E3 guibg=#DC322F gui=bold ctermfg=15 ctermbg=1 cterm=bold'


"==============================================================================
"==============================================================================

" Set up the colors for the status bar
function! SetNeatstatusColorscheme()

    " Basic color presets
    exec 'hi User1 '.g:NeatStatusLine_color_insert
    exec 'hi User2 '.g:NeatStatusLine_color_insert
    exec 'hi User3 '.g:NeatStatusLine_color_replace
    exec 'hi User4 '.g:NeatStatusLine_color_visual
    exec 'hi User5 '.g:NeatStatusLine_color_position
    exec 'hi User6 '.g:NeatStatusLine_color_modified
    exec 'hi User7 '.g:NeatStatusLine_color_line
    exec 'hi User8 '.g:NeatStatusLine_color_filetype
	exec 'hi User9 '.g:NeatStatusLine_color_red

endfunc

" pretty mode display - converts the one letter status notifiers to words
function! Mode()
    let l:mode = mode()
    
    if     mode ==# "n"  | return "NORMAL"
    elseif mode ==# "i"  | return "INSERT"
    elseif mode ==# "R"  | return "REPLACE"
    elseif mode ==# "v"  | return "VISUAL"
    elseif mode ==# "V"  | return "V-LINE"
    elseif mode ==# "" | return "V-BLOCK"
    else                 | return l:mode
    endif

endfunc    

" Change the values for User1 color preset depending on mode
function! ModeChanged(mode)

    if     a:mode ==# "n"   | exec 'hi User1 '.g:NeatStatusLine_color_insert
    elseif a:mode ==# "i"   | exec 'hi User1 '.g:NeatStatusLine_color_visual
    elseif a:mode ==# "r"   | exec 'hi User1 '.g:NeatStatusLine_color_normal

    " FIXME: Visual mode color changes currently do not work.
    "elseif a:mode ==# "v"  | exec 'hi User1 '.g:NeatStatusLine_color_visual
    "elseif a:mode ==# "V"  | exec 'hi User1 '.g:NeatStatusLine_color_visual
    "elseif a:mode ==# "" | exec 'hi User1 '.g:NeatStatusLine_color_visual

    else                    | exec 'hi User1 '.g:NeatStatusLine_color_line
    endif

    " Sometimes in console the status line starts repeating so we redraw
    " there is probably a better way to fix this
    if !has('gui_running')
        redraw!
    endif

    return ''
endfunc

"==============================================================================
"==============================================================================

if has('statusline')

    " set up color scheme now
    call SetNeatstatusColorscheme()

    " Status line detail:
    " -------------------
    "
    " %f    file name
    " %F    file path
    " %y    file type between braces (if defined)
    "
    " %{v:servername}   server/session name (gvim only)
    "
    " %<    collapse to the left if window is to small
    "
    " %( %) display contents only if not empty
    "
    " %1*   use color preset User1 from this point on (use %0* to reset)
    "
    " %([%R%M]%)   read-only, modified and modifiable flags between braces
    "
    " %{'!'[&ff=='default_file_format']}
    "        shows a '!' if the file format is not the platform default
    "
    " %{'$'[!&list]}  shows a '*' if in list mode
    " %{'~'[&pm=='']} shows a '~' if in patchmode
    "
    " %=     right-align following items
    "
    " %{&fileencoding}  displays encoding (like utf8)
    " %{&fileformat}    displays file format (unix, dos, etc..)
    " %{&filetype}      displays file type (vim, python, etc..)
    "
    " #%n   buffer number
    " %l/%L line number, total number of lines
    " %p%   percentage of file
    " %c%V  column number, absolute column number
    " &modified         whether or not file was modified
    "
    function! SetStatusLineStyle()

        let &stl=""
        " mode (changes color)
        let &stl.="%1*\ %{Mode()} %0*" 
        " session name
        let &stl.="%6*  %{fugitive#statusline()}  %0*"
        " file path
        let &stl.=" %<%F "
        " read only, modified, modifiable flags in brackets
        let &stl.="%9*%([%R%M]%)%0*"

        " right-aligh everything past this point
        let &stl.="%= "

        " readonly flag
        let &stl.="%(%{(&ro!=0?'(readonly)':'')} %)"

        " file type (eg. python, ruby, etc..)
        let &stl.="%3*%( %{&filetype} %)%0*"
        " file format (eg. unix, dos, etc..)
        let &stl.="%7* %{&fileformat} %0*"
        " file encoding (eg. utf8, latin1, etc..)
        let &stl.="%9* %(%{(&fenc!=''?&fenc:&enc)} %)"
        " buffer number
        let &stl.="%8* BUF #%n %0*" 
        " modified / unmodified (purple)
        let &stl.="%(%6* %{&modified ? 'modified':''} %)"

    endfunc

    au InsertEnter  * call ModeChanged(v:insertmode)
    au InsertChange * call ModeChanged(v:insertmode)
    au InsertLeave  * call ModeChanged(mode())

    " whenever the color scheme changes re-apply the colors
    au ColorScheme * call SetNeatstatusColorscheme()

    " Make sure the statusbar is reloaded late to pick up servername
    au ColorScheme,VimEnter * call SetStatusLineStyle()

    " Switch between the normal and vim-debug modes in the status line
    nmap _ds :call SetStatusLineStyle()<CR>
    call SetStatusLineStyle()
    " Window title
    if has('title')
        set titlestring="%t%(\ [%R%M]%)".expand(v:servername)
    endif
endif
