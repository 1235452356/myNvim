# 后台运行 tmux new -s mysql -d mysqld
# ssh 使用

# ssh -p 端口 用户 @ 服务器地址
# ssh -p 22 root@45.132.14.105
# 文件
# scp root@45.132.14.105:/root/go.sh /home/newman/Desktop
# 目录
# scp -r

# ssh 及 scp免密
# 1. 生成密钥
# 　ssh-keygen -t rsa
# 2. 在~/.ssh 文件夹下有 authorized_keys, 生成的私钥文件id_rsa, 生成的公钥文件id_rsa.pub, 已知的主机公钥清单 known_hosts:存放登录过的服务器的公钥
# authorized_keys: 服务器端 存放 用户的公钥文件
# 　　　　如果希望ssh公钥生效需满足至少下面两个条件：
# 　　　　　　1) .ssh目录的权限必须是700
# 　　　　　　2) .ssh/authorized_keys文件权限必须是600
# 3. 把id_rsa.pub 文件添加到服务器的~/.ssh/authorized_keys 中
# ssh-copy-id root@45.132.14.105

function proxy_off_bash(){
    ## 开启终端关闭代理
    unset http_proxy
    unset https_proxy
    # echo -e "已关闭代理"
}
# proxy_off_bash

function p_on(){
    proxy_on
    git_proxy_on
}

function p_off(){
    proxy_off
    git_proxy_off
}

function p_scan(){
    echo "http_proxy:$http_proxy"
    echo "https_proxy:$http_proxy"
    git_proxy_scan
}



function proxy_off(){
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}


function proxy_on() {
    # export http_proxy="http://127.0.0.1:12333"
    # export https_proxy=$http_proxy
    # export http_proxy="socks5://127.0.0.1:1080"
    # export https_proxy=$http_proxy
    export http_proxy="socks5://127.0.0.1:1080"
    export https_proxy=$http_proxy
    echo -e "已开启代理"
}


function git_proxy_on() {
    # git config --global http.proxy 'http://127.0.0.1:12333'
    # git config --global https.proxy 'https://127.0.0.1:12333'

    # git config --global http.sslVerify false
    export GIT_SSL_NO_VERIFY=true  # 忽略ssl认证, 服务器的SSL证书未经过第三方机构签署, 代理服务器的ssl证书未经过第三方机构签署时使用, 如果没有这句话会报错
    git config --global http.proxy 'socks5://127.0.0.1:1080'
    git config --global https.proxy 'socks5://127.0.0.1:1080'
}

function git_proxy_off() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

function git_proxy_scan() {
    echo "git_http_proxy:$(git config --global http.proxy)"
    echo "git_https_proxy:$(git config --global https.proxy)"
}

function vr() {
# 表现良好的香港131
    # python ~/Desktop/onedayday/summary/vpn/v2.py
    cd ~/Desktop/onedayday/summary/vpn/go/
    go run main.go
    cd -
}

function cc() {
    cp -r $1 ~/Sync/
}


