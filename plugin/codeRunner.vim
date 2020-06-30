nnoremap <C-n> :call RunCode()<CR>
func! RunCode()
    "  图片和latex文件打开时,图片的中文路径会乱码.有中文路径,中文名称的图片不能使用, 有中文路径的latex文件不能生成pdf文件
    if &filetype == 'python'
		exec "w"
        " exec "!time python %"
        py3file %
    endif
    if &filetype == 'go'
		exec "w"
        exec "GoRun %"
        " exec "wincmd h"
    endif
    if &filetype == 'markdown'
        exec ":MarkdownPreview"
    endif
    if &filetype == 'vim'
        exec "w"
        exec "source %" 
    endif
    if &filetype == 'sh'
        exec "w"
        exec "!time bash %" 
    endif
    if &filetype == 'html'
        exec "w"
        exec "!time xdg-open %" 
    endif
    if &filetype == 'java'
        exec "w"
        exec "!time javac % && java %:r" 
    endif
    if &filetype == 'pdf'
        exec "!time xdg-open %"
    endif
    if &filetype == 'conf'
        exec "!time xdg-open %"
    endif
    if &filetype == 'jpg'
        "exec "!time xdg-open %"
        exec "!time xdg-open ".iconv('"'.@%.'"','UTF-8','cp936')
    endif
    if &filetype == 'jpeg'
        "exec "!time xdg-open %"
        exec "!time xdg-open ".iconv('"'.@%.'"','UTF-8','cp936')
    endif
    if &filetype == 'png'
        "exec "!time xdg-open %"
        exec "!time xdg-open ".iconv('"'.@%.'"','UTF-8','cp936')
    endif
    if &filetype == 'tex'
		exec "w"
        exec "!pdflatex % & xdg-open %:r.pdf"
    endif
endfunc


nnoremap <c-b> :call RunImport()<CR>
func! RunImport()
    if &filetype == 'go'
		exec "w"
        exec "GoImports"
    endif
endfunc



" 终端
nnoremap <c-f> :call RunTerm()<CR>
tnoremap <c-k> <c-\><c-n><c-w><c-k>
tnoremap <c-j> <c-\><c-n><c-w><c-j>
tnoremap <c-l> <c-\><c-n><c-w><c-l>
tnoremap <c-h> <c-\><c-n><c-w><c-h>
tnoremap we <c-\><c-n>:bd!<CR>
func! RunTerm()
    :w
    :sp
    :wincmd j
    " :res 10
    :te
    normal! a
endfunc


nnoremap <silent> e w
nmap <silent> we :q<CR>
nmap <silent> wa :qa<CR>
nmap <silent> ww :w<CR>
" nmap <f9> :set paste<CR>
" nmap <f10> :set nopaste<CR>
" 在 nvim中 粘贴不需要考虑 set paste

nmap <f9> :set foldlevel=99<CR>
nmap <f10> :set foldlevel=0<CR>



"在四个格子中快速切换
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h

" 在标签页中 快速切换
nmap g1 1gt
nmap g2 2gt
nmap g3 3gt
nmap g4 4gt
nmap g5 5gt
nmap g6 6gt
nmap g7 7gt
nmap g8 8gt
nmap g9 9gt


nmap <silent> <c-p> :tabnew<CR>

"没有必要, gt 切换标签
"nmap <silent> <c-P> :tabclose<CR>
"nmap <silent> <leader>p :tabp<CR>
"nmap <silent> <leader>n :tabn<CR>


" 设置文件格式识别
au BufNewFile,BufRead *.jpg,*.jpeg set filetype=jpg
au BufNewFile,BufRead *.png set filetype=png


