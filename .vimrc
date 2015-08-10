call pathogen#infect() 
filetype off
syntax on
filetype plugin indent on

imap jj <Esc>
map <cr> o<Esc>
noremap <silent> <F11> :cal VimCommanderToggle()<CR>

set pastetoggle=<F2>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
nmap <F3> <ESC>:noh<cr>
vmap <F3> <ESC>:noh<cr>
imap <F3> <ESC><ESC>:noh<cr>


filetype plugin indent on
set ofu=syntaxcomplete#Complete

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set et

set ai
set cin

set autoindent
set smartindent

set showmatch
set hlsearch
set incsearch
set ignorecase
set number

au BufEnter *.coffee set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufEnter *.rb set expandtab tabstop=2 shiftwidth=2 softtabstop=2
au BufEnter *.js set expandtab tabstop=2 shiftwidth=2 softtabstop=2

"autocmd VimEnter * NERDTree " NEDRTree autostart
set t_Co=256
colorscheme xoria256

set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]


set nocompatible
filetype on
filetype plugin on

" Toggle autoclose
nmap <F4> <Plug>ToggleAutoCloseMappings
vmap <F4> <ESC><Plug>ToggleAutoCloseMappings
imap <F4> <ESC><ESC><Plug>ToggleAutoCloseMappings


" Buffer explorer on <F5>
nmap <F5> <ESC>:ls<cr>
vmap <F5> <ESC>:ls<cr>
imap <F5> <ESC><ESC>:ls<cr>

" Prev buf on <F6>
nmap <F6> <ESC>:bp!<cr>
imap <F6> <ESC>:bp!<cr>

" Next buf on <F7>
nmap <F7> <ESC>:bn!<cr>
imap <F7> <ESC>:bn!<cr>

" Delete buffer
nmap <F10> <ESC>:bd<cr>
vmap <F10> <ESC>:bd<cr>
imap <F10> <ESC><ESC>:bd<cr>

let mapleader = ","

" Python settings
let g:pep8_map = '<leader>8'

" yank limit
set viminfo='100,<1000,s10,h,

" tslime
vmap <leader>t <Plug>SendSelectionToTmux
nmap <leader>t <Plug>NormalModeSendToTmux

" trim spaces functions
function ShowSpaces(...)
    let @/='\v(\s+$)|( +\ze\t)'
    let oldhlsearch=&hlsearch
    if !a:0
        let &hlsearch=!&hlsearch
    else
        let &hlsearch=a:1
    endif
    return oldhlsearch
endfunction

function TrimSpaces() range
    let oldhlsearch=ShowSpaces(1)
    execute a:firstline.",".a:lastline."substitute ///gec"
    let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12> :ShowSpaces 1<CR>
nnoremap <S-F12> m`:TrimSpaces<CR>``
vnoremap <S-F12> :TrimSpaces<CR>

" go
let g:neocomplete#enable_at_startup = 1

let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'm:methods',
        \ 'f:functions'
    \ ],
    \ 'sro': '.',
    \ 'kind2scope': {
        \ 't': 'ctype',
        \ 'n': 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin': 'gotags',
    \ 'ctagsargs': '-sort -silent'
\}

nmap <f8> :TagbarToggle<cr>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

au filetype go nmap <leader>r <plug>(go-run)
au filetype go nmap <leader>b <plug>(go-build)
au filetype go nmap <leader>t <plug>(go-test)
au filetype go nmap <leader>c <plug>(go-coverage)
au filetype go nmap <leader>dv <plug>(go-def-vertical)

" Neosnippets
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
