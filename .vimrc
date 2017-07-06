set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'https://github.com/Lokaltog/vim-powerline.git'  "底部状态栏
Plugin 'https://github.com/tpope/vim-surround.git' "快速更换标签
Plugin 'scrooloose/nerdtree'  "nerdtree文件列表
Plugin 'jistr/vim-nerdtree-tabs'  "多文件共享nerdtree
Plugin 'mattn/emmet-vim'  "前端速写
Plugin 'Xuyuanp/nerdtree-git-plugin' "nerdtree git  
Plugin 'lilydjwg/colorizer' "颜色显示
Plugin 'scrooloose/syntastic' "代码检测
Plugin 'flazz/vim-colorschemes' "颜色主题
Plugin 'majutsushi/tagbar' "结构列表 note:需要安装ctags
Plugin 'kshenoy/vim-signature' "显示标记


filetype plugin indent on
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"nerdtree
"F2显示nerdtree
map <silent> <F1> :NERDTreeToggle<CR>
"F8显示tagbar
"基本常用快捷键如下：
"切换到tagbar:ctrl+ww
"折叠:za
"跳转并停留在tagbar窗口:p
"跳转并进入代码模式：enter
"退出：q
map <silent> <F8> :TagbarToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
"设置nerdtree-git样式
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"前端速写
let g:user_emmet_expandabbr_key = '<C-y>'
"vim-powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf-8
set fileencoding=utf-8
"当前行突出显示
set cursorline
highlight CursorLine cterm=bold ctermbg=black  ctermfg=White guibg=black guifg=White
"当前列突出显示
set cursorcolumn
"显示相对行号
set relativenumber number
"语法高亮
syntax on
"颜色主题
colorscheme molokai
"设置字体
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10   "vim字体是受限于终端字体的，所以这个没作用
"显示命令行
set showcmd
set cmdheight=1
set showmode
"缩进设置
set autoindent 
set expandtab
set sw=4
set tabstop=4
set softtabstop=4
"折叠
set foldmethod=indent  "根据缩进折叠
"禁止生成临时文件
set nobackup
set noswapfile 
"键位映射
imap kk <esc>
nnoremap <space> za
map <F5> :call CompileRunGcc()<CR>
"花括号自动补全
imap { {}<ESC>i
imap {<CR> {<CR>}<ESC>O
"中括号自动补全
imap [ []<ESC>i
imap [<CR> [<CR>]<ESC>O
"小括号自动补全
imap ( ()<ESC>i
imap (<CR> (<CR>)<ESC>O






"一键编译
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time sh %
    elseif &filetype == 'python'
        exec "!time python %"
    endif
endfunc
