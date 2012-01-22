" ======================
" vim configuration file
"
" Maintener: rohinomiya <rohinomiya@gmail.com>
" Last Change: 23-Jan-2012.
" README file is here:
"
" Sorry for writing some comments in Japanese, and I'll translate to English later.
" ======================

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible               " be iMproved
set viminfo+=!

filetype plugin indent off     " required!

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" let NeoBundle manage NeoBundle
" required! 
"NeoBundle 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'

""
"" neobundle.vim
""
" original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'taq/vim-refact'

" color-scheme
NeoBundle 'Lucius'

" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'YankRing.vim'

" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'EnhCommentify.vim'
NeoBundle 'autodate.vim'
NeoBundle 'eregex.vim'
NeoBundle 'monday'
NeoBundle 'quickrun.vim'
NeoBundle 'savevers.vim'
NeoBundle 'surround.vim'

" trinity
NeoBundle 'vim-scripts/trinity.vim'
NeoBundle 'vim-scripts/Source-Explorer-srcexpl.vim'
NeoBundle 'vim-scripts/taglist.vim'

NeoBundle 'Gist.vim'

" non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'

filetype plugin indent on     " required!

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

"NeoBundle 'Zenburn'
"NeoBundle 'blackdust.vim'
"NeoBundle 'mrkn256.vim'
"NeoBundle 'Wombat'
"
""" plugins
"
""NeoBundle 'SQLUtilities'
""NeoBundle 'astashov/vim-ruby-debugger'
"NeoBundle 'kana/vim-textobj-line'
"NeoBundle 'kana/vim-altr'
"NeoBundle 'Shougo/git-vim'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimproc'  
"NeoBundle 'sgur/unite-everything'
"NeoBundle 'tryit.vim'
"NeoBundle 'phrase.vim'
"
"NeoBundle 'utl.vim'
"
"" trinity
"NeoBundle 'vim-scripts/trinity.vim'
"NeoBundle 'taglist.vim'
"NeoBundle 'Source-Explorer-srcexpl.vim'
"NeoBundle 'The-NERD-tree'
""NeoBundle 'trinity.vim'
"
""NeoBundle 'calendar.vim'
"
""NeoBundle 'vimwiki'
"NeoBundle 'smartchr'
"
""NeoBundle 'tagexplorer.vim'
""NeoBundle 'tpope/ivim-fugitive'
""NeoBundle 'tpope/vim-endwise' " neocomplcacheと相性悪い
""NeoBundle 'project.tar.gz'
""NeoBundle 'Tagbar'
""NeoBundle 'taglist-plus'
""NeoBundle '2htmlj'
""NeoBundle 'rails.vim'
""NeoBundle 'Sixeight/unite-grep'
""NeoBundle 'ZenCoding.vim'
""NeoBundle 'bookmarks.vim'
""NeoBundle 'copypath.vim'
""NeoBundle 'css.vim'
""NeoBundle 'motemen/git-vim'
""NeoBundle 'mru.vim'
""NeoBundle 'rename.vim'
""NeoBundle 'repeat.vim'
""NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'thinca/vim-ref'
""NeoBundle 'tsaleh/vim-matchit'
""NeoBundle 'vim-ruby/vim-ruby'
""NeoBundle 'tacroe/unite-mark'
"NeoBundle 'jceb/vim-hier'
"NeoBundle 'dannyob/quickfixstatus'
"NeoBundle 'tsukkee/unite-tag'
"NeoBundle 'h1mesuke/unite-outline'
"NeoBundle 'tsukkee/unite-help'
"NeoBundle 'thinca/vim-unite-history'
"NeoBundle 'thinca/vim-auto_source'
"
"" neco - rubymf は、Ruby 1.9.3 later
""NeoBundle 'ujihisa/neco-rubymf'
"
"" 変数の命名規則変更
"NeoBundle 'tpope/vim-abolish'


""
"" neocomplcache.vim
""

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"-----------------------------------------------------------------------------
"
""Escの1回押しでハイライト消去
""nmap <ESC><ESC> ;nohlsearch<CR><ESC>
"
"" ディレクトリ自動移動 (開いたファイルのディレクトリがカレントディレクトリに)
"" 全ファイルを対象にすると Gist.vim がおかしげになるので、html,shtml,css,js,php,pl,tpl を対象に
"au BufEnter *.rb,*.ahk,*.txt,*.htm,*.html,*.shtml,*.css,*.js,*.php,*.pl,*.tpl execute ":lcd " . expand("%:p:h")
"
"" 入力モード時、ステータスラインのカラーを変更
"augroup InsertHook
"  autocmd!
"  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
"augroup END
"
""カーソル行下線（「set cursorline」がある場合に有効）
"set cursorline
"
"" タブ文字、行末など不可視文字を表示する
"" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）
""set list
"
"" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
"set splitbelow
"set splitright
"
"
""スペースを含むファイル名の場合にも、正確なファイル名を取得できるように
"set isfname+=32
"
""矩形選択で行末以降も選択できるようにする
""set virtualedit+=block
"
"" ビジュアルベル
"set visualbell
"
"" タブの入力を空白文字に置き換える
"set expandtab
"
"" タブページのラインを表示:2つ以上タブページがある場合に表示
"set showtabline=2
"
"" スペースやTabなどの見えない文字を表示させる
""set list
""set listchars=tab:≫-,trail:-,eol:?,extends:≫,precedes:≪,nbsp:%
"

"" バックスペースでインデントや改行を削除できるようにする
"set backspace=indent,eol,start
"
"set history=50		" keep 50 lines of command line history
"set ruler		" show the cursor position all the time
"set showcmd		" display incomplete commands
"
"" 検索文字を打ち込むと即検索
"set incsearch		" do incremental searching
""
""括弧の入力時にカーソルを対応する括弧の上に一定時間表示させる 
"set showmatch
"set matchtime=3
"
"" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
"" let &guioptions = substitute(&guioptions, "t", "", "g")
"
"" コマンドライン補完するときに補完候補を表示する
"set wildmenu
"
"" Don't use Ex mode, use Q for formatting
""map Q gq
"
"" In many terminal emulators the mouse works just fine, thus enable it.
""set mouse=a
"
"" Switch syntax highlighting on, when the terminal has colors
"" Also switch on highlighting the last used search pattern.
""if &t_Co > 2 || has("gui_running")
""   syntax on
""   set hlsearch
""endif
""
""filetype indent plugin on
""
""" Only do this part when compiled with support for autocommands.
""if has("autocmd")
""
""   " Enable file type detection.
""   " Use the default filetype settings, so that mail gets 'tw' set to 72,
""   " 'cindent' is on in C files, etc.
""   " Also load indent files, to automatically do language-dependent indenting.
""   filetype indent plugin on
""
""   " Put these in an autocmd group, so that we can delete them easily.
""   augroup vimrcEx
""      au!
""
""      " For all text files set 'textwidth' to 78 characters.
""      autocmd FileType text setlocal textwidth=78
""
""      " When editing a file, always jump to the last known cursor position.
""      " Don't do it when the position is invalid or when inside an event handler
""      " (happens when dropping a file on gvim).
""      autocmd BufReadPost *
""               \ if line("'\"") > 0 && line("'\"") <= line("$") |
""               \   exe "normal! g`\"" |
""               \ endif
""
""   augroup END
""
""else
""
""   set autoindent		" always set autoindenting on
""
""endif " has("autocmd")
""
"" -------------------
"" タブページの切り替えをWindowsのように
"" CTRL+Tab SHIFT+Tabで行うように.
"" -------------------
""if v:version >= 700
""  nnoremap <C-Tab>   gt
""  nnoremap <C-S-Tab> gT
""endif
"
"" -------------------
""http://www.kawaz.jp/pukiwiki/?vim
"" 文字コードの自動認識
""if &encoding !=# 'utf-8'
""  set encoding=japan
""  set fileencoding=japan
""endif
""if has('iconv')
""  let s:enc_euc = 'euc-jp'
""  let s:enc_jis = 'iso-2022-jp'
""   iconvがeucJP-msに対応しているかをチェック
""  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
""    let s:enc_euc = 'eucjp-ms'
""    let s:enc_jis = 'iso-2022-jp-3'
""   iconvがJISX0213に対応しているかをチェック
""  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
""    let s:enc_euc = 'euc-jisx0213'
""    let s:enc_jis = 'iso-2022-jp-3'
""  endif
""   fileencodingsを構築
""  if &encoding ==# 'utf-8'
""    let s:fileencodings_default = &fileencodings
""    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
""    let &fileencodings = &fileencodings .','. s:fileencodings_default
""    unlet s:fileencodings_default
""  else
""    let &fileencodings = &fileencodings .','. s:enc_jis
""    set fileencodings+=utf-8,ucs-2le,ucs-2
""    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
""      set fileencodings+=cp932
""      set fileencodings-=euc-jp
""      set fileencodings-=euc-jisx0213
""      set fileencodings-=eucjp-ms
""      let &encoding = s:enc_euc
""      let &fileencoding = s:enc_euc
""    else
""      let &fileencodings = &fileencodings .','. s:enc_euc
""    endif
""  endif
""   定数を処分
""  unlet s:enc_euc
""  unlet s:enc_jis
""endif
"" 日本語を含まない場合は fileencoding に encoding を使うようにする
""if has('autocmd')
""  function! AU_ReCheck_FENC()
""    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
""      let &fileencoding=&encoding
""    endif
""  endfunction
""  autocmd BufReadPost * call AU_ReCheck_FENC()
""endif
"
"" □とか○の文字があってもカーソル位置がずれないようにする
""if exists('&ambiwidth')
""  set ambiwidth=double
""endif
"
""Ctrl + t"の代わりに、"Ctrl + ["でタグジャンプから戻れるようになります。"Ctrl + ]"でタグジャンプするので、その逆の操作は"Ctrl + ["でできれば直感的
"nmap <c-[>  :pop<CR>
"
""C-vの矩形選択で行末より後ろもカーソルを置ける
"set virtualedit=block
"
""辞書ファイルを使用する設定に変更
"set complete+=k
"
""クリップボードをWindowsと連携
""set clipboard=unnamed
""ビジュアル行で選択下だけで、自動的に*レジスタにコピーする
""set clipboard=autoselect,unnamed
""↓
"set clipboard=unnamedplus,unnamed
"
"" 折り返ししない
"set nowrap
"
""  末尾のスペースだけを目立たせる
"" http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
""highlight WhitespaceEOL ctermbg=red guibg=red
""match WhitespaceEOL /\s\+$/
""autocmd WinEnter * match WhitespaceEOL /\s\+$/
"
"" -------------------
"" http://nanabit.net/blog/2007/11/03/vim-cursorline/
"" カレントウィンドウにのみ罫線を引く
"" -------------------
""augroup cch
""  autocmd! cch
""  autocmd WinLeave * set nocursorcolumn nocursorline
""  autocmd WinEnter,BufRead * set cursorcolumn cursorline
""augroup END
"
""highlight CursorLine ctermbg=black guibg=black
""highlight CursorColumn ctermbg=black guibg=black
"
"" -------------------
"" migemo(g/)
"" -------------------
""g?をMigemoによる拡張検索にマップ
""set migemo
"
"" -------------------
"" GREP
"" -------------------
"" GNU GREPを使う
""let Grep_Path = 'C:\cygwin\bin\grep.exe'
""let Fgrep_Path = 'C:\cygwin\bin\grep.exe -F'
""let Egrep_Path = 'C:\cygwin\bin\grep.exe -E'
""let Grep_Find_Path = 'C:\cygwin\bin\find.exe'
""let Grep_Xargs_Path = 'C:\cygwin\bin\xargs.exe'
""let Grep_Shell_Quote_Char = '"'
"
""let Grep_Skip_Dirs = '.svn'
""let Grep_Skip_Files = '*.bak *~'
"
""grep後に自動的にcw(QuickFix)"
""au QuickfixCmdPost vimgrep cw
"" :vimgrep /hogehoge/j *.txt
"":helpg[rep] hogehoge
"":bufdo vimgrepadd /hogehoge/ %
"":windo vimgrepadd /hogehoge/ %
"
"" ファイルの前回閉じたときの場所を記憶
"if has("autocmd")
"  autocmd BufReadPost *
"        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"        \   exe "normal! g'\"" |
"        \ endif
"endif
"
"" タブページのラベルを常に表示する(2つ以上タブページがある場合に表示)
"set showtabline=1
"
"" -------------------
"" 検索
"" -------------------
"" 検索時に最後まで行ったら最初に戻る
"set wrapscan
"
""インデントはスマートインデント
"set smartindent
"
"" 検索時に大文字小文字を無視
"set ignorecase
"
"" 検索文字列に大文字が含まれている場合は区別して検索する(nosmartcase)
""set smartcase
"set nosmartcase
"
"" 全角スペースを視覚化
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
"au BufNewFile,BufRead * match ZenkakuSpace /　/
"
"" 行番号表示
"set number
"
"" 日付の入力補完
"inoremap <expr> ,df strftime('%Y-%m-%dT%H:%M:%S')
"inoremap <expr> ,dd strftime('%Y-%m-%d')
"inoremap <expr> ,dt strftime('%H:%M:%S')
"
"" 貼り付け
""nnoremap <C-S-v> "+p
"
"" バックアップファイルを作るディレクトリを設定
"set backup
"set backupdir=~/backup
""set nobackup
"
""ビジュアルモード時vで行末まで選択
"vnoremap v $h
"
"" スワップファイル
""set swapfile
"set noswapfile
"
"" スワップファイル用のディレクトリ
"set directory=~/swap
""
""タグファイル
"" ; を付けると、上の各階層も辿る
"set tags=./tags;
"
"" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
"" set wildmenu
"" コマンドライン補間をシェルっぽく
""set wildmode=list:longest
"set wildmode=longest:full,full
"
"" バッファが編集中でもその他のファイルを開けるように
"set hidden
"
"" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
"set autoread
"
""format.vimを使うための設定
"let format_join_spaces = 2
"let format_allow_over_tw = 0 
"
""対応するカッコの強調表示をやめる
"let loaded_matchparen = 1
"
""----------------------------------------------------------------------
""ステータスラインに文字コードと改行文字を表示する
"function! GetB()
"  let c = matchstr(getline('.'), '.', col('.') - 1)
"  let c = iconv(c, &enc, &fenc)
"  return String2Hex(c)
"endfunction
"
"" :help eval-examples
"" The function Nr2Hex() returns the Hex string of a number.
"func! Nr2Hex(nr)
"  let n = a:nr
"  let r = ""
"  while n
"    let r = '0123456789ABCDEF'[n % 16] . r
"    let n = n / 16
"  endwhile
"  return r
"endfunc
""
"" The function String2Hex() converts each character in a string to a two
"" character Hex string.
"func! String2Hex(str)
"  let out = ''
"  let ix = 0
"  while ix < strlen(a:str)
"    let out = out . Nr2Hex(char2nr(a:str[ix]))
"    let ix = ix + 1
"  endwhile
"  return out
"endfunc
"
""ステータスラインに文字コードと改行文字を表示する
"" set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P
"if winwidth(0) >= 120
"  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
"else
"  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
"endif
"
""set statusline=%{GetB()}
"
""Vim付属のエクスプローラ(:explore)で簡単にファイルを開くディレクトリを指定
""set browsedir=last	" 前回にファイルブラウザを使ったディレクト
"set browsedir=buffer	" バッファで開いているファイルのディレクトリ
""set browsedir=current	" カレントディレクトリ
""set browsedir={path}	" {path} で指定されたディレクトリ
""set browsedir=d:/dropbox/scripts
""----------------------------------------------------------------------
"
"" フルパスを指定せずに、ファイル名だけでファイルを開けるようにする
"let path+="~,d:/dropbox/scripts"
""let path += "~,d:/dropbox/scripts"
"
"" encoding
"nmap ,U :set encoding=utf-8<CR>
"nmap ,E :set encoding=euc-jp<CR>
"nmap ,S :set encoding=cp932<CR>
"
"" 端末の文字コード
"set encoding=cp932
""set encoding=utf-8
"
""  ファイルの文字コード
""set fileencoding=cp932
"set fileencoding=utf-8
"
"" 自動認識する文字コード.
"set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
"
"" タブ文字を強調.
""highlight tabs ctermbg=green guibg=green
""match tabs /\t/
"
""スクロールから下の行がわからないのは気に食わないぜ！
"set scrolloff=3
"
""勝手にカレントディレクトリを移動しちゃうぜ！
"au BufEnter Makefile,*.bat,*.c,*.h,*.pl,*.php,*.js,*.css,*.html,*.xml,*.xsl,*.sql,*.vim,*.rb,*.ahk,autohotkey.ini,*.ini execute ":lcd " . expand("%:p:h")
"
"" 前回終了したカーソル行に移動
"autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"
"" 改行コードの自動認識
"set fileformats=dos,unix,mac
"
""必要なタグファイルを指定すんだよ！
"" set tags
"" from id:secondlife
"if has("autochdir")
"  set autochdir
"  set tags=tags;
"else
"  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
"endif
"
"" -------------------
"" コマンドモードで、C-xとc-zで、編集中ファイルのパスを補完
"" -------------------
"" expand path
"cmap <c-x> <c-r>=expand('%:p:h')<cr>/
"" expand file (not ext)
"cmap <c-z> <c-r>=expand('%:p:r')<cr>
"
"" -------------------
"" キーバインド
"" -------------------
"" map = 全部
"" vmap = VISUAL モード
"
"" nmap = ノーマルモード
"nmap <c-j> <esc>
"
""Spaceでバッファ順次切り替え
"nmap <Space> :bn<CR>
"
""global mappingバッファ切り替え
""map <F2> <ESC>:bp<CR>
""map <F3> <ESC>:bn<CR>
""map <F4> <ESC>:bw<CR>
"
"" 挿入モードからESCで抜けたときに :w する
"imap <ESC> <ESC>:w<CR>
"
""挿入モードで移動
"inoremap <C-a> <Home>
"inoremap <C-e> <End>
"inoremap <C-f> <Right>
"inoremap <C-b> <Left>
"
"" 括弧を入力したら自動的に閉じ括弧を入力
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>
"
"" 閉じ括弧を自動補完
""inoremap ( ()i
""inoremap ) ClosePair(')')
""inoremap { {}i
""inoremap } ClosePair('}')
""inoremap [ []i
""inoremap ] ClosePair(']')
"
"" pair close checker.
"" from othree vimrc ( http://github.com/othree/rc/blob/master/osx/.vimrc )
""inoremap { {}<LEFT>
""inoremap [ []<LEFT>
""inoremap ( ()<LEFT>
""inoremap " ""<LEFT>
""inoremap ' ''<LEFT>
""vnoremap { "zdi^V{<C-R>z}<ESC>
""vnoremap [ "zdi^V[<C-R>z]<ESC>
""vnoremap ( "zdi^V(<C-R>z)<ESC>
""vnoremap " "zdi^V"<C-R>z^V"<ESC>
""vnoremap ' "zdi'<C-R>z'<ESC>
""function ClosePair(char)
""    if getline('.')[col('.') - 1] == a:char
""        return "\"
""    else
""        return a:char
""    endif
""endf
"
"" 特定のファイル保存前に、行末の空白を除去する
"function! RTrim()
"  let s:cursor = getpos(".")
"  %s/\s\+$//e
"  call setpos(".", s:cursor)
"endfunction
"
"autocmd BufWritePre *.php,*.rb,*.js,*.bat,*.py,.autotest,*.watchr,*.ahk call RTrim()
"
"" ====================================================================== 
"" Key map
"" ====================================================================== 
"" コマンドラインでのキーバインドを Emacs スタイルにする
"cnoremap <C-A> <Home>
"cnoremap <C-B> <Left>
"cnoremap <C-D> <Del>
"cnoremap <C-E> <End>
"cnoremap <C-F> <Right>
"cnoremap <C-N> <Down>
"cnoremap <C-P> <Up>
"cnoremap <Esc><C-B> <S-Left>
"cnoremap <Esc><C-F> <S-Right>
"
"" ---------------------------------------- 
"""" Filetype
"" ヘルプを引く関数
"function! Win32Help(fname, topic) 
""  let fname = 'C:\path\to\help\file.help' 
"  if fnamemodify(a:fname,":e")=="chm" 
"    silent! execute "!start hhh " . a:fname . " " .a:topic
"  elseif fnamemodify(a:fname,":e")=="hlp" 
"    silent! execute "!start winhlp32 -k " . a:topic . "  " . a:fname 
"  endif 
"endfunction 
"
"autocmd FileType vim set expandtab autoindent softtabstop=2 tabstop=2 shiftwidth=2
"
""" FileType:autohotkey
"
"" taglist.vim - for autohotkey support
"autocmd FileType autohotkey let s:tlist_def_autohotkey_settings = 'autohotkey;l:label;f:function;v:variable;n:note;t:todo;h:hotkey'
"" tab
"autocmd FileType autohotkey set expandtab autoindent softtabstop=2 tabstop=2 shiftwidth=2
"" dictionary
"autocmd FileType autohotkey set dictionary+=~/.vim/dict/autohotkey.dic
"" template
"autocmd BufNewFile *.ahk	0r ~/.vim/templates/template.ahk
"" show help
""autocmd FileType autohotkey nmap <S-F1> :call Win32Help('D:\Dropbox\bin\AutoHotkeyJP.chm',expand('<cword>'))<CR>
"autocmd FileType autohotkey nmap <F1> :call Win32Help('D:\Dropbox\bin\AutoHotkeyJP.chm',expand('<cword>'))<CR>
"
""" FileType:Ruby
"
"autocmd BufWinEnter,BufNewFile *.watchr,.autotest set filetype=ruby
"
"autocmd FileType ruby set expandtab autoindent softtabstop=2 tabstop=2 shiftwidth=2
""autocmd FileType ruby source $VIMRUNTIME/ftplugin/ruby.vim 
""autocmd FileType ruby source $VIMRUNTIME/plugin/refe.vim 
"autocmd BufNewFile *.rb	0r ~/.vim/templates/template.rb
""
"" f5で、rubyファイルを実行。"
"autocmd FileType ruby nmap <F5> :make -c %<CR>
"
"" HTMLヘルプを表示
""autocmd FileType ruby nmap <S-F1> :call Win32Help('D:\Dropbox\bin\rubymanjp.chm',expand('<cword>'))<CR>
"autocmd FileType ruby nmap <F1> :call Win32Help('D:\Dropbox\bin\rubymanjp.chm',expand('<cword>'))<CR>
""nmap <S-F1> :call Win32Help(expand('<cword>'))<CR>
"
"" ---------------------------------------- 
"""" plugins
"
"" ---------------------------------------- 
"""" neocomplcache.vim
"
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"      \ 'default' : '',
"      \ 'autohotkey' : $HOME.'/.vim/dict/autohotkey.dic',
"      \ 'vimshell' : $HOME.'/.vimshell_hist',
"      \ 'scheme' : $HOME.'/.gosh_completions'
"      \ }
"
"" Define keyword.
"let g:neocomplcache_keyword_patterns = get(g:, 'neocomplecache_keyword_patterns', {})
""if !exists('g:neocomplcache_keyword_patterns')
""        let g:neocomplcache_keyword_patterns = {}
""endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
""imap <C-k>     <Plug>(neocomplcache_start_unite_complete)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"" SuperTab like snippets behavior.
""imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
"" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
"set completeopt+=menu,preview
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"
"" Enable heavy omni completion.
"let g:neocomplcache_omni_patterns = get(g:, 'neocomplcache_omni_patterns', {})
""if !exists('g:neocomplcache_omni_patterns')
""        let g:neocomplcache_omni_patterns = {}
""endif
"
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"
"" Snippets
"let g:neocomplcache_snippets_dir = '~/.vim/snippets'
"
"" 補完候補の数
"let g:neocomplcache_max_list = 20
"
"" 1番目の候補を自動選択
"let g:neocomplcache_enable_auto_select = 1
"
""遅延補完
"let g:NeoComplCache_EnableCursorHoldI = 1 
"
""""
"""" unite.vim - ブックマーク、ファイル、履歴 等へのクイックアクセス
""""
"
"" 入力モードで開始する
""let g:unite_enable_start_insert=1
"
"nnoremap   [unite]   <Nop>
"nmap    ,u [unite]
"
"nnoremap <silent> [unite]f  :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
""nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
""nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
"nnoremap <silent> [unite]r  :<C-u>Unite ref/refe<CR>
"nnoremap <silent> [unite]a  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
""nnoremap <silent> [unite]u  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
"nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
"nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
"nnoremap <silent> [unite]p  :<C-u>Unite phrase<CR>
"nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
"nnoremap <silent> [unite]s  :<C-u>Unite source<CR>
"nnoremap <silent> [unite]l  :<C-u>Unite line<CR>
"nnoremap <silent> [unite]g  :<C-u>Unite grep<CR>
"nnoremap <silent> [unite]e  :<C-u>Unite everything<CR>
"
"" todo: こんな感じでファイルタイプごとに、設定をまとめましょう"
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()"{{{
"  " Overwrite settings.
"
"  " ウィンドウを分割して開く
"  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"  " ウィンドウを縦に分割して開く
"  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"  " ESCキーを2回押すと終了する
"  nnoremap <silent> <buffer> <ESC><ESC> q
"  inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"
"  "  nmap <buffer> <ESC>      <Plug>(unite_exit)
"  imap <buffer> jj      <Plug>(unite_insert_leave)
"  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"
"  " <C-l>: manual neocomplcache completion.
"  inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>
"
"  " Start insert.
"  let g:unite_enable_start_insert = 1
"endfunction"}}}
"
"let g:unite_source_file_mru_limit = 200
"let g:unite_cursor_line_highlight = 'TabLineSel'
"let g:unite_abbr_highlight = 'TabLine'
"
"" For optimize.
"let g:unite_source_file_mru_filename_format = ''
"
""""
"""" autodate.vim - ファイルのタイムスタンプ記述を自動的に更新
""""
"let autodate_keyword_pre="Last Change: \*"
"let autodate_keyword_post="."
"let autodate_format="%Y/%m/%d %H:%M:%S"
"let autodate_lines=10
"
""""
"""" monday.vim
""""
""CTRL-A で8進数の計算をさせない
"set nrformats-=octal
"
"""" quickrun.vim
"
"" コンフィグを全クリア
"let g:quickrun_config = {}
"
"" 横分割をするようにする
"let g:quickrun_config['*'] = {'split': ''}
"
"" RSpec 対応
"let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
"
"augroup RSpec
"  autocmd!
"  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
"augroup END
"
"" :QuickRun -outputter my_outputter
"" プロセスの実行中は、buffer に出力し、
"" プロセスが終了したら、quickfix へ出力を行う
"" http://d.hatena.ne.jp/osyo-manga/20110729/1311934261
"" http://d.hatena.ne.jp/osyo-manga/20110921/1316605254
"
"" 既存の outputter をコピーして拡張
"let my_outputter = quickrun#outputter#multi#new()
"let my_outputter.config.targets = ["buffer", "quickfix"]
"
"function! my_outputter.init(session)
"  " quickfix を閉じる
"  :cclose
"  " 元の処理を呼び出す
"  call call(quickrun#outputter#multi#new().init, [a:session], self)
"endfunction
"
"function! my_outputter.finish(session)
"  call call(quickrun#outputter#multi#new().finish, [a:session], self)
"  " 出力バッファの削除
"  bwipeout [quickrun
"  " vim-hier を使用している場合は、ハイライトを更新
"  :HierUpdate
"  " quickfix への出力後に quickfixstatus を有効に
"  :QuickfixStatusEnable
"endfunction
"
"" quickrun に outputter を登録
"call quickrun#register_outputter("my_outputter", my_outputter)
"
"" <leader>r を再定義
"nmap <silent> <leader>r :QuickRun -outputter my_outputter<CR>
"
"" ---------------------------------------- 
"""" savevers.vim --- ファイルの保存履歴
"
""savevers.vimを動作させるためパッチモードへ移行(savevers.vim)
"set patchmode=.clean
""バージョン管理ファイルを保存するディレクトリ
""let savevers_dirs = &backupdir
""let savevers_dirs = ~/backup
"let savevers_dirs = "~/backup"
"" バージョン管理対象のファイル
"let savevers_types = "*.rb,*.ahk,*.ini,*.txt,_*vimrc"
""パッチモードでバージョン管理する最大数(なぜか反映されず)
"let savevers_max = 300
"":Purgeでカレントファイルの全てのバックアップを削除
"let savevers_purge = 0
""Diff表示の際にウィンドウをリサイズしない
"let versdiff_no_resize = 1
""ひとつ前のバックアップと比較
"nmap <silent> <F7> :VersDiff -<CR>
""ひとつ後のバックアップと比較
"nmap <silent> <F8> :VersDiff +<CR>
""VersDiffから抜ける
"nmap <silent> <S-F7> :VersDiff -c<CR>
"nmap <silent> <S-F8> :VersDiff -c<CR>
"
"" ---------------------------------------- 
"""" trinity.vim --- NERD_tree, taglist, srcexpl の統合
"
"" Open and close the taglist.vim separately 
"nmap <F9>  :TrinityToggleTagList<CR> 
"" Open and close the NERD_tree.vim separately 
"nmap <F10>  :TrinityToggleNERDTree<CR>
"" Open and close the srcexpl.vim separately 
"nmap <F11>   :TrinityToggleSourceExplorer<CR> 
"" Open and close all the three plugins on the same time 
"nmap <F12>   :TrinityToggleAll<CR> 
"
"" ---------------------------------------- 
"""" srcexpl --- source explorer
"
"" // The switch of the Source Explorer 
""nmap <F8> :SrcExplToggle<CR> 
"
"" // Set the height of Source Explorer window 
"let g:SrcExpl_winHeight = 8 
"
"" // Set time for refreshing the Source Explorer 
"let g:SrcExpl_refreshTime = 1000 
"
"" // Set key to jump into the exact definition context 
"let g:SrcExpl_jumpKey = "<ENTER>" 
"
"" // Set key for back from the definition context 
"let g:SrcExpl_gobackKey = "<BS>" 
"
"" // In order to Avoid conflicts, the Source Explorer should know what plugins 
"" // are using buffers. And you need add their bufname into the list below 
"" // according to the command ":buffers!" 
"let g:SrcExpl_pluginList = [ 
"      \ "__Tag_List__", 
"      \ "_NERD_tree_", 
"      \ "Source_Explorer" 
"      \ ] 
"
"" // Enable/Disable the local definition searching, and note that this is not 
"" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
"" // It only searches for a match with the keyword according to command 'gd' 
"let g:SrcExpl_searchLocalDef = 1 
"
"" // Do not let the Source Explorer update the tags file when opening 
""let g:SrcExpl_isUpdateTags = 0 
"
"" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
"" //  create/update a tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
"
"" // key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<S-F12>" 
"
""""  Utl.vim
"nnoremap <silent> gx :silent exe 'Utl'<cr><cr>
"
"" ---------------------------------------- 
"""" gist.vim
""nnoremap <silent> ,gn :Gist<cr>
""nnoremap <silent> ,gl :Gist -l<cr>
""nnoremap <silent> ,ga :Gist -a<cr>
""nnoremap <silent> ,ge :Gist -e<cr>
""nnoremap <silent> ,gp :Gist -p<cr>
""nnoremap <silent> ,gr :Gist
""nnoremap <silent> ,gu :Gist -l
"
"" ---------------------------------------- 
"""" smartchr.vim --- キーを押す回数で挿入文字が変わる
"" todo: 言語によって、文字パターンが変わるようにして
""inoremap <expr> = smartchr#loop(' = ', ' == ', ' =~ ', ' => ', '=')
""inoremap <expr> - smartchr#loop(' -', ' - ', ' -= ', '-')
""inoremap <expr> + smartchr#loop(' + ', ' += ', '+')
""inoremap <expr> ; smartchr#loop(';', '; ------------------------------------------------')
"inoremap <expr> , smartchr#loop(', ', ', , ', ',')
""inoremap <expr> . smartchr#loop('.', '<%=  %>', '<%  %>')
"
""for smart char
""inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')
"
"" 演算子の間に空白を入れる
""inoremap <buffer><expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', ' << ', '<')
""inoremap <buffer><expr> > search('^#include <.*\%#', 'bcn')? '>': smartchr#one_of(' > ', ' >> ', '>')
""inoremap <buffer><expr> + smartchr#one_of(' + ', '++', '+')
""inoremap <buffer><expr> - smartchr#one_of(' - ', '--', '-')
""inoremap <buffer><expr> / smartchr#one_of(' / ', '// ', '/')
"" *はポインタで使うので、空白はいれない
""inoremap <buffer><expr> & smartchr#one_of(' & ', ' && ', '&')
""inoremap <buffer><expr> % smartchr#one_of(' % ', '%')
""inoremap <buffer><expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
""inoremap <buffer><expr> , smartchr#one_of(', ', ',')
"" 3項演算子の場合は、後ろのみ空白を入れる
""inoremap <buffer><expr> ? smartchr#one_of('? ', '?')
""inoremap <buffer><expr> : smartchr#one_of(': ', '::', ':')
"
"" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
"" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
"inoremap <expr> = search('\(&\<Bar><Bar>\<Bar>+\<Bar>-\<Bar>/\<Bar>>\<Bar><\) \%#', 'bcn')? '<bs>= '
"    \ : search('\(*\<Bar>!\)\%#', 'bcn') ? '= '
"    \ : smartchr#one_of(' = ', ' == ', '=')
"
"" ---------------------------------------- 
"""" vim-ref.vim
"" HTMLのテキストへのコンバートに、lynx を使う
"let g:ref_alc_cmd='lynx -dump -nonumbers %s'
"let g:ref_alc_use_cache = 1
"let g:ref_alc_start_linenumber = 39 " 余計な行を読み飛ばす
"let g:ref_alc_encoding = 'UTF-8'    " イマイチよく分かってない
"let g:ref_use_vimproc = 1           " vimproc を使用する
"let g:ref_cache_dir = '~/.vim/cache'   " ローカルにキャッシュ
"if exists('*ref#register_detection')
"  " filetypeが分からんならalc
"  call ref#register_detection('_', 'alc')
"endif
"
"" カーソル位置の単語を翻訳
"nmap ,ra :<C-u>Ref alc <C-r><C-w><CR>
"
"" ---------------------------------------- 
"" QuickJUnitのvim版が見当たらなかったので、それ風に作ってみた
"" http://prepro.wordpress.com/2011/11/06/quickjunit%E3%81%AEvim%E7%89%88%E3%81%8C%E8%A6%8B%E5%BD%93%E3%81%9F%E3%82%89%E3%81%AA%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%82%8C%E9%A2%A8%E3%81%AB%E4%BD%9C%E3%81%A3/
"function! QuickChange()
"  let file_rh = expand("%:t:r")
"  let index = matchend(file_rh, "_test")
"  let file_h = expand("%:p:h")
"
"  if index == -1 || index != strlen(file_rh)
"    " main => test
"    execute "args" file_h . "/test/" . file_rh . "_test." . expand("%:e")
"  else
"    " test => main
"    execute "args" file_h . "/../" . expand("%:s?_test??")
"  endif
"endfunction
"
"" KeyMap
""map <C-T> :call QuickChange()<CR>
"
"" ---------------------------------------- 
"""" vim-altr - ワンタッチで、関連ファイルを順番に切り替え
"nmap <F3> <Plug>(altr-forward)
"nmap <F2> <Plug>(altr-back)
"
"" For ruby tdd
"call altr#define('%.rb', 'spec/%_spec.rb')
"" For rails tdd
"call altr#define('app/models/%.rb', 'spec/models/%_spec.rb', 'spec/factories/%s.rb')
"call altr#define('app/controllers/%.rb', 'spec/controllers/%_spec.rb')
"call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')
"
"
