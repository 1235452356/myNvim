# vim 插件列表

# ctrlp和搜索功能一起用,切换文件完全不用退出vim

vim 所有标签跳转功能很差,所有插件,ctags,vim-gutentags,经常跳错,19-12-17

浏览器的vim surfingkeys配置
settings.scrollStepSize = 280;

sudo apt-get install vim
sudo apt-get install vim-scripts # 设置系统剪贴板
sudo apt-get install vim-gtk    # 设置系统剪贴板
sudo apt-get install vim-gnome  # 设置系统剪贴板
(gtk 和gnome二选一(在Ubuntu下下载gtk,其他选择gnome))
sudo apt-get install vim-nox

1.  vim-plug          
    vim-plug vim插件的管理工具
    插件目录在plugged
    
    下载方式
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    

2. vim-scripts/indentpython.vim   "自动缩进插件

3. vim-syntastic/syntastic        "语法检查

4. scrooloose/nerdtree            "树形目录

    有 nerdtree 完全不需要退出vim,不需要进入终端

    NERDTree 常用快捷键

    I 切换是否显示隐藏文件
    p 进入父节点
    cd 改变CWD是光标所在目录        change the CWD to the selected dir
    CD 改变树的根节点是CMD          change tree root to CWD
    cd 和 CD 是一对命令

    C  改变树的根节点是光标所在目录   change tree root to the selected dir
    C 是单独使用的命令

            " NERDTree (6.2.1) quickhelp~
        " ============================
        " File node mappings~
        " double-click,
        " o: open in prev window
        " go: preview
        " t: open in new tab
        " T: open in new tab silently
        " middle-click,
        " i: open split
        " gi: preview split
        " s: open vsplit
        " gs: preview vsplit
        " <CR>: custom open
        "
        " ----------------------------
        " Directory node mappings~
        " double-click,
        " o: open & close node
        " O: recursively open node
        " t: open in new tab
        " T: open in new tab silently
        " <CR>: custom open
        " x: close parent of node
        " X: close all child nodes of
        "    current node recursively
        " middle-click,
        " e: explore selected dir
        "
        " ----------------------------
        " Bookmark table mappings~
        " double-click,
        " o: open bookmark
        " go: preview file
        " go: find dir in tree
        " t: open in new tab
        " T: open in new tab silently
        " <CR>: custom open
        " D: delete bookmark
        "
        " ----------------------------
        " Tree navigation mappings~
        " P: go to root
        " p: go to parent
        " K: go to first child
        " J: go to last child
        " <C-j>: go to next sibling
        " <C-k>: go to prev sibling
        "
        " ----------------------------
        " Filesystem mappings~
        " C: change tree root to the
        "    selected dir
        " u: move tree root up a dir
        " U: move tree root up a dir
        "    but leave old root open
        " r: refresh cursor dir
        " R: refresh current root
        " m: Show menu
        " cd:change the CWD to the
        "    selected dir
        " CD:change tree root to CWD
        "
        " ----------------------------
        " Tree filtering mappings~
        " I: hidden files (off)
        " f: file filters (on)
        " F: files (on)
        " B: bookmarks (off)
        "
        " ----------------------------
        " Custom mappings~
        " [c: Jump to prev git hunk
        " ]c: Jump to next git hunk
        "
        " ----------------------------
        " Other mappings~
        " q: Close the NERDTree window
        " A: Zoom (maximize-minimize)
        "    the NERDTree window
        " ?: toggle help
        "
        " ----------------------------
        " Bookmark commands~
        " :Bookmark [<name>]
        " :BookmarkToRoot <name>
        " :RevealBookmark <name>
        " :OpenBookmark <name>
        " :ClearBookmarks [<names>]
        " :ClearAllBookmarks
        " :ReadBookmarks
        " :WriteBookmarks
        " :EditBookmarks


5. jistr/vim-nerdtree-tabs        "树形目录增强



6. lightline  使用



7. sillybun/setbreakpoints_python         "点击<F12>插入断点
    使用pdb对python进行调试
    在要调试的地方插入使用<F12>插入断点
    | 命令 | 解释           | 
    |:-----|:---------------|
    | n    | 执行下一行     | 
    | q    | 终止并退出     | 
    | p    | 打印变量的值   | 
    | c    | 继续执行程序   | 
    | l    | 查看当前代码段 | 
    | s    | 进入函数       | 
    | h    | 帮助           | 




