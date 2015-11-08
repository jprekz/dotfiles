" jprekz's gvimrc

" カラー設定
colorscheme monokai
" フォント設定
if has('win32')
  " Windows用
  set encoding=utf-8
  set guifont=Consolas:h13
  set guifontwide="IPAゴシック":h13
  set rop=type:directx
  set linespace=1
endif

" ウィンドウの位置とサイズを記憶する
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END
if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

"メニューを削除
set guioptions-=m
" ツールバーを削除
set guioptions-=T
" gvimでもテキストベースのタブページを使う
set guioptions-=e
" F6でgvimrcを開く
nnoremap <F6> :<C-u>tabedit $MYGVIMRC<CR>
