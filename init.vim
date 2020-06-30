" map 后面不要有空格和注释, 
" 启用vim-plug来管理vim插件 
call plug#begin('~/.config/nvim/plugged')
" 安装插件写在这之后



if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } "树
  Plug 'kristijanhusak/defx-icons'            "图标
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'itchyny/lightline.vim'            "美化状态栏，可以显示当前的虚拟环境、Git分支、正在编辑的文件等信息。
"
Plug 'jacoborus/tender.vim'             "主题
"
Plug 'jiangmiao/auto-pairs'           "自动补全括号和引号等
"
Plug 'tpope/vim-fugitive'             "git集成插件，可以在vim中运行git命令,  主要去github上按照教程下一点东西

"Plug 'Valloric/YouCompleteMe'         "代码补全神器
"
" Plug 'ervandew/supertab'              "tab补全

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }   " markdown 预览及数学支持
Plug 'dhruvasagar/vim-table-mode'           " vim 表格格式化 , 默认开启, 关闭方式为 <leader>tm

Plug 'jsnal/vim-serape'               "serape 颜色主题
Plug 'sainnhe/edge'                   "edge颜色主题
Plug 'guns/xterm-color-table.vim'     "256配色表
"
"
Plug 'majutsushi/tagbar'              "tagbar
Plug 'jszakmeister/markdown2ctags'    " tagbar的markdown

Plug 'sillybun/setbreakpoints_python'         "python点击<F12>插入断点

Plug 'KabbAmine/zeavim.vim'             "vim  zeal  调用 使用 \z 或者 \\z 

"Plug 'junegunn/fzf',{'dir': '~/.fzf', 'do':'./install -all'}              "fzf 安装,不需要了，已经使用pacman安装了fzf
Plug 'junegunn/fzf.vim'                 "fzf的vim支持
"
Plug 'mzlogin/vim-markdown-toc'         " markdown的目录生成 ,:GenTocGFM 生成目录

Plug 'tpope/vim-eunuch'                 " vim不用!输入终端命令

Plug 'luochen1990/rainbow'                     " 彩虹括号
"
Plug 'vim-scripts/fcitx.vim'            " 输入法配置
"
" Plug 'mattn/emmet-vim'                  " emmet  ,使用方式是 <c-y>和逗号,

Plug 'voldikss/vim-translator'          " 异步翻译
Plug 'ianva/vim-youdao-translater'      " 有道异步

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }                     " go 语言支持
Plug 'buoto/gotests-vim'                                                " go语言自动生成测试用例 :GoTests  或者 :GoTestsAll

Plug 'rdnetto/YCM-Generator',{ 'branch': 'stable' }            " 生成 .ycm_extra_conf.py  和.color_coded

Plug 'preservim/nerdcommenter'              "注释插件

Plug 'airblade/vim-gitgutter'               " 在“装订线”（符号列）中显示git diff, 它显示已添加，修改或删除的行

Plug 'gko/vim-coloresque'                "css 颜色显示

Plug 'Yggdroot/indentLine'              " 缩进指示线

Plug 'chemzqm/wxapp.vim'                " x 小程序补全

Plug 'othree/xml.vim'                   " helps editing xml (and [x]html, sgml, xslt) files 

Plug 'neoclide/coc.nvim', {'branch': 'release'}         "  coc.nvim, "coc 插件及插件配置文件在 ~/.config/coc/ 下,除go语言的


Plug 'honza/vim-snippets'             "代码片段, 我现在使用coc-snippets管理片段,

Plug 'voldikss/vim-codelf'             "codelf函数命名工具

Plug 'skywind3000/asynctasks.vim'      " task 
Plug 'skywind3000/asyncrun.vim'

"Plug 'ludovicchabant/vim-gutentags'     " 自动更新ctags, 只需要在 根目录建立 .root文件, 即可自动生成ctags和更新ctags, 在工程文件更目录放置 .root 文件
"
"Plug 'SirVer/ultisnips'            "使用ultisnips管理代码片段, 
"
"Plug 'soywod/phonetics.vim'             " 英文语音插件, 但是没有异步处理,改天我改完再用

"Plug 'vim-latex/vim-latex'            "vim latex   vim-Latex 使用大全网址<'http://vim-latex.sourceforge.net/documentation/latex-suite/'>        该插件会使我设置的nmap<c-j>失去效果

"Plugin 'kien/ctrlp.vim'                 "搜索插件,在vim normal模式下，按下ctrl+p，然后输入你要寻找的文件.<c-b>下一页,<c-f> 上一页                 但是这个插件不支持中文

