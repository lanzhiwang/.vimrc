"============================================================================
"
"			读取其他配置文件
"
"============================================================================
" 所有插件都在.vimrc.bundles文件中管理,如果存在则读取
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" 所有插件相关的配置都在.vimrc.bundles_settings文件中设置,如果存在则读取
if filereadable(expand("~/.vimrc.bundles_settings"))
    source ~/.vimrc.bundles_settings
endif

" 所有键位绑定都在.vimrc.keys文件中设置
if filereadable(expand("~/.vimrc.keys"))
    source ~/.vimrc.keys
endif

"============================================================================
"
"			VIM基本配置(无关插件)
"
"============================================================================
" 关闭vi兼容模式
set nocompatible 
"解决退格键不能删除字符问题
set backspace=indent,eol,start

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on

" 启动自动补全,如果使用plug插件管理器,这个可以不要,因为plug自动执行了下面设置
filetype plugin indent on
"
" 开启语法高亮,同样使用plug插件管理器,可以不用这个
syntax on
"
" history存储容量(在命令模式下":history"可以查看命令历史记录)
set history=2000

" 文件修改之后自动载入
set autoread
" 在使用vim直接启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 关闭交换文件(用vim打开多个相同文件时候会提示交换文件,很烦，禁用掉这个功能)
set noswapfile

" 突出显示当前列(在光标所在列出现一个竖条)
set cursorcolumn
" 突出显示当前行(在光标所在行出现一个横条)
set cursorline

" 平常退出vim的时候内容也不见了,很不方便,此设置在退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" 在右下角显示当前的行号列号
set ruler
" 在vim左侧显示行号
set number
" 在状态栏右下角显示正在输入的命令(比如h,j,k,l)
set showcmd
" 左下角显示当前vim模式
set showmode

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" 一直显示状态栏,并且高度为2
set laststatus=2

" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8
" 设置unix为标准文件类型
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 代码折叠方式为indent
set foldmethod=indent

" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# -*- coding: utf-8 -*-")
        " call append(1, "\# encoding: utf-8")
        " call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

" 定义UnrolAll函数实现自动折叠/打开折叠
let $unrol=0 
function UnrolAll() 
if $unrol==0 
    :exe "normal zR" 
    let $unrol=1 
else 
    :exe "normal zM" 
    let $unrol=0 
endif 
endfunction 

" 定义UnrolMe函数实现自动折叠/打开折叠
let $unrolme=0 
function UnrolMe() 
if $unrolme==0 
    :exe "normal za" 
    let $unrolme=1 
else 
    :exe "normal za" 
    let $unrolme=0 
endif 
endfunction 
"支持python的虚拟环境
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
  "project_base_dir = os.environ['VIRTUAL_ENV']
  "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  "execfile(activate_this, dict(__file__=activate_this))
"EOF
