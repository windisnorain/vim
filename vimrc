"====================================
"============  基本设置  ============
"====================================


"============  文件设置  ============

set history=100             	"历史记录数
set nobackup                	"从不备份
set noswapfile              	"不产生交换文件
set autoread 		" 设置当文件被改动时自动载入
set autowrite 		"自动保存
set clipboard=unnamed  	"共享剪贴板 
set nocompatible 		"不要使用vi的键盘模式，而是vim自己的
set wildmenu   		" 增强模式中的命令行自动完成操作
set confirm 		"在处理未保存或只读文件的时候，弹出确认
set autochdir 		"自动切换当前目录为当前文件所在的目录
set viminfo+=!    		" 保存全局变量
set report=0  		"通过使用: commands命令，告诉我们文件的哪一行被改变过
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>     "quickfix模式

"============  显示设置  ============

set linespace=0   		"字符间插入的像素行数目
set iskeyword+=_,$,@,%,#,-  	"带有右侧符号的单词不要被换行分割
set noeb 			"去掉输入错误的提示声音
syntax on 			"自动语法高亮
"winpos 5 5          		"设定窗口位置  
"set lines=40 columns=155       "设定窗口大小
set ruler          	 	"显示标尺   
set nu              		"显示行号  
set relativenumber 	    	"显示相对行号
set cursorline              	"突出显示当前行
set magic                   	"设置魔术
set gdefault   			"行内替换
"set novisualbell    		"光标不要闪烁
set showmatch    		"高亮显示匹配的括号
set matchtime=1   		"匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3   		"光标移动到buffer的顶部和底部时保持3行距离
set guioptions-=T 		"隐藏工具栏
set guioptions-=m		"隐藏菜单栏
"set go=             		"不要图形按钮  
"set guifont=Courier_New:h10:cANSI   "设置字体  
"autocmd InsertLeave * se nocul      "用浅色高亮当前行  
"autocmd InsertEnter * se cul       "用浅色高亮当前行  
set showcmd        	 	"右下角显示输入的命令  
"set cmdheight=2    		"命令行（在状态行下）的高度，默认为1，设置为2    
set laststatus=2   		"启动显示状态行(1),总是显示状态行(2)

"状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] 

"============  缩进设置  ============

set autoindent   	"自动缩进
set cindent
set softtabstop=8   	"使得按退格键时可以一次删掉 4 个空格
set shiftwidth=8  	"设定 << 和 >> 命令移动时的宽度为 4
set smartindent  	"为C程序提供自动缩进
set backspace=indent,eol,start  " 不设定在插入状态无法用退格键和 Delete键删除回车符
set tabstop=8 		"Tab键的宽度
set noexpandtab 	"不要用空格代替制表符
set smarttab  		"在行和段开始处使用制表符

"============  折叠设置  ============

set foldcolumn=0   	"设置折叠区域的宽度
set foldmethod=indent 
set foldlevel=3   	"设置折叠层数为
set foldenable      	"允许折叠  
set foldmethod=manual   "手动折叠 
set foldmethod=syntax   "设置语法折叠
 
"============  语言配色  ============

"显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"主体配色
"colorscheme murphy 	"设置配色主题
"set background=dark 	"背景使用黑色

"============  搜索设置  ============

set ignorecase 		 "搜索忽略大小写
set ignorecase smartcase "搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hlsearch		 "搜索逐字符高亮
set incsearch  		 "输入搜索内容时就显示搜索结果
set nowrapscan 		 "禁止在搜索到文件两端时重新搜索

"============  鼠标功能  ============

"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

"============  映射补全  ============

set completeopt=longest,menu "自动补全命令
set showfulltag "补全函数时，自动补全参数

"键盘映射

:inoremap <c-l> <Right>
:inoremap <c-k> <Left>
:nnoremap <leader>n :NERDTree<CR>
:nnoremap <leader>t :vert terminal<CR>

"自动补全配对符号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap { {}<ESC>i<CR><ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	 if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
 	else
 		return a:char
 	endif
endfunction

"====================================
"============  插件管理  ============
"====================================

call plug#begin('~/.vim/plugged')

"============  nerdtree  ============

Plug 'preservim/nerdtree'
""open nerdtree when vim is open
" autocmd VimEnter * NERDTree | wincmd p
""Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"==========  clangformat  ===========

Plug 'rhysd/vim-clang-format'
"coding style options, code_style is a base style, LLVM, Google, Chromium, Mozilla, Webkit, Microsoft is supported. default value is google.
" let g:clang_format#code_style="mozilla"
"value is 1, vim-clang-format automatically detects the style file like .clang-format and applies the style to formatting
let g:clang_format#detect_style_file =1
let g:clang_format#auto_format=1
"value 1 means 插入的行自动格式化在退出插入模式时"
" let g:clang_format#auto_format_on_insert_leave=1
""对于c类型文件自动格式化启用
autocmd FileType c ClangFormatAutoEnable

"=========  nerdcommenter  ==========

Plug 'scrooloose/nerdcommenter'
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"============  others  =============

""Plug 'vim-airline/vim-airline'
""Plug 'vim-airline/vim-airline-themes'
""Plug 'valloric/youcompleteme'

call plug#end()