9. jiangmiao/auto-pairs           "自动补全括号和引号等

10. tpope/vim-fugitive             "git集成插件，可以在vim中运行git命令

11. tmhedberg/SimpylFold           "缩进折叠插件

12. ervandew/supertab              "tab补全

13. iamcco/markdown-preview.vim    "markdown预览
14. iamcco/mathjax-support-for-mkdp  "markdown数学公式
 
15. jsnal/vim-serape               "serape 颜色主题
16. sainnhe/edge                   "edge颜色主题
    这两个颜色主题serape 和edge都挺好看的,但是edge要好一些
    官方主题在/usr/share/vim/vim80/colors文件夹下


17. guns/xterm-color-table.vim     "256配色表
 
 
18. majutsushi/tagbar              "tag目录
    调出tag目录的快捷键我设置的<F8>
    1. 第一种方法:
        设置markdwon文件的文件树需要有Exuberant ctags,同时在在~/.ctags 中配置如下,再配置一下.vimrc 
            --langdef=markdown
            --langmap=markdown:.md
            --regex-markdown=/^#{1}[ \t ]*([^#]+.*)/. \1/h,heading1/
            --regex-markdown=/^#{2}[ \t ]*([^#]+.*)/.   \1/h,heading2/
            --regex-markdown=/^#{3}[ \t ]*([^#]+.*)/.     \1/h,heading3/
            --regex-markdown=/^#{4}[ \t ]*([^#]+.*)/.       \1/h,heading4/
            --regex-markdown=/^#{5}[ \t ]*([^#]+.*)/.         \1/h,heading5/
            --regex-markdown=/^#{6}[ \t ]*([^#]+.*)/.           \1/h,heading6/
    2. 第二种方法直接在.vimrc中配置,不需要~/.ctags文件


 
20. honza/vim-snippets             "代码片段
21. SirVer/ultisnips             "使用ultisnips管理代码片段
    这两个代码段的插件很重要
    在两个位置切换的键位是<c-f> <c-b>

 
22. MDGSF/vim-dict                 "英汉字典
    fanyi.vim    自己写的简单插件
    使用的快捷键分别是<F3><F4>
 
23. severin-lemaignan/vim-minimap   "minimap 右侧小地图   打开方式<leader>mm ,关闭方式<leader>mc    <leader> 是 \

24. fzf 搜索工具(使用fzf+rg查看源码)
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'junegunn/fzf.vim'

    1. 配置 fd

     fd 配合fzf的搜索工具(用来替代find,比find要快)
        1. wget https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-musl_7.3.0_amd64.deb
        2. sudo dpkg -i fd-musl_7.3.0_amd64.deb
        3. rm fd-musl_7.3.0_amd64.deb
        4. 在.bashrc 中添加
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

    2. 使用方式
    配置完Rg后,:Rg<CR> 是调用rg搜索当前目录文档

    :FZF<CR> 是调用FZF搜索当前目录文件
    


25. mzlogin/vim-markdown-toc        " markdown的目录生成
        

26. Plug 'tpope/vim-eunuch'                 " vim不用!输入终端命令

27. Plug 'luochen1990/rainbow'                     " 彩虹括号

28. Plug 'KabbAmine/zeavim.vim'             "vim  zeal
    在vim中打开zeal工具,需要电脑先安装zeal
    zeal 的文档目录在file:///home/superman/.local/share/Zeal/Zeal/docsets/
    在zeal中点击 OPEN URL 可以找到
    一.zeal 扩展源
    1. https://zealusercontributions.now.sh/
    2. 寻找需要的文档, 点击, 复制xml的url
    3. 在 add feed中添加url
    二. zeal 下载完文档之后在本地文档中没有显示的问题(使用这种方法添加的有一些会找不到,并且找到也会很卡)
    (1) 实测不可行(文件比完整的文件所占用硬盘空间小)(不可行的原因猜测: 在安装过程中文件解压出错,造成文件丢失)
    1. 那是因为 /home/superman/.local/share/Zeal/Zeal/docsets/ 路径下的该文档的Contents路径下没有Info.plist 文件, 
    2. 把 bash 的文档中Info.plish 文件复制到同一位置
    3. 修改 Info.plish 其中 bash 为本文件的 Numpy
    4. 修改 Info.plish 路径为 Numpy 的路径
        仿照着bash 写路径
    (2) 在win10 下下好, 把文件夹放入 文档目录
    win10 文档目录位置
    C://Users/root/AppData/Local/Zeal/Zeal/docsets




