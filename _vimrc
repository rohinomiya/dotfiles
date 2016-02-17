"set encoding=utf-8
"scriptencoding utf-8

" my _vimrc (read after vimrc)

" Last Change: 2016/02/13 22:15:38.
" Maintainer:  rohinomiya <rohinomiya@gmail.com>

"-------------------------------------------------------------------------------
" Basic setting
"-------------------------------------------------------------------------------


"runtimepath
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

" to :find
set path +=~/Dropbox/Go/my-project/src/**
set path +=~/Dropbox/Go/third-party/src/**

"let mapleader = ","              " キーマップリーダー

"todo:整形して

" set wrap              " 長いテキストの折り返し
" set wrapscan          " テキスト挿入中の自動折り返しを日本語に対応させる
"set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
"set guioptions-=T				"ツールバーを削除
"set modelines=0                  " モードラインは無効
set autoread          		" 外部でファイルが変更されたら自動で読みなおす
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set browsedir=buffer             " Exploreの初期ディレクトリ
set clipboard=unnamedplus,unnamed " クリップボード・レジスタ関連
set colorcolumn=80                " その代わり80文字目にラインを入れる
set formatoptions+=mMq  "q=勝手に改行しない(重要)
set hidden                                           " 編集中でも他のファイルを開けるようにする
set iminsert=0 " insert-mode時に日本語入力をオフにする
set imsearch=0 " 検索時に日本語入力をオフにする
set infercase         " 補完時に大文字小文字を区別しない
set laststatus=2	"ステータス行を常に表示（lightline.vimのために）
set list              " 不可視文字の可視化
set listchars=tab:\|\ ,trail:-  "不可視文字を表示。最後にスペースが１つ
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加 
set matchtime=3       " 対応括弧のハイライト表示を3秒にする
set nojoinspaces " 行連結で変なことをさせない
set nostartofline " いろんなコマンドの後にカーソルを先頭に移動させない
set notitle                      " vimを使ってくれてありがとう
set number            " 行番号の表示
set scrolloff=5                  " スクロール時の余白確保
set showcmd                      " コマンドをステータス行に表示
set showmatch         " 対応する括弧などをハイライト表示する
set showmode                     " 現在のモードを表示
set splitbelow "open new windows below
set splitright "open new windows right
set switchbuf=useopen " 新しく開く代わりにすでに開いてあるバッファを開く
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set virtualedit=block     " 矩形選択中、文字が存在しない場所へもカーソル移動可能に
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set wildignorecase
set wildmenu          " コマンドライン補完するときに強化されたものを使う
set completeopt=menu,preview   "補完候補をメニューとプレビューで表示
" set autochdir	"開いているファイルのディレクトリに移動する(:VilFilerExplorer でカレントバッファの場所をさっと開くために)

" ビープ音
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
set visualbell t_vb=                     " ビープをならさない

" タブ
set expandtab                   "タブ文字を半角スペースに展開する
set autoindent
set softtabstop=4
set tabstop=4 
set shiftwidth=4
set shiftround        " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める

" 検索
set nosmartcase
set ignorecase    "検索時に大文字小文字を無視
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

" バックアップ
set nobackup
set noswapfile
set nowritebackup
set noundofile	" ~ ファイルを作成しない

" 文字コード
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp	" 文字コードの自動判別
set fileformats=unix,dos,mac " 改行コードの自動判別

" 半透明の設定
if has('gui_running')
    autocmd GUIEnter *    set transparency=220 "設定はGUIEnter event後にしなければ有効に成らない。
    autocmd FocusGained * set transparency=220	"フォーカス有無で半透明度を変える
    autocmd FocusLost *   set transparency=128
endif

"-------------------------------------------------------------------------------
" 保存時に行末の不要なスペース削除
function! RTrim()
    let s:cursor = getpos(".")
    %s/\s\+$//e
    call setpos(".", s:cursor)
endfunction
autocmd BufWritePre *.ahk,*.py,*.rb,*.js,*.bat call RTrim()

"バッファ移動を簡単にする
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" C-j で、ノーマルモードに戻る
inoremap <C-j> <ESC>
cnoremap <C-j> <ESC>
vnoremap <C-j> <ESC>

" : だけでなく ; でもコマンド入力
noremap ; :

" 前後のバッファに移動
nmap gt :bn<CR>
nmap gT :bp<CR>

" ノーマルモードに戻るときにIMEオフに
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" 挿入モードでのカーソル移動
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

" カーソル前の文字削除
inoremap <silent> <C-h> <C-g>u<C-h>

" カーソル後の文字削除
inoremap <silent> <C-d> <Del>

" カーソルから行頭まで削除
inoremap <silent> <C-d>e <Esc>lc^

" カーソルから行末まで削除
inoremap <silent> <C-d>0 <Esc>lc$

" カーソルから行頭までヤンク
inoremap <silent> <C-y>e <Esc>ly0<Insert>

" カーソルから行末までヤンク
inoremap <silent> <C-y>0 <Esc>ly$<Insert>

" 引用符, 括弧の設定
" inoremap { {}<Left>
" inoremap [ []<Left>
" inoremap ( ()<Left>
" inoremap " ""<Left>
" inoremap ' ''<Left>
" inoremap <> <><Left>

" Close help by "q"
autocmd FileType help nnoremap <buffer> q <C-w>c

"-------------------------------------------------------------------------------
" plugin:neobundle.vim
"-------------------------------------------------------------------------------
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath^=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" My Bundle written in .toml files.
if neobundle#load_cache()
    NeoBundleFetch 'Shougo/neobundle.vim'
    call neobundle#load_toml('~/.vim/neobundle.toml')
    call neobundle#load_toml('~/.vim/neobundlelazy.toml', {'lazy' :1} )


    "NeoBundleLazy 'sgur/unite-qf'
    NeoBundleSaveCache
endif
call neobundle#end()
filetype plugin indent on

" Installation check.
NeoBundleCheck

"-------------------------------------------------------------------------------
" plugins
"---------------------------------------------------------------------------
augroup MyAutoCmd
    autocmd!
augroup END

"-------------------------------------------------------------------------------
" plugin:easy-align
" (https://github.com/junegunn/vim-easy-align)
"-------------------------------------------------------------------------------
"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-------------------------------------------------------------------------------
" plugin:increment-activator
"-------------------------------------------------------------------------------
"let g:increment_activator_no_default_key_mappings = 1
"let g:increment_activator_no_default_candidates = 1
let g:increment_activator_filetype_candidates =
            \ {
            \   '_': [
            \     ['public', 'friend', 'protected', 'private'],
            \     ['var', 'string', 'int', 'bool', 'dynamic'], 
            \     ['info', 'warning', 'notice', 'error', 'critical', 'debug'],
            \     ['ぬるぽ', 'ガッ'],
            \   ],
            \   'python': [
            \     ['True', 'False', 'None'],
            \   ],
            \   'ruby': [
            \     ['true', 'false', 'nil'],
            \   ],
            \   'go': [
            \     ['true', 'false', 'iota', 'nil'],
            \     ['byte', 'complex64', 'complex128'],
            \     ['int', 'int8', 'int16', 'int32', 'int64'],
            \     ['uint', 'uint8', 'uint16', 'uint32', 'uint64'],
            \     ['float32', 'float64'],
            \     ['interface', 'struct'],
            \   ],
            \ }

" Insert-mode
imap <silent> <C-a> <Plug>(increment-activator-increment)
imap <silent> <C-x> <Plug>(increment-activator-decrement)

"-------------------------------------------------------------------------------
" plugin:vim-quickrun
"-------------------------------------------------------------------------------
"<leader>=\
nmap <Leader>r <Plug>(quickrun)

let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
    let g:quickrun_config = {
                \ "*": {"runner": "remote/vimproc"},
                \ }
    "watchdogsのチェック後にquickfixウィンドウを開かせない
    let g:quickrun_config["watchdogs_checker/_"] = {
                \ "outputter/quickfix/open_cmd" : "",
                \ "hook/qfstatusline_update/enable_exit" : 1,
                \ "hook/qfstatusline_update/priority_exit" : 4,
                \ }
    let g:quickrun_config["go/watchdogs_checker"] = {
                \   "type" : "watchdogs_checker/golint"
                \ }
    let g:quickrun_config['watchdogs_checker/golint'] = {
                \   'command':     'golint',
                \   'exec':        '%c %o %s:p',
                \   "errorformat" : '%f:%l:%c: %m,%-G%.%#',
                \ }
    call watchdogs#setup(g:quickrun_config)
endfunction
unlet s:hooks

" 実行するコードの範囲を選択して下のコマンドを実行します
" {type} には実行する言語を設定します
" {type} がない場合はバッファに設定されている filetype の言語になります。
" :QuickRun -outputter replace_region {type}

" 上記のままだと失敗した場合にエラーメッセージで置き換えられるので
" 成功した場合のみ置き換えるようなコマンドを定義
command! -nargs=* -range=0 -complete=customlist,quickrun#complete
            \   ReplaceRegion
            \   QuickRun
            \       -mode v
            \       -outputter error
            \       -outputter/success replace_region
            \       -outputter/error message
            \       -outputter/message/log 1
            \       <args>
" hook-unite_quickfix を使用している場合は off にしておいた方がよい
" \       -hook/unite_quickfix/enable 0

" example
" :ReplaceRegion ruby

"-------------------------------------------------------------------------------
" plugin:caw - comment plugin
"-------------------------------------------------------------------------------
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"-------------------------------------------------------------------------------
" plugin:vim-watchdogs
"-------------------------------------------------------------------------------
" 書き込み後にシンタックスチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1

" こっちは一定時間キー入力がなかった場合にシンタックスチェックを行う
" バッファに書き込み後、1度だけ行われる
let g:watchdogs_check_CursorHold_enable = 1

" :WatchdogsRun後にlightline.vimを更新
let g:Qfstatusline#UpdateCmd = function('lightline#update')

""----------------------------------------
"" edit .vimrc / .gvimrc
""----------------------------------------
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>

" Auto reload(with coloring)
augroup source-vimrc
	autocmd!
	if !has('gui_running') && !(has('win32') || has('win64'))
		autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	else
		autocmd BufWritePost $MYVIMRC source $MYVIMRC | 
					\ if has('gui_running') | source $MYGVIMRC
		autocmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
	endif
augroup END


""--------------------
"" 検索関連
""--------------------

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"検索時にvery magic を有効にする(Perl風正規表現)
nnoremap / /\v
nnoremap ? ?\v


""--------------------
"" 表示関連
""--------------------

" 現在行の色を変える
set cursorline
let g:cursorline_flg = 1 " cursorline はウィンドウローカルなのでグローバルなフラグを用意しておく
let g:cursorcolumn_flg = 0

nnoremap n nzz " 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" nnoremap j gj " j, k による移動を折り返されたテキストでも自然に振る舞うように変更
" nnoremap k gk

vnoremap v $h " vを二回で行末まで選択

""--------------------
""Yggdroot / indentLine
""--------------------
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_char = '|'
"
"---------------------------------------------------------------------------
"plugin:lightlne.vim
"---------------------------------------------------------------------------
let g:lightline = {
            \ 'component': {
            \   'readonly': '%{&readonly?"[R]":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
            \ },
            \ }

"TODO:エラーの時だけ、既存の項目のじゃまにならないようエラー表示したい
" let g:lightline = {
" 			\ 'mode_map': {'c': 'NORMAL'},
" 			\ 'active': {
" 			\   'right': [
" 			\     [ 'syntaxcheck' ],
" 			\   ]
" 			\ },
" 			\ 'component_expand': {
" 			\   'syntaxcheck': 'qfstatusline#Update',
" 			\ },
" 			\ 'component_type': {
" 			\   'syntaxcheck': 'error',
" 			\ },
" 			\ }

"---------------------------------------------------------------------------
" plugin:tagbar
"---------------------------------------------------------------------------
let g:tagbar_left = 0
let g:tagbar_autofocus = 1
nnoremap <F3> :TagbarToggle<CR>

"---------------------------------------------------------------------------
" plugin:vimfiler
"---------------------------------------------------------------------------
" ディレクトリで開いた場合に VimFilerを起動
" $> gvim hoge/ には対応してない
if isdirectory(expand("%:p"))
    autocmd VimEnter * VimFiler
endif

" nnoremap <F2> :VimFilerExplorer<CR>
nnoremap <silent> <F2> :<C-u>VimFilerBufferDir -split -simple -toggle -winwidth=25 -no-quit<CR>

" close vimfiler automatically when there are only vimfiler open
autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif

let s:hooks = neobundle#get_hooks("vimfiler")
function! s:hooks.on_source(bundle)
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_enable_auto_cd = 1

    " .から始まるファイルおよび.pycで終わるファイルを不可視パターンに
    " 2013-08-14 追記
    let g:vimfiler_ignore_pattern = "\%(^\..*\|\.pyc$\)"

    " vimfiler specific key mappings
    autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
    function! s:vimfiler_settings()
        " ^^ to go up
        nmap <buffer> ^^ <Plug>(vimfiler_switch_to_parent_directory)
        " use R to refresh
        nmap <buffer> R <Plug>(vimfiler_redraw_screen)
        " overwrite C-l
        nmap <buffer> <C-l> <C-w>l
    endfunction
endfunction
unlet s:hooks

"---------------------------------------------------------------------------
"neocomplate.vim
"---------------------------------------------------------------------------
" if neobundle#tap('neocomplete')
" 	call neobundle#config({
" 				\   'depends': ['Shougo/context_filetype.vim'],
" 				\ })

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
let g:neocomplete#max_keyword_width = 10000

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" preview window を閉じない
let g:neocomplete#enable_auto_close_preview = 0
" Insert modeから抜けるときに閉じる
autocmd InsertLeave * silent! pclose!

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

" 	call neobundle#untap()
" endif

"--------------------
" plugin:neosnippet
"--------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ↓ .json編集中にダブルクォートが見えなくなるので無効にした
" " For conceal markers.
" if has('conceal')
"     set conceallevel=2 concealcursor=niv
" endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'
if ! empty(neobundle#get("vim-snippets"))
    let g:neosnippet#snippets_directory += ['~/.vim/bundle/vim-snippets/snippets']
endif

"--------------------
" unite.vim
"--------------------
" The prefix key.
nnoremap         [unite] <Nop>
nmap     <space> [unite]

" nnoremap <silent> [unite]k  :<C-u>Unite output:map|map!|lmap<CR>  "cause error
" nnoremap <silent> [unite]l  :<C-u>Unite line<CR>
" nnoremap <silent> [unite]r  :<C-u>Unite register -buffer-name=register<CR>
nnoremap <silent> [unite]a  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]c  :<C-u>Unite codic<CR>
nnoremap <silent> [unite]f  :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru -buffer-name=file_mru<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline -buffer-name=outline<CR>
nnoremap <silent> [unite]s  :<C-u>Unite neosnippet -buffer-name=snippet<CR>
nnoremap <silent> [unite]t  :<C-u>:Unite sonictemplate<CR>
nnoremap <silent> [unite]u  :<C-u>Unite buffer -buffer-name=buffer<CR>
nnoremap <silent> [unite]x  :<C-u>Unite menu:shortcut<CR>
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>


" カーソル位置の単語をgrep検索
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=grep_pt<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> [unite]r  :<C-u>UniteResume search-buffer<CR>

" close current buffer
nnoremap <silent> [unite]w  :<C-u>bd<CR>
nnoremap <silent> [unite]q  :<C-u>bd<CR>

"next buffer
nnoremap <silent> [unite]n  :<C-u>bnext<CR>

" / キーを、unite-lineに置き換える・・・のはやめて[unite]/にする
nnoremap <silent> [unite]/ :<C-u>Unite -buffer-name=search line -start-insert -auto-resize -no-split -auto-preview<CR>

"custom menu
let g:unite_source_menu_menus = {
            \   "shortcut" : {
            \       "description" : "custom unite-menu",
            \       "command_candidates" : [
            \           ["NeoSnippetEdit", "NeoSnippetEdit"],
            \           ["GoImports", "GoImports"],
            \           ["UniteBookmarkAdd", "UniteBookmarkAdd"],
            \           ["VimFiler", "VimFiler"],
            \           ["edit vimrc", "edit $MYVIMRC"],
            \           ["edit gvimrc", "edit $MYGVIMRC"],
            \           ["Unite ColorScheme", "Unite -auto-preview colorscheme"],
            \           ["Unite Key-mapping", "Unite output:map|map!|lmap -buffer-name=key-mapping"],
            \           ["NeoBundleInstall", "NeoBundleInstall"],
            \           ["NeoBundleClean", "NeoBundleClean"],
            \           ["NeoBundleCheckUpdate", "NeoBundleCheckUpdate"],
            \           ["vim-overによるビジュアル置換(:OverCommandline)", "OverCommandLine"],
            \           ["選択範囲をrubyで実行した結果に置き換え", "ReplaceRegion ruby"],
            \           ["選択範囲をpythonで実行した結果に置き換え", "ReplaceRegion python"],
            \           ["go:godoc", "Godoc"],
            \           ["go:Format code", "Fmt"],
            \           ["go:insert Import", "Import"],
            \           ["set fileformat=dos", "set fileformat=dos"],
            \           ["set fileformat=unix", "set fileformat=unix"],
            \           ["set fileformat=mac", "set fileformat=mac"],
            \           ["set encoding=utf-8", "set encoding=utf-8"],
            \           ["set encoding=sjis", "set encoding=sjis"],
            \       ],
            \   },
            \}

let s:hooks = neobundle#get_hooks("unite.vim")
function! s:hooks.on_source(bundle)
    let g:unite_abbr_highlight = 'TabLine'
    let g:unite_cursor_line_highlight = 'TabLineSel'
    let g:unite_data_directory = '~/.unite'
    let g:unite_enable_ignore_case = 1
    let g:unite_enable_smart_case = 1
    let g:unite_enable_start_insert =1
    let g:unite_source_file_mru_filename_format = ''
    let g:unite_source_file_mru_limit = 200
    let g:unite_source_history_yank_enable = 1

    " default action
    call unite#custom_default_action("source/bookmark/directory", "vimfiler")
    call unite#custom_default_action("directory", "vimfiler")
    call unite#custom_default_action("directory_mru", "vimfiler")

    " use pt(fast grep) for unite grep
    if executable('pt')
        let g:unite_source_grep_command = 'pt'
        let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
        let g:unite_source_grep_recursive_opt = ''
    endif

    autocmd FileType unite call s:unite_settings()
    function! s:unite_settings()
        " Overwrite settings.
        nmap <buffer> <ESC>      <Plug>(unite_exit)
        imap <buffer> jj      <Plug>(unite_insert_leave)
        imap <buffer> qq      <Plug>(unite_exit)

        imap <buffer> <Esc><Esc> <Plug>(unite_exit)
        nmap <buffer> <Esc> <Plug>(unite_exit)
        nmap <buffer> <C-n> <Plug>(unite_select_next_line)
        nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
    endfunction
endfunction
unlet s:hooks

"---------------------------------------------------------------------------
" plugin:sonic-template
" ( https://github.com/mattn/sonictemplate-vim )
"---------------------------------------------------------------------------
let g:sonictemplate_vim_template_dir = '$HOME/.vim/templates'

" |{{_input_:var}}| にて置き換えられる定形語句を登録
let g:sonictemplate_vim_vars = {
            \ '_': {
            \   'author': 'rohinomiya',
            \   'mail': 'rohinomiya@gmail.com',
            \ },
            \ }

"---------------------------------------------------------------------------
" plugin:vim-go
" notice: vim-goを使う前に :GoInstallBinaries を1回実行してね
"---------------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" Disable Auto-format
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0

" use quickrun instead of below.
" au FileType go nmap <leader>r <Plug>(go-run)

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <Leader>e <Plug>(go-rename)

"---------------------------------------------------------------------------
" plugin:autodate.vim - auto update timestamp in file
"---------------------------------------------------------------------------
let autodate_keyword_pre="Last Change: \*"
let autodate_keyword_post="."
let autodate_format="%Y/%m/%d %H:%M:%S"
let autodate_lines=10	"最初の10行だけが対象

"---------------------------------------------------------------------------
" FileType:lua
"---------------------------------------------------------------------------
au BufRead,BufNewFile .nyagos		set filetype=lua

"---------------------------------------------------------------------------
" FileType:golang
"---------------------------------------------------------------------------
autocmd FileType go set noexpandtab autoindent softtabstop=4 tabstop=4 shiftwidth=4
" autocmd BufWritePre *.go :silent Fmt	"保存時にフォーマット整形
" autocmd InsertLeave,BufWritePost,TextChanged *.go WatchdogsRun
" autocmd BufRead,BufNewFile *.go WatchdogsRun
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
"
" err という文字をハイライト
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

"---------------------------------------------------------------------------
" FileType:cs
"---------------------------------------------------------------------------
" autocmd FileType cs set expandtab autoindent softtabstop=4 tabstop=4 shiftwidth=4
"
" " 行末に ; を挿入して改行したい
" " autocmd FileType cs inoremap <C-S-M> <ESC>A;<CR>
" autocmd FileType cs inoremap ;; ;<CR>
" autocmd FileType cs inoremap (); ();<CR>
"
" " sort using lines. (C#)
" autocmd FileType cs map <C-S> vip:sort iru /\s[a-zA-Z0-9\.]\+/<CR>

""---------------------------------------------------------------------------
"" unite-launch
""---------------------------------------------------------------------------
"let g:unite_launch_apps = [
"      \ 'gmilk -a -n 10 public'
"      \ ]
"
""---------------------------------------------------------------------------
"" gmilk コマンドの結果をUnite qf で表示する
""---------------------------------------------------------------------------
"command! -nargs=1 Gmilk call s:Gmilk("gmilk -a -n 200", <f-args>)
"
"function! s:Gmilk(cmd, arg)
"  silent execute "cgetexpr system(\"" . a:cmd . " ". a:arg . "\")"
"  if len(getqflist()) == 0
"    echohl WarningMsg
"    echomsg "No match found."
"    echohl None
"  else
"    "cwindow
"    execute "Unite -auto-preview qf"
"    redraw!
"  endif
"endfunction
"
""--------------------
"" ~/autoload/external.vim
""--------------------
""実行ファイルのパス
"let g:external_hlp_hhhexe = 'hhh.exe'
"let g:external_hlp_winhlpexe = 'C:\Windows\winhlp32.exe'
"
""ファイルタイプ毎のヘルプファイルを記述。
""空白が入っていても文字列自体をダブルクォーテーションで括っては駄目。
"let g:external_hlp_files = {
"      \"autohotkey":  expand('~/Dropbox/bin/AutoHotkeyJP.chm')
"      \}
"
""--------------------
"" ~/autoload/external.vim
""--------------------
""キーマッピング
""nnoremap <expr><silent> K     externalhelp#show_windowhelp(0)
"
""---------------------------------------------------------------------------
"" html 
""---------------------------------------------------------------------------
""html中のパスをうまく開けるようにする
""http://hail2u.net/blog/software/only-one-line-life-changing-vimrc-setting.html
"autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/
"
""---------------------------------------------------------------------------
""# more vovenient insert mode
""---------------------------------------------------------------------------
"
""--------------------
"" FileType:autohotkey
""--------------------
au BufRead,BufNewFile *.ahk		set filetype=autohotkey

