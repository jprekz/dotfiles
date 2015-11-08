" jprekz's vimrc

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

let $VIMBUNDLE = '~/.vim/bundle'
let $NEOBUNDLEPATH = $VIMBUNDLE . '/neobundle.vim'

if has('vim_starting')
  set nocompatible               " Be iMproved
  syntax enable
  " why not working
  " if isdirectory($VIMBUNDLE)
    set runtimepath+=$NEOBUNDLEPATH
  " endif
endif

if stridx(&runtimepath, $NEOBUNDLEPATH) != -1
  " Required:
  call neobundle#begin(expand('~/.vim/bundle/'))
  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/neocomplete'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimfiler.vim'
  NeoBundle 'amdt/vim-niji'
  NeoBundle 'crusoexia/vim-monokai'
  NeoBundle 'itchyny/lightline.vim'
  NeoBundle 'thinca/vim-fontzoom'
  NeoBundle 'w0ng/vim-hybrid'
  call neobundle#end()
  " Required:
  filetype plugin indent on
  NeoBundleCheck
else
  echomsg 'Caution: No NeoBundle'
endif

" plugin settings
"---------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit=200
" lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\}


" plugin keymap
"---------------------------------------
" neocomplete
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
if has('win32')
  autocmd! vimrcEx
  set shell=powershell.exe
endif
if has('Unix')
  set mouse=a
  set guioptions+=a
  set ttymouse=xterm2
  color hybrid
endif
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set wrap
set cursorline
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
set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set clipboard=unnamed
set nobackup
set noswapfile
set noundofile
autocmd FileType html setlocal expandtab shiftwidth=2
autocmd FileType less setlocal expandtab shiftwidth=2
autocmd FileType scheme setlocal expandtab


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
" Ctrl+SpaceでEsc(端末だと効かない)
noremap <C-Space> <Esc>
noremap! <C-Space> <Esc>
" Enterで空行挿入
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>
" F5でvimrcを開く
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
" Quick help
nnoremap <C-h> :<C-u>help<Space>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