29. Plug 'vim-scripts/fcitx.vim'            
输入法配置
    vim8.0 对这个插件的异步支持不好
    写代码用vim8.0
    写文档用nvim

    


4. Yggdroot/indentLine            "缩进指示线
    缩进指示线使得 md 文件 的 .* 只显示. *> 只显示>
    设置特定文件打开该插件



*. " Valloric/YouCompleteMe         "代码补全神器
代码补全神器, 但是很难安装,我是使用deepin 的官方教程vim-addons的,所以不用在vundle插件管理

    1.试试这个命令，看是否已经安装 vim-addons
        vim-addons
    2.如果没有安装 vim-addons，则需安装 vim-addon-manager
        sudo apt-get install vim-addon-manager
    3.开始安装 YouCompleteMe
        sudo apt-get install vim-youcompleteme
    4.将 YCM 加入 addons 管理器中
        vim-addons install youcompleteme
    5.找到.vim/autoload文件夹下的youcompleteme.vim
    xp,在youcompleteme.vim搜索lib,找到/usr/lib/ycmd/路径
    ,在.vimrc中添加
    let g:ycm_global_ycm_extra_conf = '/usr/lib/ycmd/ycm_extra_conf.py'
    YCM的一些重要配置还是要配置的, 在.vimrc中.*




有问题暂时不用的插件
1. 搜索插件
  " kien/ctrlp.vim                 "搜索插件,在vim normal模式下，按下ctrl+p，然后输入你要寻找的文件.<c-b>下一页,<c-f> 上一页                 但是这个插件不支持中文
  " rking/ag.vim                   "搜索引擎使用了the_silver_searcher
  "这两个插件搜索慢,并且显示的并不全,显示不全是难以忍受的

2. vim调试器
   " jayli/vim-easydebugger          "vim调试器,支持python,js,go
   "挺难配置的,而且没有那么多快捷键给调试, 下一步等等等等,

3. vim-latex vim中latex的插件 
   " vim-latex/vim-latex            "vim latex   vim-Latex 使用大全网址<http://vim-latex.sourceforge.net/documentation/latex-suite/>        
   "该插件会使我设置的nmap<c-j>失效
    说不定以后还会用,配置过程如下
        配置vim+LaTex

        1. 安装LaTex
            sudo apt-get install texlive-full  
            安装中文字体包
            sudo apt-get install latex-cjk-all
        2. 安装vimtex插件
        Plugin 'lervag/vimtex'
            " vimtex配置
            " Prevent that vim detect a file with the tex suffix as a plaintex
            let g:tex_flavor='latex'
            " Set the viewer method
            let g:vimtex_view_method='zathura'
            " Never opened/closed the quickfix window automatically. The quickfix window shows the errors and/or warnings when compile, and we can open the quickfix windows use \le
            let g:vimtex_quickfix_mode=0
            " 最后两行开启自动隐藏功能,开启了这个功能，除了你光标所在的那一行之外，文本里夹杂的LaTeX代码就都会隐藏或者替换成其他符号
            set conceallevel=1
            let g:tex_conceal='abdmg'

 
5.  airline 的两个插件
Plugin 'vim-airline/vim-airline'          "vim 底部状态栏配置
Plugin 'vim-airline/vim-airline-themes'   "vim 底部状态栏主题

没有什么作用,只是美化了一下底部的状态栏,却感觉卡了好几倍,得与失不成正比

6. Xuyuanp/nerdtree-git-plugin    "为nerdtree添加git支持：
    目录中提示的git状态会破坏目录的层次感, 而且很丑,直接弃用


