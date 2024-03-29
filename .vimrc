" jprekz's vimrc

if !1 | finish | endif

if &compatible
  set nocompatible
endif
" set shellslash

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  let &runtimepath = s:dein_repo_dir .",". &runtimepath
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add('Shougo/dein.vim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('itchyny/lightline.vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('racer-rust/vim-racer')
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable



" plugin settings
"---------------------------------------
" Syntastic
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_python_python_exe = 'python3'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" lightline
let g:lightline = {
\  'colorscheme': 'wombat',
\  'active': {
\    'right': [ [ 'syntastic', 'lineinfo' ],
\               [ 'percent' ],
\               [ 'fileformat', 'fileencoding', 'filetype' ] ]
\  },
\  'component_expand': {
\    'syntastic': 'SyntasticStatuslineFlag',
\  },
\  'component_type': {
\    'syntastic': 'error',
\  }
\}
" vim-racer
let g:racer_experimental_completer=1



" plugin keymap
"---------------------------------------
" vim-racer
autocmd FileType rust nmap gd        <Plug>(rust-def)
autocmd FileType rust nmap <Space>gd <Plug>(rust-doc)



" general settings
"---------------------------------------
set background=dark
if has('Unix')
  set mouse=a
  set guioptions+=a
  set ttymouse=xterm2
endif
set number
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set backspace=indent,eol,start
set wrap
set cursorline
set showtabline=2
set laststatus=2
set cmdheight=1
set scrolloff=5
set incsearch
set hlsearch
set showmatch
set whichwrap=h,l
set ignorecase
set smartcase
set hidden
set splitright
set history=100
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set clipboard=unnamed
set nobackup
set noswapfile
set noundofile
set completeopt=menuone
autocmd FileType vim setlocal shiftwidth=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType less setlocal shiftwidth=2
" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:newrw_sizestyle = "h"



" general keymap
"---------------------------------------
" ZZ ZQ Q を封印
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q gq
" カーソル移動
noremap j gj
noremap k gk
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" F5でvimrcを開く
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>



" others
" --------------------------------------
" https://gist.github.com/juanpabloaj/5845848
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  let l = 1
  let n_lines = 0
  let w_width = winwidth(0)
  while l <= line('$')
    " number to float for division
    let l_len = strlen(getline(l)) + 0.0
    let line_width = l_len/w_width
    let n_lines += float2nr(ceil(line_width))
    let l += 1
  endw
  exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
