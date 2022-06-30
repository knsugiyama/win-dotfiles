" <Leader>というプレフィックスキーにスペースを使用する
let g:mapleader = "\<Space>"
" スペース + wでファイル保存
nnoremap <Leader>w :w<CR>
" カーソル下の単語を、置換後の文字列の入力を待つ状態にする
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
" スペース + . でvimrcを開く
nnoremap <Leader>. :new ~/.vimrc<CR>
" Esc 2回で、ハイライトを解除する
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 矢印禁止
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" 入力モード中の移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" jj で Esc
inoremap jj <Esc>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Ctrl + j と Ctrl + k で 段落の前後に移動
nnoremap <C-j> }
nnoremap <C-k> {
