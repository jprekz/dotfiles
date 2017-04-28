" jprekz's vimrc

if !1 | finish | endif

if &compatible
  set nocompatible
endif
set shellslash

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
  if has('lua')
    call dein#add('Shougo/neocomplete')
  endif
  call dein#add('vim-syntastic/syntastic')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('itchyny/lightline.vim')
  " call dein#add('rust-lang/rust.vim')
  call dein#add('jlevesy/rust.vim') " cargo enabled version
  call dein#add('w0ng/vim-hybrid')
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
" neocomplete
if has('lua')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
endif
" Syntastic
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit=200
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


" plugin keymap
"---------------------------------------
" neocomplete
if has('lua')
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
  endfunction
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
endif
" Unite
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]u :<C-u>Unite file_mru buffer<CR>
" VimFiler
nnoremap [filer] <Nop>
nmap <Space>f [filer]
nnoremap <silent> [filer]f :<C-u>VimFiler -split -simple -winwidth=35 -no-quit<CR>
nnoremap <silent> [filer]t :<C-u>VimFilerTab<CR>


" general settings
"---------------------------------------
set background=dark
colorscheme hybrid
if has('win32')
  autocmd! vimrcEx
  set shell=powershell.exe
endif
if has('Unix')
  set mouse=a
  set guioptions+=a
  set ttymouse=xterm2
endif
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set backspace=indent,eol,start
set wrap
set nocursorline
set showtabline=2
set laststatus=2
set cmdheight=2
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
autocmd FileType vim setlocal shiftwidth=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType less setlocal shiftwidth=2



" general keymap
"---------------------------------------
" ZZ ZQ Q を封印
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q gq
" カーソル移動
noremap j gj
noremap k gk
noremap J <C-d>
noremap K <C-u>
noremap H ^
noremap L $
" タブ移動
noremap <C-tab> gt
noremap! <C-tab> gt
noremap <C-S-tab> gT
noremap! <C-S-tab> gT
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" Quick help
nnoremap <C-h> :<C-u>help<Space>
" F5でvimrcを開く
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>

