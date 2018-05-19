set encoding=utf-8
scriptencoding utf-8

" =========================================
" Vim Preferences
" =========================================

" -----------------------------------------
" dein.vim setting
" -----------------------------------------

" cf. http://post.simplie.jp/posts/55
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('airblade/vim-gitgutter') " Fileの変更箇所に '+' '-' の差分情報を表示する
call dein#add('ctrlpvim/ctrlp.vim') " Project内のFileやバッファ、履歴からFileを検索する
call dein#add('hail2u/vim-css3-syntax') " CSS3のプロバティをハイライトする
call dein#add('itchyny/lightline.vim') " ステータスラインの表示
call dein#add('itchyny/vim-gitbranch') " lightlineにブランチ情報を表示する
call dein#add('jelera/vim-javascript-syntax') " javascriptのコードをハイライトする
call dein#add('jistr/vim-nerdtree-tabs') " NERD Tree 拡張機能 tree表示をルートからで固定する
call dein#add('jonathanfilip/vim-lucius') " Lucius color scheme for Vim
call dein#add('osyo-manga/vim-monster') " Rubyのコード補完機能強化
call dein#add('othree/html5.vim') " HTML5のタグをハイライトする
call dein#add('rhysd/accelerated-jk') " 'j' 'k' コマンドによる移動を高速化する
call dein#add('scrooloose/nerdtree') " NERD Tree - Tree Explorer
call dein#add('Shougo/dein.vim') " Dein本体
call dein#add('Shougo/neocomplete.vim', { 'on_i': 1 }) " 自動補完プラグイン
call dein#add('Shougo/neosnippet-snippets') " neosnippet.vimの為のスニペット集
call dein#add('Shougo/neosnippet.vim') " スニペット機能を提供する
call dein#add('tell-k/vim-browsereload-mac') " ブラウザで表示されているHTMLファイルをオートリロードする
call dein#add('thinca/vim-qfreplace') " Quickfix内での置換を可能にする
call dein#add('thinca/vim-quickrun') " Source codeを実行し、結果をVim上で表示する
call dein#add('todesking/ruby_hl_lvar.vim') " Rubyのローカル変数をハイライトする
call dein#add('Townk/vim-autoclose') " 閉じカッコを自動補完してくれる
call dein#add('tpope/vim-endwise') " Rubyの end を自動補完する(*他にも対応言語あり)
call dein#add('tyru/caw.vim') " コメントの追加削除を簡単にする
call dein#add('tyru/open-browser.vim') " 選択中のURLや単語をブラウザで開く
call dein#add('vim-jp/vimdoc-ja') " helpの日本語化
call dein#add('w0rp/ale') " LinterをVim内で使えるようにする
call dein#add('Xuyuanp/nerdtree-git-plugin') " NERD Tree 拡張機能 failに変更があると Need Tree に強調表示する
call dein#add('Yggdroot/indentLine') " インデントを視覚的に表示する
call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown'}) " Markdown ハイライト
call dein#add('kannokanno/previm', {'on_ft': 'markdown'}) " Markdown preview

call dein#end()

if dein#check_install() " 未インストールのプラグインがあればインストールする
  call dein#install()
endif

filetype plugin indent on

" -----------------------------------------
" End dein.vim setting
" -----------------------------------------

" =========================================
" UI
" =========================================
set background=dark
colorscheme lucius " カラースキームを設定
syntax on " シンタックスハイライトを有効化
set t_Co=256 "カラーを256色使えるように設定"
hi Comment ctermfg=grey " コメントカラーの変更
set list " 不可視文字を可視化
set listchars=tab:▸-,trail:-,extends:»,precedes:«,nbsp:%,eol:¬ " 不可視文字の表示方法を設定
set number " 行番号を表示
set nuw=3 " 行番号を表示する列の幅を設定
set ruler " ルーラーを表示
set scrolloff=8 " 行の上下にオフセットを設定
set sidescrolloff=16 " 左右スクロール時のオフセットを設定
set sidescroll=1 " 左右は1文字ずつスクロールする
set cursorline " カーソル行を強調表示
" highlight CursorLine ctermbg=grey " カーソル行の色を設定
set nocompatible " viとの互換性をなくす
set splitbelow " ￣\
set splitright " ー新しいウィンドウを下/右に開く
set visualbell t_vb= " ビープ音を無効化
set title " 編集中のfile名を表示する
set laststatus=2 " ステータスラインを常に表示
set cmdheight=1 " メッセージ表示行を1行にする
set showtabline=2 " タブバーを常に表示

