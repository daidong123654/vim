set nocompatible
filetype off
"自定义删除空白行命令
command Nobl g/^\s*$/d

set backspace=indent,eol,start

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'endel/flashdevelop.vim'
Plugin 'airblade/vim-rooter'
Plugin 'tomtom/tlib_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/necomplcache.vim'
Plugin 'goatslacker/mango.vim'
Plugin 'myhere/vim-nodejs-complete'

call vundle#end()

filetype plugin indent on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"vundle end

set term=xterm-256color
"set term=xterm
set t_Co=128
syntax enable
"终端模式:xterm-256color,这个终端模式支持功能键Home,End等

""""""""""""""""""""""""""""""""""""""
let g:solarized_termcolors=256  " 一定要这行在colorscheme solarized 之前
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"背景:暗色
set background=dark
colorscheme solarized
"colorscheme desert
syntax on

"if has('gui_running')
	"set background=light
"else
	"set background=dark
"endif

"set term=xterm-xfree86

"vim-powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2
let g:Powerline_colorscheme='solarized256'

set nocp
set ru
set hls
set is
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ambiwidth=double
set sw=4
set ts=4
set et
set smarttab
set spell
set lbr
set fo+=mB
set sm
set cin
set cino=:0g0t0(sus
set nocompatible
set ai
set si
set wildmenu
set nowrap
set mousemodel=popup
set guioptions+=b

set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
set nu
set history=700
filetype on
filetype plugin on
filetype indent on
"vim-javascript indent
"html indent
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html, body, head, tbody"
""""""""""""""""
set foldenable
set foldmethod=manual
"set completeopt=preview,menu
set clipboard+=unnamed
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set ignorecase
set hlsearch 
set incsearch
set gdefault
let b:javascript_fold=1
let javascript_enable_domhtmlcss=1
set guioptions-=T
set guioptions-=m
set smartindent
set foldenable
set foldmethod=syntax
set foldcolumn=0
function MySys()
	if has("win16") || has("win32") || has("win64") || has("win95")
		return "windows"
	elseif has("unix")
		return "linux"
	endif
endfunction
if MySys() == "linux"
	let $VIMFILES = $HOME.'/.vim'
endif
let helptags=$VIMFILES.'/doc'
"let Tlist_Auto_Open=1
"let Tlist_Show_Menu=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
"set mouse=a
set noeb
set shortmess=atl
"nnoremap <F2> :WMToggle <CR>
nnoremap <F2> :NERDTreeToggle <CR>
"let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=20
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
"打开文件时关闭树
"let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeShowBookMarks=1
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='NERDTree'
set tags=~/.vim/tags
nmap wm :WMToggle<CR>
set fdm=syntax
autocmd BufEnter * lcd %:p:h
map <c-W><c-f> :FirstExplorerWindow<CR>
map <c-W><c-b> :BottomExplorerWindow<CR>
map <c-W><c-t> :WMToggle<CR>
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
	set dictionary-=~/.vim/funclist.txt dictionary+=~/.vim/funclist.txt
	set complete-=k complete+=k
endfunction
"jQuery语法高亮
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"javascript语法高亮
let b:javascript_fold=1
let javaxsript_enable_domhtmlcss=1
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
au BufRead,BufNewFile *.as set ft=actionscript
autocmd FileType actionscript set dictionary=~/.vim/dict/actionscript.dict
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
"zencoding配置
let g:user_zen_settings = { 
\  'indentation' : '  ', 
\  'perl' : { 
\    'aliases' : { 
\      'req' : 'require ' 
\    }, 
\    'snippets' : { 
\      'use' : "use strict\nuse warnings\n\n", 
\      'warn' : "warn \"|\";", 
\    } 
\  } 
\} 
let g:user_zen_expandabbr_key = '<c-e>' 
let g:user_zen_complete_tag = 1
"function for CI in php
set dictionary-=~/.vim/CI_funclist.txt dictionary+=~/.vim/CI_funclist.txt
au FileType php call AddCIFuncList()
function AddCIFuncList()
	set dictionary-=~/.vim/CI_funclist.txt dictionary+=~/.vim/CI_funclist.txt
	set complete-=k complete+=k
endfunction
"PHP syntax check
map <C-J> :!php -l %<CR>
"混合型文件中的自动缩进解决办法
nnoremap <leader>h :set filetype=html<CR>
nnoremap <leader>c :set filetype=css<CR>
nnoremap <leader>j :set filetype=javascript<CR>
nnoremap <leader>p :set filetype=php<CR>
nnoremap <leader>a :set filetype=actionscript<CR>
"
"使vim在终端保持透明
hi Normal ctermbg=NONE

" ------------------ gui --------------------------------------------{{{1

set guioptions-=T           " gvim隐藏工具栏
set guioptions-=m           " gvim隐藏菜单栏
"设置gvim的字体
set guifont=Inconsolata\ 13

"--------------------------------------------------------------------1}}}

"设置自动换行
"set tw=80
"set fo+=m

"---------------for markdown----------------
let g:vim_markdown_folding_disabled=1

"自动补全提示
set ofu=syntaxcomplete#Complete
autocmd FileType actionscript set omnifunc=actionscriptcomplete#CompleteAS

"vim粘贴板
let mapleader=","
let g:mapleader=","

let g:NeoComplCache_enable_at_startup = 1

let g:NeoComplCache_DisableAutoComplete = 0


set complete-=k complete+=k

" 自动刷新文件内容; 手动刷新命令：e!
set autoread
" 进行tab切换时，自动保存当前文件
set autowriteall
" 注释自动加上*号和空格
set formatoptions=tcqro

"node-js auto complete
let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}

"javascript syntax
"color mango
"colo torte
" 设置不让vim自动备份
set nobackup
" 关闭提示
set noeb
"set vb
"自动注释
"SET Comment START
autocmd BufNewFile *.php,*.js,*.cpp,*.c,*.py exec ":call SetComment()" |normal 10Go
func SetComment()
    if expand("%:e") == 'php'
        call setline(1, "<?php")
        call AddComment()
    elseif expand("%:e") == 'js'
        call setline(1, '//JavaScript file')
        call AddComment()
    elseif expand("%:e") == 'cpp'
        call setline(1, '//C++ file')
        call AddComment()
    elseif expand("%:e") == 'c'
        call setline(1,'//C file')
        call AddComment()
    elseif expand("%:e") == 'py'
        call setline(1,'#Python file')
        call AddComment()
    endif
"    call append(10, '')
endfunc

func AddComment()
    call append(1, '/**************************************************')
    call append(2, ' *    Filename:      '.expand("%"))
    call append(3, ' *    Copyright:     (C) '.strftime("%Y").' All rights reserved')
    call append(4, ' *    Author:        Theast')
    call append(5, ' *    Email:         Daidong123654@126.com')
    call append(6, ' *    Description:   ---')
    call append(7, ' *    Create:        '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(8, ' *    Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    call append(9,' *************************************************/ ')
endfunc

"每次按下F2也会插入头部文件
map <F2> :call SetComment()<CR>:10<CR>o
"SET Comment    END
"自动修改最后修改时间
"SET Last Modified Time START
func DataInsert()
    call cursor(13,1)
    if search ('Last Modified') != 0
        let line = line('.')
        call setline(line, ' *    Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
    endif
endfunc
autocmd FileWritePre,BufWritePre *.php,*.js,*.cpp,*.c,*.py ks|call DataInsert() |'s
"SET Last Modified Time END
"
execute pathogen#infect()
syntax on
filetype plugin indent on
