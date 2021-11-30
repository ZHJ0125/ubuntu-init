" ~/.vimrc

syntax on            " 打开高亮
set number           " 打开行号
set cursorline       " 光标所在行高亮
set showcmd          " 在底部显示键入的指令
set wildmenu         " 命令模式用 Tab 自动补全
set hlsearch         " 高亮搜索匹配结果
set incsearch        " 边输入边高亮
set ignorecase       " 忽略大小写
set smartcase        " 只能大小写（其实就是只对第一个字母大写的搜索词大小写敏感）
set autoindent       " 自动缩进，回车后下一行的缩进与上一行的缩进保持一致
set smartindent      " 智能缩进
set tabstop=4        " 一个 Tab 缩进 4 个字符
set shiftwidth=4     " 增加或取消一级缩进时的字符数，建议与缩进保持一致
set expandtab        " 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set smarttab         " 智能缩进，根据文件其他地方的缩进来确定一个 Tab 多少缩进
set softtabstop=4    " Tab 转换为 4 个空格
"set mouse=a         " 支持鼠标
"set ruler           " 状态栏现实光标当前位置
set encoding=UTF-8   " 设置 utf-8 编码
set laststatus=2     " 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
