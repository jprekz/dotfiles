" jprekz's vimrc

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved
  syntax enable
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'PProvost/vim-ps1'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'amdt/vim-niji'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-quickrun'
call neobundle#end()
" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" plugin settings
"--------------------
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
" auto-pairs
let g:AutoPairsFlyMode=1


" plugin keymap
"--------------------
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
" Quickrun
nnoremap <F7> :<C-u>QuickRun<CR>
nnoremap <S-F7> :<C-u>QuickRun<Space>
nnoremap <C-F7> :<C-u>QuickRun<Space>-args<Space>''<Left>
nnoremap <F8> :<C-u>QuickRun<Space>-runner<Space>shell<CR>
nnoremap <S-F8> :<C-u>QuickRun<Space>-runner<Space>shell<Space>
nnoremap <C-F8> :<C-u>QuickRun<Space>-runner<Space>shell<Space>-args<Space>''<Left>
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
"--------------------
if has('win32')
  set shell=powershell.exe
endif
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set incsearch
set hlsearch
set wrap
set showmatch
set whichwrap=h,l
set ignorecase
set smartcase
set hidden
set history=100
set autoindent
set noexpandtab
set cursorline
set scrolloff=5
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set clipboard=unnamed
autocmd! vimrcEx
set nobackup
set noswapfile
set noundofile


" general keymap
"--------------------
" ZZ ZQ Q を封印
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q gq
" カーソル移動
noremap J <C-d>
noremap K <C-u>
noremap H ^
noremap L &
" タブ移動
noremap <C-j> gT
noremap! <C-j> gT
noremap <C-k> gt
noremap! <C-k> gt
" Ctrl+SpaceでEsc
noremap <C-Space> <Esc>
noremap! <C-Space> <Esc>
" Enterで空行挿入
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>
" F5でvimrcを開く
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <C-h> :<C-u>help<Space>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

