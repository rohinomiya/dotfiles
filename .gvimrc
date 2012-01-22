" rohinomiyaの個人設定

" カラー設定:
"colorscheme blackdust
colorscheme Lucius

" 日本語入力中にカーソルの色を変更する
if has('multi_byte_ime') || has('xim')
    " 日本語入力ON時のカーソルの色を設定
    highlight CursorIM guibg=Red guifg=NONE
endif

"ツールバーを非表示に
set guioptions-=T

" 文字を選択したら、クリップボードにコピーする
set guioptions+=a

"フォント設定
"set guifont=MS_Gothic:h10:cSHIFTJIS
"set guifont=Ricty:h14
"set guifont=MeiryoKe_Console:h12

" ウインドウの幅
set columns=120

" ウインドウの高さ
set lines=40

" コマンドラインの高さ
"set cmdheight=1

" 半透明にする
"gui
"set transparency=220