function dropit() {

    ##  需要支持的文件类型

    # 1.文件夹
    # 2.文件
    ##  1. 图片 img: jpg,jpeg,png, PNG ,gif
    ##  2. 视频 flv, mp4, 
    ##  3. 文本文件 md,txt, png, docx ,doc,xls, xlsx, ppt, pptx, epub,mobi  ,其中每种文本文件(除docx和doc占据一个文件夹)单独占据一个文件夹
    ##  4. 代码  py, sh, sql, html, cpp, h, conf
    ##  5. 压缩包 zip,rar, gz
    ##  6. 应用  apk ,exe   

    folder=./one       # one文件
    folderName=${folder:2}       # one文件

    if [ -f "$folder" ]; then #  检测one文件是否存在
        echo 存在one文件
        exit 0
    fi

    # 若不存在 创建one文件夹,不需要处理存在one文件夹的情况,  mkdir -p 文件夹 命令 在存在文件夹的情况下不进行任何操作
    mkdir -p "$folder"

    ls -a|while read line # 按行读取

    do 
        echo "Line : $line"

        if [ "$line" = "." ]; then             # 排除文件名为. 和.. 的
            continue 
        fi
        if [ "$line" = ".." ]; then    
            continue 
        fi
        if [ "$line" = "onedayday's" ]; then             # 排除文件名为. 和.. 的
            continue 
        fi
        if [ "$line" != "$folderName" ]; then    # 判断文件名是否为新创建的文件夹,若不是,则继续判断文件类型
            # 每一个 判断文件是否是目录
            echo "          start                           $line"
            if [ -d "$line" ]; then                     #  判断文件是否是目录 ,文件夹移动
                mkdir -p "$folder/folder"
                mv "$line" $folder/folder/
            fi

            ################################################### 文件开始
            # 对文件名进行处理
            len=${#line}                                # 文件名长度
            end1="${line:$(($len-1))}"                    # 后一位
            end2="${line:$(($len-2))}"                    # 后两位
            end3="${line:$(($len-3))}"                    # 后三位
            end4="${line:$(($len-4))}"                    # 后四位
            # 对各种类型文件进行处理 

            # 1. 图片

        ##  1. 图片 img: jpg,jpeg,png, PNG 
            if [ $end3 == jpg ]; then                       # jpg 文件
                mkdir -p "$folder/img"
                mv -i "$line" "$folder/img/"
            fi
            if [ $end3 == gif ]; then                       # jpg 文件
                mkdir -p "$folder/img"
                mv -i "$line" "$folder/img/"
            fi
            if [ $end3 == png ]; then                       # png 文件
                mkdir -p "$folder/img"
                mv -i "$line" "$folder/img/"
            fi
            if [ $end4 == jpeg ]; then                      # jpeg 文件
                mkdir -p "$folder/img"
                mv -i "$line" "$folder/img/"
            fi
            if [ $end3 == PNG ]; then                      # PNG 文件
                mkdir -p "$folder/img"
                mv -i "$line" "$folder/img/"
            fi


            # 2. 视频

    ##  2. 视频 flv, mp4, 
            if [ $end3 == flv ]; then                       # flv 文件
                mkdir -p "$folder/视频"
                mv -i "$line" "$folder/视频/"
            fi
            if [ $end3 == mp4 ]; then                       # mp4 文件
                mkdir -p "$folder/视频"
                mv -i "$line" "$folder/视频/"
            fi

            # 3. 文本
            ##  3. 文本文件 md,txt, pdf, doc, docx,xls,ppt, pptx, epub,  ,其中每种文本文件(除docx和doc占据一个文件夹)单独占据一个文件夹

            if [ $end2 == md ]; then                       # txt 文件
                mkdir -p "$folder/文本/md"
                mv -i "$line" "$folder/文本/md/"
            fi
            if [ $end3 == txt ]; then                       # txt 文件
                mkdir -p "$folder/文本/txt"
                mv -i "$line" "$folder/文本/txt/"
            fi
            if [ "$end3" == pdf ]; then                       # pdf 文件
                mkdir -p "$folder/文本/pdf"
                mv -i "$line" "$folder/文本/pdf/"
            fi
            if [ $end3 == PDF ]; then                       # pdf 文件
                mkdir -p "$folder/文本/pdf"
                mv -i "$line" "$folder/文本/pdf/"
            fi
            if [ $end3 == doc ]; then                       # doc 文件
                mkdir -p "$folder/文本/doc"
                mv -i "$line" "$folder/文本/doc/"
            fi
            if [ $end4 == docx ]; then                      # docx 文件
                mkdir -p "$folder/文本/doc"
                mv -i "$line" "$folder/文本/doc/"
            fi
            if [ $end3 == xls ]; then                       # xls 文件
                mkdir -p "$folder/文本/xls"
                mv -i "$line" "$folder/文本/xls/"
            fi
            if [ $end4 == xlsx ]; then                       # xlsx 文件
                mkdir -p "$folder/文本/xls"
                mv -i "$line" "$folder/文本/xls/"
            fi
            if [ $end3 == ppt ]; then                       # ppt 文件
                mkdir -p "$folder/文本/ppt"
                mv -i "$line" "$folder/文本/ppt/"
            fi
            if [ $end4 == pptx ]; then                       # pptx 文件
                mkdir -p "$folder/文本/ppt"
                mv -i "$line" "$folder/文本/ppt/"
            fi
            if [ $end4 == epub ]; then                       # epub 文件
                mkdir -p "$folder/文本/epub"
                mv -i "$line" "$folder/文本/epub/"
            fi
            if [ $end4 == mobi ]; then                       # mobi 文件
                mkdir -p "$folder/文本/epub"
                mv -i "$line" "$folder/文本/epub/"
            fi

            # 4. 代码
            ##  4. 代码  py, sh, go,sql, html,java

            if [ $end1 == c ]; then                        # c文件
                mkdir -p "$folder/代码/c"
                mv -i "$line" "$folder/代码/c/"
            fi
            if [ $end1 == h ]; then                        # h文件
                mkdir -p "$folder/代码/c"
                mv -i "$line" "$folder/代码/c/"
            fi
            if [ $end2 == py ]; then                        # py文件
                mkdir -p "$folder/代码/py"
                mv -i "$line" "$folder/代码/py/"
            fi
            if [ $end2 == sh ]; then                        # sh文件
                mkdir -p "$folder/代码/sh"
                mv -i "$line" "$folder/代码/sh/"
            fi
            if [ $end2 == go ]; then                        # go文件
                mkdir -p "$folder/代码/go"
                mv -i "$line" "$folder/代码/go/"
            fi
            if [ $end3 == sql ]; then                       # sql文件
                mkdir -p "$folder/代码/sql"
                mv -i "$line" "$folder/代码/sql/"
            fi
            if [ $end3 == cpp ]; then                        # c文件
                mkdir -p "$folder/代码/c"
                mv -i "$line" "$folder/代码/c/"
            fi
            if [ $end4 == html ]; then                      # html文件
                mkdir -p "$folder/代码/html"
                mv -i "$line" "$folder/代码/html/"
            fi
            if [ $end4 == java ]; then                      # java文件
                mkdir -p "$folder/代码/java"
                mv -i "$line" "$folder/代码/java/"
            fi
            if [ $end4 == json ]; then                      # json文件
                mkdir -p "$folder/代码/json"
                mv -i "$line" "$folder/代码/json/"
            fi
            if [ $end4 == conf ]; then                      # conf文件
                mkdir -p "$folder/代码/conf"
                mv -i "$line" "$folder/代码/conf/"
            fi

            # 5. 压缩包

            ##  5. 压缩包 zip,rar, gz
            if [ $end3 == zip ]; then           # zip文件
                mkdir -p "$folder/zip"
                mv -i "$line" "$folder/zip/"
            fi
            if [ $end3 == rar ]; then           # rar 文件
                mkdir -p "$folder/zip"
                mv -i "$line" "$folder/zip/"
            fi
            if [ $end2 == gz ]; then            # gz 文件
                mkdir -p "$folder/zip"
                mv -i "$line" "$folder/zip/"
            fi
            # 5. 应用

            if [ $end3 == apk ]; then           # apk文件
                mkdir -p "$folder/应用/apk"
                mv -i "$line" "$folder/应用/apk/"
            fi
            if [ $end3 == exe ]; then           # exe文件
                mkdir -p "$folder/应用/exe"
                mv -i "$line" "$folder/应用/exe/"
            fi

            ################################# 文件结束
            echo "          end                             ${line}    "
        fi
    done

    echo "finish"
}


function rr() {
    echo $1 
    mkdir -p ~/garbage
    mv $1 ~/garbage/
}

# 命令补全, sudo,man 后命令补全
complete -cf sudo
complete -cf man

# bash_completion
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

alias ll='ls -lh'
alias la='ls -alh'
alias du='du -h'
alias free='free -h'
alias x='xdg-open'
alias n='nvim'
alias v='vim'
alias cat='lolcat'
alias py='python'
alias df='df -h'
alias d="cd ~/Desktop/onedayday/summary"
alias e="cd ~/Desktop/onedayday/summary/goLang/go_Language/go_src"
alias q="cd ~/Desktop/graduation"
alias mycli="mycli -u mydb -p 1234"
# pgcli -U postgres -h 127.0.0.1 -p 54321 # pgcli 不能使用 快捷方式,挺奇怪的
alias pgcli="pgcli -U postgres -h 127.0.0.1 -p 5432"
# alias pgcli="pgcli -U postgres -h 39.100.122.119 -p 5432"
# 备份
# pg_dump -h 39.100.122.119 -U postgres shelf_identification > a.sql
# mapvision604
# 使用备份 恢复

alias lzd="lazydocker"
alias lzg="lazygit"
alias tar="tar --use-compress-program=pigz"
alias f="fswatch"
alias t="tldr"
alias task="asynctask -f"
bind '"\e[15~":"task\n"'






# set -o vi

# 在 archlinux 使用java 安卓需要配置环境变量，但是第一次打开的时候需要用root用户打开，因为需要在普通用户无权访问的文件夹内下载文件

# go 语言PATH 
export GOPATH="$HOME/go:$HOME/Desktop/web/goWeb"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export GO111MODULE=on
export GOPROXY=https://goproxy.cn   ## go mod 设置国内代理,

source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

# z 使用
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh


# npm 淘包镜像
# npm config set regitry https://regitry.npm.taobao.org
# npm 官方镜像
# npm config set regitry https://regitry.npmjs.org/


# FZF 配置

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# 在 ~/.bash_profile文件添加
# yay -Syu

