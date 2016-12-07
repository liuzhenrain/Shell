" 开启语法高亮
syntax on
" 开启自动语法高亮
syntax enable
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 设置c语言自动缩进
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s;:1s
" 设置行号
set nu
" 开启实时搜索功能
set incsearch
" 关闭大小写敏感
set ignorecase
" vim 自身命令行模式只能补全
set wildmenu
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 开启文件类型侦测
filetype on
" 自适应不同语言的只能缩进
filetype indent on
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮当前行
set cursorline
" 高亮搜索结果
set hlsearch
" 中文设置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312
set encoding=utf-8
set termencoding=utf-8