" Plug 'puremourning/vimspector'              "调试
"
" Plug 'vim-syntastic/syntastic'        "语法检查 这个插件在保存 python 程序的
" 时候会有卡顿, 废弃

" 安装插件写在这之前
call plug#end()            " required




"
" " vim-plug的配置到此结束，下面是你自己的配置
 
 

"win10下要加下面的两行
"set nocp 设置vim不兼容vi 
"set backspace=start,indent,eol  "win10下backspace可以换行


"解决中文乱码问题
set fileencodings=utf-8,gb2312,gbk,gb18030
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set termencoding=utf-8             



set mouse=a                           "支持鼠标定位


"language messages zh_CN.utf-8
"
""指定菜单语言

set langmenu=zh_CN.utf-8

source $VIMRUNTIME/delmenu.vim

source $VIMRUNTIME/menu.vim

set nu                              "绝对行号

" set rnu                             "相对行号

set wildmenu                         " 命令行代码提示

set tabstop=4                         "tab 长度设置为 4

set shiftwidth=4                      "缩进为四个空格, 和set sw=4 一样 

set smartindent                       "智能缩进  

set expandtab                         "tab替换为空格键

set softtabstop=4

set ruler                             "在右下角显示光标位置的状态行

set autoindent                        "自动缩进

set nocompatible                      "关闭vi兼容  

set history=500                       "历史命令  

syntax on                             "语法高亮  

set showmatch                         "括号匹配  

set incsearch                         "设置快速搜索  使用复制搜索时,可以y复制,  / + <c-r> + 0寄存器

set ignorecase                        "搜索时忽略大小写,
set smartcase                         "智能大小写,当你的搜索字串有大写时,将对大小写敏感,否则不敏感, 这个需要搭配   ignorecase 使用

"set hlsearch                          "高亮显示匹配的字符串

set foldenable                        "开启代码折叠  

filetype plugin on                    "文件关联

filetype indent on                    "根据文件类型缩进

set guifont=Consolas:h16              "gui字体

"set paste                            "避免粘贴格式错乱

"去掉临时文件

set noundofile                        "关闭与vi的兼容模式

set nobackup                          "不设置备份

set noswapfile                        "不设置交换文件

" set nohlsearch                                " 搜索结束之后高亮取消

let g:mapleader = ","

" 调整窗口高度和宽度
" 三种方法
" resize 38
" vertical resize 20
set cmdheight=2

" 每次打开的时候光标定位在上次退出的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"在Linux下的Vim中，Ctrl-F键默认设置为，向前（Forward）滚动屏幕；
"而在Windows和Mac下的Vim中，Ctrl-F键默认设置为，打开查找对话框。
"为了保持不同操作系统之间的操作一致性，建议在配置文件(vimrc)中增加以下代码，以重新将Ctrl-F键设置为向前滚动屏幕：
"unmap <C-F>

vmap <C-c> "+y


let g:color=2


if color==1
    colorscheme serape
endif
if color==2
    set background=dark
    "set background=light
    colorscheme edge
    hi IncSearch ctermfg=NONE ctermbg=202 cterm=bold,underline
    hi Search ctermfg=NONE ctermbg=202 cterm=NONE
endif
if color==3
    " For Neovim 0.1.3 and 0.1.4
    "let $NVIM_TUI_ENABLE_TRUE_COLOR=1

    " Theme
    "syntax enable
    colorscheme tender
    " set lighline theme inside lightline config
    let g:lightline = { 'colorscheme': 'tender' }
endif


nmap <F7> :XtermColorTable<CR>
" 256配色表




"Enable folding               
"设置代码折叠,并使用space键折叠打开
set foldmethod=indent
set foldlevel=0
" Enable folding with the spacebar
nnoremap <space> za


"配置tagbar
nmap  <F8> :TagbarToggle<CR>                           "<F8>打开tagbar
let g:tagbar_ctags_bin = 'ctags'                       "tagbar以来ctags插件
let g:tagbar_width = 30                                "r的宽度为30列，默认40
"let g:tagbar_autofocus = 1                             "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
"let g:tagbar_autopreview = 1                           "开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
let g:tagbar_sort = 0                                  "设置标签不排序，默认排序
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.vim,*.snippets,*.md,*.sh,*.go,*.js,*.jsx :call tagbar#autoopen() "在某些情况下自动打开tagbar
" 配置markdown
"    let g:tagbar_type_markdown = {
"            \ 'ctagstype' : 'markdown',
"            \ 'kinds' : [
"                    \ 'h:headings',
"            \ ],
"        \ 'sort' : 0
"    \ }
    