" =========================================
" edit
" =========================================
set backspace=start,eol,indent
" start => INSERTモードでBSキーによる文字の削除を可にする
" eol => 改行も削除可にする
" indent => インデントモードでインデントを削除可にする
set virtualedit=onemore " 行末の1文字先までカーソル移動可能にする
set whichwrap=b,s,h,l<,>,[,] " 行頭・行末の左右移動で行を移動する
set clipboard=unnamed,autoselect " OSとクリップホードを共有する
set autoindent " 改行時に自動でインデントする
set smartindent " 改行入力の末尾にインデントを合わせる
set showcmd " 入力中のコマンドを表示
set showmatch " 対応するカッコを強調表示
set matchtime=2 " カッコを強調表示する時間を2にする?よく意味がわからない
set matchpairs& matchpairs+=<:> " <>も強調表示対象に含める
set wildmenu " コマンドラインモードでの補完を有効化
set wildmode=list:longest,full " コマンドラインモードでの補完方法を設定
set spell " スペルチェック機能を有効化(単語の綴りのみ)
set spelllang=en,cjk " スペルチェックから日本語を除外
if has('autocmd') " 改行入力の際にコメントアウトにしない
  autocmd filetype * setlocal formatoptions-=ro
endif

" Highlight the white space at the end of the line
" cf. http://mickey24.hatenablog.com/entry/20120808/vim_highlight_trailing_spaces
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Blue ctermbg=Blue
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" =========================================
" tab
" =========================================
set expandtab " タブの代わりにスペースを挿入
set softtabstop=2 " タブやバックスペースで処理するスペースの数を設定
set tabstop=2 " タブ幅を設定する
set smarttab " コンテキストに応じたタブの処理を行う
set shiftwidth=2 " 行頭でのTab文字の表示幅

" =========================================
" save
" =========================================
set autoread " fileが外部で変更された際に自動で読み込む
set confirm " 未保存fileの終了時に保存確認を行う
set hidden " file変更中に他のファイルを表示可能にする
set history=100 " コマンドラインモードで保存する履歴数を設定する
set noswapfile " swapファイルを作成しない
set nobackup " backupファイルを作成しない
set sessionoptions=tabpages " セッション保存時にtabを含める

" =========================================
" encoding
" =========================================
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis " 読み込み時の文字コードを自動判別(左より優先)
set fileformats=unix,dos,mac " 改行コードの自動認識(左より優先)
" □や○の位置がずれる問題を回避
if exists('&ambiwidth')
  set ambiwidth=double
endif

" =========================================
" search
" =========================================
set hlsearch " 検索結果をハイライト表示する
set incsearch " インクリメンタルサーチを有効にする
set ignorecase " 検索時に大文字・小文字を区別しない
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan " 検索時に最後まで移動したら最初に戻る
" VISUALモードで選択した部分を*で検索する
" cf. http://webtech-walker.com/archive/2009/01/18022957.html
vnoremap * "zy:let @/ = @z<CR>n

" =========================================
" key mapping
" =========================================
" NORMAL/VISUALモードでの<Space>キーの無効化
noremap <Space> <Nop>

" <leader>に<space>キーを割り当てる
let mapleader = "\<Space>"

" 行が折り返されていた場合、改行ではなく表示行で移動する
noremap j gj
noremap k gk

" サーチモードで検索結果を画面中央に表示
nnoremap n nzz
nnoremap N Nzz

" NORMALモード時 % で対応する括弧にジャンプ
source $VIMRUNTIME/macros/matchit.vim

" NORMALモード時0で空行を挿入する
" cf. http://totutotu.hatenablog.com/entry/2015/07/30/vimで改行（空行）を挿入する
nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>j

" 保存/終了する
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" ALEでLinterの示したエラーへ移動する
nmap <silent> <Leader>p <Plug>(ale_previous_wrap)
nmap <silent> <Leader>n <Plug>(ale_next_wrap)

" -----------------------------------------
" plugins preferences
" -----------------------------------------

" -----------------------------------------
" scrooloose/nerdtree
" -----------------------------------------
" ファイルを指定してVimを起動した場合NERDTreeは開かない
if !argc()
  autocmd vimenter * NERDTree | normal gg3j
endif

" -----------------------------------------
" vjistr/vim-nerdtree-tabs
" -----------------------------------------
" 不可視ファイルの表示
let nerdtreeshowhidden = 1
" treeと編集領域を移動する
nmap <leader><tab> <c-w>w
" ファイルが指定されていなければnerdtree-tabsを有効にする
if argc() == 0
let g:nerdtree_tabs_open_on_console_startup = 1
end
" 起動時にnerd treeではなくfileにフォーカスする
let g:nerdtree_tabs_smart_startup_focus = 2

" -----------------------------------------
" iYggdroot/indentLine
" -----------------------------------------
" indentLine
let g:indentLine_char ='|'

