"global setting"
"去掉vi一致性"
set nocompatible
set nu "显示行号"
"隐藏滚动条"
"set guioptions-=r
"set guioptions-=L
"set guioptions-=b

colorscheme PaperColor
set background=light

set t_Co=256 "使得ssh可以显示vim主题颜色"
set showtabline=0 "隐藏顶部标签栏"
set guifont=Monaco:h15 "设置字体"
syntax on "开启语法高亮
set nowrap "设置不折叠行"
set fileformat=unix "设置一Unix的格式保存文件"
set cindent "设置c样式缩进"
set tabstop=4 "设置tab长度"
set shiftwidth=4
set showmatch "显示括号匹配"
set fenc=utf-8 "设置文件编码"
"set mouse=a "启用鼠标
set selection=exclusive
set selectmode=mouse,key
set hlsearch "高亮搜索"
set cursorline  "突出显示当前行"
"set cursorcolumn "突出显示当前列
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
set autoread
set confirm "处理未保存或者只读文件时，给出提示
set smartindent "智能对齐
set termencoding=utf-8

"Vundle"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'tomasr/molokai'
call vundle#end()
filetype plugin indent on

"YCM
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
"关闭自动弹出函数原型预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
"自动补全的弹出窗口配色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
set backspace=indent,eol,start "解决后退键失效

"ale
let g:ale_set_highlights = 0

"about python"
set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python
au BufWrite * :Autoformat   "保存文件时格式化代码

"定义括号自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function CloseBracket()
    if match(getline(line('.') + 1), '\s*}') < 0
        return "\<CR>}"
    else
        return "\<Esc>j0f}a"
    endif
endf

function QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        return a:char
    elseif line[col - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<Esc>i"
    endif
endf

"一键编译运行程序”
" <F5> 编译和运行C
map <f5> :call CompileRunGcc()<cr>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    exec "! ./%<"
endfunc

"<F6> 编译和运行C++
map <f6> :call CompileRunGpp()<cr>
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<"
endfunc

" <F7> 运行python程序
map <f7> :w<cr>:!python %<cr>

" <F8> 运行shell程序
map <f8> :call CompileRunSH()<cr>
func! CompileRunSH()
    exec "w"
    exec "!chmod a+x %"
    exec "!./%"
endfunc

"<F9>  gdb调试
map <f9> :call Debug()<cr>
func!  Debug()
    exec "w"
    exec "!gcc % -o %< -gstabs+"
    exec "!gdb %<"
endfunc