"Add support for markdown files in tagbar.
"    \ 'ctagsbin' : '~/.vim/plugged/markdown2ctags/markdown2ctags.py', 
"    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
" let g:tagbar_type_markdown = {
"     \ 'ctagstype': 'markdown',
"     \ 'ctagsbin' : './plugin/markdown2ctags-decode-args/markdown2ctags.py',
"     \ 'ctagsargs' : '-f - --sort=yes --sro=»',
"     \ 'kinds' : [
"         \ 'h:headings',
"         \ 's:sections',
"         \ 'i:images'
"     \ ],
"     \ 'sro' : '»',
"     \ 'kind2scope' : {
"         \ 's' : 'section',
"     \ },
"     \ 'sort': 0,
" \ }

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : './plugin/markdown2ctags-decode-args/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }






" YouCompleteMe 功能
" 补全功能在注释中同样有效"
" let g:ycm_complete_in_comments=1
" " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
" let g:ycm_confirm_extra_conf=0
" " 开启 YCM 基于标签引擎
" let g:ycm_collect_identifiers_from_tags_files=1
" " 引入 C++
" "标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
" set tags+=/home/superman/.vim/doc/tags
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
" " set completeopt-=preview
" set completeopt=menu,menuone
" "从第一个键入字符就开始罗列匹配项
" let g:ycm_min_num_of_chars_for_completion=1
" " 禁止缓存匹配项，每次都重新生成匹配项
" let g:ycm_cache_omnifunc=0
" " 语法关键字补全
" let g:ycm_seed_identifiers_with_syntax=1
" " 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
" let g:ycm_key_invoke_completion = '<M-;>'
" " 设置转到定义处的快捷键为ALT + G，这个功能非常赞
" nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration<C-R>=expand("<cword>")<CR><CR>
" let g:ycm_show_diagnostics_ui = 0          "0表示禁用ycm自带的syntastic插件,不禁用ycm的代码检查功能,syntastic的代码检查功能不能使用,同时syntastic仅支持C语言家族
" "代码跳转
" nnoremap <c-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" " 需要配置好 ycm_global_ycm_extra_conf  才能语义代码跳转
" "let g:ycm_global_ycm_extra_conf = '/usr/lib/ycmd/ycm_extra_conf.py'
" "          let g:ycm_filetype_whitelist = {
" "                              \ "python":1,
" "                              \ "sh":1,
" "                              \ "sql":1,
" "                              \ "vim":1,
" "                              \ "java":1,
" "                              \ "go":1,
" "                              \ "html":1,
" "                              \ }
"
" let g:ycm_filetype_whitelist = {
"                     \ }
"
" let g:ycm_semantic_triggers =  {
"     \   'css': [ 're!^\s{4}', 're!:\s+' ],
"     \   'c': ['->', '.'],
"     \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"     \            're!\[.*\]\s'],
"     \   'ocaml': ['.', '#'],
"     \   'cpp,cuda,objcpp': ['->', '.', '::'],
"     \   'perl': ['->'],
"     \   'php': ['->', '::'],
"     \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
"     \   'ruby,rust': ['.', '::'],
"     \   'lua': ['.', ':'],
"     \   'erlang': [':'],
"     \ }


"缩写 https://vim.wxnacy.com/#docs/abbreviations
iabbrev pr print()
"java   iabbrev class public class{}<esc>i<cr><esc>k$Fsli



"source ~/.vim/.vimCode/codeRunner.vim
"source ~/.vim/vimCode/helloworld.vim










"vim-latex 配置
" this is mostly a matter of taste. but LaTeX looks good with just a bit
" " of indentation.
"set sw=4
" " tip: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
set iskeyword+=:"}"


"设置tags 添加python路径, 自动更新ctags插件没有权限操作 /usr/lib, 自己手动更新
"nmap <c-]> g<c-]>
"set tags+=/usr/lib/python3.7/tags


" gutentags 配置
" gutentags 搜索工程目录的标志,遇到这些文件/目录名,就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的tags 文件全部放入~/.cache/tags目录下,避免污染工程文件
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置ctags的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测~/.cache/tags , 不存在就新建
if !isdirectory(s:vim_tags) 
    silent! call mkdir(s:vim_tags, 'p')
endif