" -----------------------------------------
" ictrlpvim/ctrlp.vim
" -----------------------------------------
" 検索モードを開く
nmap <Leader>f :CtrlP<CR>

" -----------------------------------------
" thinca/vim-quickrun
" -----------------------------------------
" 表示されるエディタの分割方向を設定
" コード実行は<Leader>r
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
set splitright

" -----------------------------------------
" Townk/vim-autoclose
" -----------------------------------------

" cf. https://github.com/Townk/vim-autoclose/blob/master/doc/AutoClose.txt
" auto-close || pair in ruby files
      autocmd FileType ruby
              \ let b:AutoClosePairs = AutoClose#DefaultPairsModified("|", "")
" auto-close <> pair in html files
      autocmd FileType html
              \ let b:AutoClosePairs = AutoClose#DefaultPairsModified("<> \"", "")
" auto-close<>[] & don't close""pair in vim files
"       autocmd FileType vim
"               \ let b:AutoClosePairs = AutoClose#DefaultPairsModified("<> []", "\"")

" -----------------------------------------
" tyru/caw.vim
" -----------------------------------------
" コメントの追加・削除を行う
nmap <Leader>/ <Plug>(caw:zeropos:toggle)
vmap <Leader>/ <Plug>(caw:zeropos:toggle)

" -----------------------------------------
" rhysd/accelerated-jk
" -----------------------------------------
" j/kによる移動の高速化
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" -----------------------------------------
" tyru/open-browser.vim
" -----------------------------------------
" 選択中のURLや単語をブラウザで開く
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)

" カレントバッファのファイルをブラウザで開く
" cf. http://d.hatena.ne.jp/osyo-manga/20140711/1405090446
nmap <Leader>o :execute "OpenBrowser" expand("%:p")<CR>

" -----------------------------------------
" tell-k/vim-browsereload-mac
" -----------------------------------------
" After reload browser stay focus self.
" let g:returnAppFlag = 0

" After reload browser back to Terminal app.
let g:returnApp = "Terminal"

" Start auto reload & Stop auto reload on Safari
nmap <Leader>sr :SafariReloadStart<CR>
nmap <Leader>rs :SafariReloadStop<CR>

" Start auto reload & Stop auto reload on Chrome
nmap <Leader>cr :ChromeReloadStart<CR>
nmap <Leader>rc :ChromeReloadStop<CR>

" -----------------------------------------
" Shougo/neocomplete.vim
" -----------------------------------------
" cf. https://qiita.com/ahiruman5/items/4f3c845500c172a02935
" 自動補完機能を有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化(大文字が入力されるまで大文字小文字の区別を無視する)
let g:neocomplete#enable_smart_case = 1
" 6文字以上の単語に対して補完機能を有効化
let g:neocomplete#min_keyword_length = 6
" 6文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 6
"<Enter>keyで補完候補の確定
" どれもうまく動かず調整中
" <TAB>keyで補完候補の選択
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" -----------------------------------------
" osyo-manga/vim-monster
" -----------------------------------------
" vim-monsterを有効化
let g:neocomplete#sources#omni#input_patterns = {
\ 'ruby': '[^. *\t]\.\w*\|\h\w*::'
\}

" -----------------------------------------
" vim-jp/vimdoc-ja
" -----------------------------------------
" ヘルプを日本語で表示する
set helplang=ja,en

" -----------------------------------------
" w0rp/ale
" -----------------------------------------
" Change the format for echo messages
let g:ale_statusline_format = ['>> %d', '-- %d', 'LGTM!']

" Keep the sign gutter open at all times.
let g:ale_sign_column_always = 1

" Show errors or warnings in status line.
let g:airline#extensions#ale#enabled = 1

" List of linters to run
let g:ale_linters = {
      \ 'html': ['htmlhint'],
      \ 'css': ['csslint'],
      \ 'javascript': ['jshint']
      \}

" Change the format for echo messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" -----------------------------------------
" plasticboy/vim-markdown
" -----------------------------------------
" 拡張子.mdのファイルをマークダウンとして認識させる
" cf. http://www.key-p.com/blog/staff/archives/9032
au BufRead,BufNewFile *.md set filetype=markdown

" -----------------------------------------
" itchyny/lightline.vim
" -----------------------------------------
" パスを表示する
" cf. http://itchyny.hatenablog.com/entry/20130828/1377653592

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename', 'ale' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'gitbranch': 'gitbranch#name',
        \   'filename': 'LightlineFilename',
        \   'ale': 'ALEGetStatusLine',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" -----------------------------------------
" End plugins preferences
" -----------------------------------------

" =========================================
" Advanced setting
" =========================================
" cf. http://postd.cc/how-to-boost-your-vim-productivity/
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
