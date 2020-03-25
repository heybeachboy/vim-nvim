call plug#begin('~/.config/nvim/plug')
Plug 'Yggdroot/indentLine'  "缩进指示线
Plug 'morhetz/gruvbox' "主题配色
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-jedi'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-scripts/indentpython.vim'
Plug 'jiangmiao/auto-pairs' " 自动补全括号和引号等
Plug 'vim-airline/vim-airline' " 状态栏
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/ncm-clang'
Plug 'dense-analysis/ale'
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-match-highlight'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/AppData/Local/nvim/plug/gocode/nvim/symlink.sh' }
call plug#end()
let g:python3_host_prog = '/usr/local/python3/bin/python3.7'
let g:python_host_prog = '/usr/bin/python'
let g:ncm2#match_highlight = 'sans-serif'

"缓存
autocmd BufEnter * call ncm2#enable_for_buffer()
" 补全模式,具体详情请看下文
set completeopt=menu,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" 延迟弹窗,这样提示更加流畅
let ncm2#popup_delay = 5
"输入几个字母开始提醒:[[最小优先级,最小长度]]
"如果是输入的是[[1,3],[7,2]],那么优先级在1-6之间,会在输入3个字符弹出,如果大于等于7,则2个字符弹出----优先级概念请参考文档中 ncm2-priority 
let ncm2#complete_length = [[1, 1]]
"模糊匹配模式,详情请输入:help ncm2查看相关文档
let g:ncm2#matcher = 'substrfuzzy'
"使用tab键向下选择弹框菜单
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 
"使用shift+tab键向上选择弹窗菜单,这里不设置因为笔记本比较难操作.如果向下太多我通常习惯使用Backspace键再重新操作一遍
"inoremap <expr> <S> pumvisible() ? "\<C-p>" : "\<S>"
" 注释符后面自动添加空格
let g:NERDSpaceDelims = 1

" 取消注释后删除注释符后的空格
let g:NERDTrimTrailingWhitespace = 1

" 启用NERDCommenterToggle以检查所有选定的行是否已注释
let g:NERDToggleCheckAllLines = 1

" 允许注释和倒空行（在注释区域时很有用）
let g:NERDCommentEmptyLines = 1
let g:ale_sign_error = '>>'  " 自定义错误标志
let g:ale_sign_warning = '!'  " 自定义警告标志
" 指定修复 pep8 错误的 fixer
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}
nnoremap <C-S-l> :ALEFix<CR>  "修复语法和格式错误 ctr + shift + l"
colorscheme gruvbox "主题设置
" 自启动
" let g:airline_theme='bubblegum' " <theme> 代表某个主题的名称
" let g:deoplete#enable_at_startup = 1 " 自动补全提示默认 ctrl-n 下翻页，改成 tab
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " 自动补全提示默认 ctrl-p 下翻页，改成 s-tab
" inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>" " 函数方法 Preview 的窗口自动关闭
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif " Preview 窗口设为在当前窗口下面打开
" set splitbelow
" GO 配置
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:ale_linters = {
        \   'cpp': ['clang'],
        \}
    autocmd BufEnter *.cpp,*.h,*.hpp,*.hxx let g:ale_cpp_clang_options = join(ncm_clang#compilation_info()['args'], ' ')

    " (optional, for completion performance) run linters only when I save files
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0
"Base Configure
set nocompatible "关闭与vi的兼容模式
set number  "显示绝对行号
set rnu  "显示相对行号
set nowrap    "不自动折行
set showmatch    "显示匹配的括号
set scrolloff=3        "距离顶部和底部3行
set encoding=utf-8  "通用的 utf8 编码，避免乱码
set fenc=utf-8      "编码
set mouse=a        "启用鼠标
set hlsearch        "搜索高亮
set cc=80 "标尺线

set foldmethod=indent  " 代码折叠
set foldcolumn=0            "设置折叠区域的宽度
setlocal foldlevel=1        "设置折叠层数为
set foldlevelstart=99       "打开文件是默认不折叠代码
noremap <space> za  "设置快捷键为空格
set guifont=Consolas:h17
syntax on    "语法高亮
filetype plugin indent on  "开启自动识别文件类型，并根据文件类型加载不同的插件和缩进规则
set clipboard=unnamed  "yy直接复制到系统剪切板（For macvim）
cmap w!! w !sudo tee >/dev/null %  "w!!写入只读文件

nnoremap <C-j> 4j  "ctr + j 每次移动4行
nnoremap <C-k> 4k