"设置markdown
"let g:vmt_auto_update_on_save = 0
"


"python自动插入断点配置
autocmd FileType python nnoremap <F12> :call ToggleBreakPoint()<Cr>



"zeavim 配置
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset


"fzf 配置
set rtp+=~/.fzf

" 搜索历史
nnoremap <leader>l :History<CR>
 
nnoremap <leader>k :Files<CR>

nnoremap <leader>j :Buffers<CR>
"关闭buffer
nnoremap <leader>d :bd!<CR>

" 搜索历史
" :History
" 在设定目录下查找文件
" :Files               
" 在buffer 中查找文件
" :Buffers<CR>

"" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})"

"fzf 调用Rg搜索   输入:Rg <keyword>  会调用ripgrep递归搜索当前目录 ,  使用 vim+ Rg 是查看源码的好方式
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)



" vim-markdown-toc 目录配置
let g:vmt_cycle_list_item_markers = 1


" rainbow  括号配置
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle"
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}



" 状态栏
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }
      



"if has('nvim')
"    let g:python3_host_prog = '/usr/local/bin/python'
"endif




" " emmet 配置
" let g:user_emmet_mode='a'    "enable all function in all mode."
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" let g:user_emmet_settings = {
"     \ 'wxss': {
"     \   'extends': 'css',
"     \ },
"     \ 'wxml': {
"     \   'extends': 'html',
"     \   'aliases': {
"     \     'div': 'view',
"     \     'span': 'text',
"     \   },
"     \  'default_attributes': {
"     \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
"     \     'navigator': [{'url': '', 'redirect': 'false'}],
"     \     'scroll-view': [{'bindscroll': ''}],
"     \     'swiper': [{'autoplay': 'false', 'current': '0'}],
"     \     'icon': [{'type': 'success', 'size': '23'}],
"     \     'progress': [{'precent': '0'}],
"     \     'button': [{'size': 'default'}],
"     \     'checkbox-group': [{'bindchange': ''}],
"     \     'checkbox': [{'value': '', 'checked': ''}],
"     \     'form': [{'bindsubmit': ''}],
"     \     'input': [{'type': 'text'}],
"     \     'label': [{'for': ''}],
"     \     'picker': [{'bindchange': ''}],
"     \     'radio-group': [{'bindchange': ''}],
"     \     'radio': [{'checked': ''}],
"     \     'switch': [{'checked': ''}],
"     \     'slider': [{'value': ''}],
"     \     'action-sheet': [{'bindchange': ''}],
"     \     'modal': [{'title': ''}],
"     \     'loading': [{'bindchange': ''}],
"     \     'toast': [{'duration': '1500'}],
"     \     'audio': [{'src': ''}],
"     \     'video': [{'src': ''}],
"     \     'image': [{'src': '', 'mode': 'scaleToFill'}],
"     \   }
"     \ },
"     \}


" 英文语音配置
"let g:phonetics_default_accent = 'american' | 'british'
"nmap <F5> :PhoneticsPlay<CR>






" 注释插件  \cc 注释  \cu 取消注释
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

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



" 路径配置
" 设置 pwd 为该文件的当前目录, <leader>c 为defx_my_setting中定义的快捷键
" nnoremap <silent> cd :cd %:h<CR>:Defx<CR>:set nu<CR><c-w><c-h><leader>c
nnoremap <silent> cd :cd %:h<CR>


"defx 使用
 call defx#custom#option('_', {
       \ 'winwidth': 30,
       \ 'split': 'vertical',
       \ 'direction': 'topleft',
       \ 'show_ignored_files': 0,
       \ 'buffer_name': '',
       \ 'toggle': 1,
       \ 'resume': 1
       \ })
nmap <silent> <CR> :Defx<cr>:set nu<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    " c复制,m移动, 使用p 键粘贴， d 删除
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
  
    " R 重命名, K 新目录, N 新建一个文件,  M 新建多个文件
    nnoremap <silent><buffer><expr> R
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')
  
    "  <space> 选中 ， * 全选 , yy 复制转中的文件名
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns',
    \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
  
    " 移动命令 l , h, o, q, ~,  
    " x 移动到cwd ,配合上面的 cd 使用
    nmap <silent><buffer><expr> <leader>c
    \ defx#do_action('cd', getcwd())
    nnoremap <silent><buffer><expr> l
    "\ defx#do_action('open')
    \ <SID>defx_enter()
    nnoremap <silent><buffer><expr> <CR>
    " \ defx#do_action('open')
    \ <SID>defx_CR()
    nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> o
    \ <SID>defx_toggle_tree()
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
  
  
    "其他命令：对目录 I 显示隐藏文件 , r 刷新
  
    nnoremap <silent><buffer><expr> I
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('redraw')
  
    "其他命令：！ 执行  <C-g> 输出文件名, cd 改变cwd
    nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> <c-g>
    \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')

    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')


