" c w 删除一个单词并进入写入模式
" c i " 删除双引号之间的文本 并进入写入模式
" d i " 删除双引号之间的文本 不进入写入模式
" f w 寻找最近的w
" c f " 改变当前位置到w之间的内容
" d f " 删除当前位置到w之间的内容
" this vim editor: hello world

set number "显示行号
"set nonu "取消显示行号
"
set relativenumber "相对行号
"set norelativenumber "取消相对行号

set wrap "显示不会出当前界面
set showcmd "显示cmd
set ruler
set nocompatible  "关闭vi的兼容模式
set cursorline "显示线条
set wildmenu "vim自身命令行模式智能补全
set mouse=a "可以使用鼠标
"set scrolloff=5 "保证光标下面永远显示5行

set hlsearch "设置搜索高亮
"第一次进入关闭高亮
exec "nohlsearch"
set incsearch "开启实时搜索
set ignorecase "忽略大小写
set smartcase "智能大小写
"set list "显示行尾空格
filetype on " 开启文件类型侦测
filetype plugin on " 根据侦测到的不同类型加载对应的插件
filetype indent on "自适应不同语言的智能缩进
filetype plugin indent on "自适应不同语言的智能缩进
set encoding=utf-8
"set ignorecase "搜索时大小写不敏感
"syntax enable "开启语法高亮功能
"syntax on  "允许使用指定语法高亮配色方案代替默认方案
" 禁用backspace/delete按键
" set backspace=0
nnoremap <backspace> <nop>
inoremap <backspace> <nop>

set expandtab "将制表符扩展为空格
set tabstop=4 "设置编辑时制表符所占空格数
set shiftwidth=4 "设置格式化时制表符所占空格数
set softtabstop=4 "让vim吧连续数量的空格视为一个制表符
set foldmethod=indent "代码块收起
set foldlevel=99
" 改变光标在不同模式下的显示
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "再次打开文件时光标默认回到上次的位置

let g:mapleader=" "
noremap <LEADER><CR> :nohlsearch<CR> "取消搜索高亮显示
noremap n nzz "搜索下一条到中心
noremap N Nzz "搜索下一条到中心

let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_enabled = 1

let g:autopep8_disable_show_diff = 1

"取消s映射
map s <nop>
"大写S保存
map S :w<CR>
"大写Q退出
map Q :q<CR>
"大写Q退出
map <LEADER>Q :wa<CR>:q<CR>
"大写R重新加载.vimrc
map R :source $MYVIMRC<CR>
"大写Q退出
tnoremap Q <Esc><C-\><C-n>:q!<CR>
"大写Q退出
tnoremap <Esc> <C-\><C-n>

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"自定义窗口分屏
map sl :set splitright<CR>:vsplit<CR> "分屏之后光标在右边
map sh :set nosplitright<CR>:vsplit<CR> "分屏之后光标在左边
map sk :set nosplitbelow<CR>:split<CR> “分屏之后光标在上面
map sj :set splitbelow<CR>:split<CR> "分屏之后光标在下面
" 自定义termainalmap分屏
" 打开一个新的终端
"分屏之后光标在下面
map st :set splitbelow<CR>:split<CR>:term<CR>A python3
"map st :term<CR>

" 自定义窗口切换快捷键
"光标向右移动
map <S-k> <C-w>k
tmap <S-k> <C-w>k
"光标向左移动
map <S-j> <C-w>j
tmap <S-j> <C-w>j
"光标向上移动
map <S-h> <C-w>h
tmap <S-h> <C-w>h
"光标向下移动
map <S-l> <C-w>l
tmap <S-l> <C-w>l

"自定义上下左右为改变分屏大小
map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"自定义标签页快捷键
map tt :tabe<CR>
map <LEADER>h :-tabnext<CR> "移动到上一个标签页
map <LEADER>l :+tabnext<CR> "移动到下一个标签页


" 按 F5 执行当前 Python 代码"
map <F5> :w<cr>:r!python3 %<cr>


" vim-plug
call plug#begin('~/.vim/plugged')

"安装插件
"Plug 'python-mode/python-mode', { 'branch': 'develop' } 

"vim启动
Plug 'mhinz/vim-startify' 

"vim aiarline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-snazzy主题
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sindresorhus/iterm2-snazzy'

" nerdtree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} "目录树 
Plug 'Xuyuanp/nerdtree-git-plugin' "为nerdtree添加git支持

" cocvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 代码错误提示
Plug 'w0rp/ale' 

" surround 
Plug 'tpope/vim-surround'

" easy motion
" Plug 'easymotion/vim-easymotion'

" 缩进
Plug 'Yggdroot/indentLine' 

" jedi
Plug 'davidhalter/jedi-vim'

" format
Plug 'sbdchd/neoformat'

" comment code
Plug 'manasthakur/vim-commentor'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" coc-vim settins.location config
let g:coc_config_file="$HOME/.vim/.config/coc/settings.json"

" deoplete
if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
Plug 'shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" file search
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

endif
let g:deoplete#enable_at_startup = 1

call plug#end()

"format
nnoremap ; :Neoformat! python yapf<CR>
let g:neoformat_python_autopep8 = {
\ 'exe': 'autopep8',
\ 'args': ['-s 4', '-E'],
\ 'replace': 1, 
\ 'stdin': 1, 
\ 'env': ["DEBUG=1"], 
\ 'valid_exit_codes': [0, 23],
\ 'no_append': 1,
\ }

let g:neoformat_enabled_python = ['autopep8']


" ===
" === 主题设置
" ===
"colorscheme molokai
colorscheme gruvbox
" 透明背景
let g:molokai_original = 1
"colorscheme snazzy
let g:SnazzyTransparent = 1
let g:rehash256 = 1
set background=dark


" ===
" === leaderF
" ===
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>

" ===
" === comment code
" ===
" nmap // gcc

" ===
" === NERDTree
" ===
map <LEADER><LEADER> <:NERDTreeToggle<CR>
map <LEADER>v :NERDTreeFind<CR>
let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = ""
"let NERDTreeMapUpdirKeepOpen = "l"
"let NERDTreeMapOpenSplit = ""
"let NERDTreeOpenVSplit = ""
"let NERDTreeMapActivateNode = "i"
"let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = "n"
"let NERDTreeMapChangeRoot = "y"


" === python-mode配置
" ===
" ===
" 默认删除空白符 
"let g:pymode_python = "python3" 
"" 删除空白符
"let g:pymode_trim_whitespaces = 1
""
"let g:pymode_doc=1
"let g:pymode_doc_bind = 'K'
"let g:pymode_rope_goto_definition_bind = "<C-]>"
"" let g:pymode_rope_goto_definition_bind = "<LEADER-o>"
"" 默认开启检查
"let g:pymode_lint = 1
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
"let g:pymode_options_max_line_length = 120

" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" === airline配置
" ===
" ===
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:Powerline_symbols='fancy'
let Powerline_symbols='fancy'
set t_Co=256 " 状态栏就有颜色了" ...

" === easymotion配置
" ===
" ===
nmap ss <Plug>(easymotion-s2)



" === coc-nvim
" ===
" ===
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-git', 'coc-vimlsp', 'coc-marketplace']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-o> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-o> coc#refresh()
endif


" 使用enter触发补全选中 并格式化
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>+ <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
