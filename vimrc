"set cindent
"set t_Co=256
"colorscheme torte
syntax on
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
"set autoindent 
set ruler
set ls=2
set bg=dark
set nowrap
set nocompatible
set ignorecase
set scrolloff=2
set backspace=2
set pastetoggle=<F2>
set hlsearch
set nobackup
set nowb
set noswapfile
"remove trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.tpl :%s/\s\+$//e
"compile coffee script
autocmd BufWritePost,FileWritePost *.coffee !coffee -c <afile>

"auto indent for py"
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"highlight tab
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

"highlight > 80
"autocmd BufRead *.py highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"autocmd BufRead *.py match OverLength /\%81v.\+/

call pathogen#infect()
filetype plugin indent on
filetype plugin on
filetype indent on

let mapleader = ","
"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/vim_local/vimrc

"Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit `pwd`<cr>
map <leader>tc :tabclose<cr>
map <leader>m :marks<cr>
map <leader>tm :tabmove 
map <leader>q :q!<cr>
map <leader>w :w!<cr>
map <leader>i [I
try
set switchbuf=usetab
set stal=2
catch
endtry

map e :e `pwd`
map <leader>n :tabn<cr>
map <leader>p :tabp<cr>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <F11> :MRU<cr>
map <leader>? :FufFile<cr>
map <leader>f :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <leader>c :ccl<CR>
map <leader>t :TlistToggle<cr>
map <leader>r :call ToggleWrap()<cr>
let MRU_Max_Entries = 20

noremap <Space> <PageDown>
if has('statusline')
    " Status line detail:
    " %f    file path
    " %y    file type between braces (if defined)
    " %([%R%M]%)  read-only, modified and modifiable flags between braces
    " %{'!'[&ff=='default_file_format']}
    "     shows a '!' if the file format is not the platform
    "     default
    " %{'$'[!&list]}  shows a '*' if in list mode
    " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
    "     only for debug : display the current syntax item name
    " %=    right-align following items
    " #%n   buffer number
    " %l/%L,%c%V  line number, total number of lines, and column number
    function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
        "let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%=#%n %l/%L,%c%V [%{strlen(&ft)?&ft:'none'}/%{&encoding}/%{&fileformat}]"
        let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}  #%n %l/%L,%c%V [%{strlen(&ft)?&ft:'none'}/%{&encoding}/%{&fileformat}]"
      else
        "let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V [%{strlen(&ft
        let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})  #%n %l/%L,%c%V [%{strlen(&ft
      endif
    endfunc

    " Switch between the normal and vim-debug modes in the status line
    nmap _ds :call SetStatusLineStyle()<CR>
    call SetStatusLineStyle()
    " Window title
    if has('title')
  set titlestring=%t%(\ [%R%M]%)
    endif
endif

"tab auto completion
highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30
fun! InsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
 return "\<tab>"
 else
 return "\<c-p>"
 endif
endfun

fun! ShiftInsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
 return "\<s-tab>"
 else
 return "\<c-n>"
 endif
endfun

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-r>=ShiftInsertTabWrapper()<cr>
set dictionary+=dict.file
set dictionary+=%
set iskeyword+=:
set complete+=k

"end tab auto completion

" enables real tabs for Makefiles only
augroup Makefile
au!
au BufReadPre Makefile set noexpandtab
augroup END

" vim -b : edit binary using xxd-format!
augroup Binary
au!
au BufReadPre  *.bin let &bin=1
au BufReadPost *.bin if &bin | %!xxd
au BufReadPost *.bin set ft=xxd | endif
au BufWritePre *.bin if &bin | %!xxd -r
au BufWritePre *.bin endif
au BufWritePost *.bin if &bin | %!xxd
au BufWritePost *.bin set nomod | endif
augroup END

" remap split screen navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
function ToggleWrap()
 if (&wrap == 1)
   set nowrap
 else
   set wrap
 endif
endfunction