endfunction
function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction
function! s:defx_enter() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        "return defx#do_action('open_or_close_tree')
        return defx#do_action('open')  
    endif
    return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_CR() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        :q
    endif
    return defx#do_action('multi', ['drop'])
endfunction



" markdown-preview.nvim 使用
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'




" go语言
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1



"缩进指示线
" Change Indent Char
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" Change Conceal Behaviour
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
autocmd FileType markdown,json :let g:indentLine_setConceal = 0






" coc.nvim  开始
"自动补全

let coc_global_extensions = ['coc-snippets', 'coc-highlight', 'coc-emmet', 'coc-vetur', 'coc-tsserver', 'coc-rls', 'coc-json', 'coc-java', 'coc-css', 'coc-python', 'coc-calc','coc-powershell', 'coc-smartf']
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
"set updatetime=300

" don't give |ins-completion-menu| messages.  注释掉下面一行
" set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[g` and `]g` to navigate diagnostics
" 跳转到上一个错误处
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" 跳转到下一个错误处
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
"跳转到定义
nmap <silent> gd <Plug>(coc-definition)
"跳转到引用
nmap <silent> gr <Plug>(coc-references)
"跳转到实现  python中没有实现和类型定义, 实现应该是实现接口
nmap <silent> gi <Plug>(coc-implementation)
"跳转到类型定义位置
nmap <silent> gy <Plug>(coc-type-definition)

" Remap for rename current word
" 代码重构修改,类,函数名,下面的函数也会更改
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"格式化文档,在n 和v模式使用, 但是n模式使用效果很差,基本没什么作用
xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window
"查看文档
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_filetype_map = {
    \ 'html.swig': 'html',
    \ 'wxss': 'css',
    \ }


" coc的 coc-calc 插件 (我用来计算 rem 值)
" append result on current expression
" nmap cv <Plug>(coc-calc-result-append)

" replace result on current expression
nmap cc <Plug>(coc-calc-result-replace)


" coc.nvim 结束


" coc-snippets config start

" Use <C-j> for select text for visual placeholder of snippet.
" 使用<C-j>为片段的可视占位符选择文本。
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-f> for jump to next placeholder, it's default of coc.nvim
" 使用<C-f>跳到下一个占位符，这是coc.nvim的默认值

let g:coc_snippet_next = '<c-f>'

" Use <C-b> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-b>'

" Use <C-f> for both expand and jump (make expand higher priority.)
" 对expand和jump都使用<C-f>（使expand具有更高的优先级。）
imap <C-f> <Plug>(coc-snippets-expand-jump)

"coc-snippets config end

" coc-smartf
" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end



" vim-codelf
" :CodelfOpenBrowser  " 打开浏览器的 codelf




" 英文拼写检查, 放在最下面
"""""""""" Spell check on """"""""""
" set spell spelllang=en_us
" setlocal spell spelllang=en_us
" "SpellBad        不能识别的单词 (坏词)                    hl-SpellBad
" "SpellCap        开头没有大写的单词                       hl-SpellCap
" "SpellRare       偏僻词                                   hl-SpellRare
" "SpellLocal      不符合所选区域的拼写方式                 hl-SpellLocal
" highlight clear SpellBad
" highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
" highlight clear SpellCap
" "highlight SpellCap term=underline cterm=underline
" highlight clear SpellRare
" "highlight SpellRare term=underline cterm=underline
" highlight clear SpellLocal
" "highlight SpellLocal term=underline cterm=underline
" "]s           到光标位置之后的错拼单词
" "[s           到光标位置之前的错拼单词
" "z=           对光标位置的单词进行建议修改
" "zg           把单词加入个人词表
" "zw           把当前单词从拼写文件中删除
" "zug          撤销针对当前单词的 zg 或 zw 命令
" "c-x s         插入模式下使用, 跳回本行上一个错误位置
" "c-s            如果上一个不小心按成c-x, c-s  会锁定屏幕
" "c-q            解锁屏幕
" "
" "               " 选中区域加入行号的正则:'<,'>s/^/\=(line('.')-line("'<")+1)/
"
