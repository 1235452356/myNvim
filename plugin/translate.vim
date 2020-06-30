"<c-u> 在选中模式中使用快捷键光标会停留在第一个字符, 不添加则会退回行首

"command! VVn call <SID>FanyiN()
"command! VVv call <SID>FanyiV()
nnoremap <silent> <F3> :<c-u>call FanyiN()<CR>
vnoremap <silent> <F3> :<c-u>call FanyiV()<CR>





"N 模式字典翻译
function! FanyiN()
py3 << EOF
import vim
eng= vim.eval("expand('<cword>')")  # 获取光标所在位置单词
QueryWorld()
EOF
endfunction






"V模式字典翻译
function! FanyiV()
normal! gv"hy
py3 << EOF
#python代码在py3 << EOF 下面
import vim
eng = vim.eval("@h")      # 选中的时候获取单词
QueryWorld()
##python代码在EOF上面
EOF
endfunction



""""""""""""""""""""""""""
"字典翻译接口

py3 << EOF
import re
import pymysql
import sys
import vim
def QueryWorld():
    global eng
    conn = pymysql.connect(host='0.0.0.0', user='mydb', passwd="1234", db='eng')
    cur = conn.cursor()
    cur.execute("SELECT word,translation FROM enwords where word=%s",(eng,))
    result = cur.fetchone()   # 得到的单词及含义
    if result != None:   # 字典中存在单词
        print(result)      ## 如果字典里存在单词则直接输出单词和含义
        return
    else:      # 字典中不存在单词,则对单词进行处理,处理之后再次查询
        #if len(eng) == 5:

        for i in range(-1,-5,-1):
            eng_end_treated = eng[0:i]           ## 获取处理后的单词
            cur.execute("SELECT word,translation FROM enwords where word=%s",(eng_end_treated,))  ## 对处理后的单词进行查询
            result1 = cur.fetchone()         # 查询得到的单词及含义
            if result1 != None:
                print("你要找的单词可能是{}".format(result1))
                return
            elif result1 == None and len(eng_end_treated) != 0 and eng_end_treated[-1] == "i" :
                eng_end_treated_1 = eng[0:i-1] + "y"          ##  进行i变y处理
                cur.execute("SELECT word,translation FROM enwords where word=%s",(eng_end_treated_1,))  ## 对处理后的单词进行查询
                result1 = cur.fetchone()         # 查询得到的单词及含义
                if result1 != None:
                    print("你要找的单词可能是{}".format(result1))
                    return
                else:
                    eng_end_treated_2 = eng[0:i-1] + "e"          ##  进行i变e处理
                    cur.execute("SELECT word,translation FROM enwords where word=%s",(eng_end_treated_2,))  ## 对处理后的单词进行查询
                    result1 = cur.fetchone()         # 查询得到的单词及含义
                    if result1 != None:
                        print("你要找的单词可能是{}".format(result1))
                        return
                    else:
                        pass
            else:                           ## 对后缀处理得不到理想的单词
                pass

        for i in range(1,3,1):
            eng_start_treated = eng[i:]           ## 获取处理后的单词
            cur.execute("SELECT word,translation FROM enwords where word=%s",(eng_start_treated,))  ## 对处理后的单词进行查询
            result2 = cur.fetchone()         # 查询得到的单词及含义
            if result2 != None:
                print("你要找的单词可能是{}".format(result2))
                return
            else:
                pass


    if result2 == None:
        print("{} is not found !!!".format(eng))
        cur.close()
        conn.close()
    else:
        cur.close()
        conn.close()
EOF







""""""""""""""""""""""""""""""""""""""""""""""''""""""""""""""""""""""""""""""""""""""""""""""

" 异步请求网络
nnoremap <silent> <F4> :<c-u>call FanyiNetN()<CR>
vnoremap <silent> <F4> :<c-u>call FanyiNetV()<CR>

function! s:OnEvent1(job_id, data, event) dict
    if a:event == 'stdout'
        if !empty(a:data[0])
            let str = ' 输出: '.join(a:data)
            echo str
        endif
    endif
endfunction

let s:callbacks1 = {
\ 'on_stdout': function('s:OnEvent1'),
\ 'on_stderr': function('s:OnEvent1'),
\ 'on_exit': function('s:OnEvent1')
\ }


function! FanyiNetN()
    let job2 = jobstart(['python', expand('$HOME/.config/nvim/plugin/') . 'translate.py', expand('<cword>'), 0], extend({'shell': 'shell 2'}, s:callbacks1))
endfunction

function! FanyiNetV()
    normal! gv"hy
    let job2 = jobstart(['python', expand('$HOME/.config/nvim/plugin/') . 'translate.py', @h, 0], extend({'shell': 'shell 2'}, s:callbacks1))
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 写入文档
nnoremap <silent> <F5> :<c-u>call FanyiXN()<CR>
vnoremap <silent> <F5> :<c-u>call FanyiXV()<CR>
function! s:OnEvent2(job_id, data, event) dict
    if a:event == 'stdout'
        if !empty(a:data[0])
            let str = ' 输出: '.join(a:data)
            call append(line('.'), a:data)
        endif
    endif
endfunction



let s:callbacks2 = {
\ 'on_stdout': function('s:OnEvent2'),
\ 'on_stderr': function('s:OnEvent2'),
\ 'on_exit': function('s:OnEvent2')
\ }

function! FanyiXN()
    let job2 = jobstart(['python', expand('$HOME/.config/nvim/plugin/') . 'translate.py', expand('<cword>'), 1], extend({'shell': 'shell 2'}, s:callbacks2))
endfunction


function! FanyiXV()
    normal! gv"hy
    let job2 = jobstart(['python', expand('$HOME/.config/nvim/plugin/') . 'translate.py', @h, 1], extend({'shell': 'shell 2'}, s:callbacks2))
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
