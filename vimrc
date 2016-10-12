"run git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"run vim +PluginInstall +qall
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'

call vundle#end()            " required
filetype plugin indent on    " required

"for airline to display properly in tmux
set t_Co=256
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
"indent for python
autocmd Filetype python setlocal ts=4 sts=4 sw=4

"highlight tab
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

let mapleader = ","

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

map <leader>e :e `pwd`<cr>
map <leader>n :tabn<cr>
map <leader>p :tabp<cr>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 5gt
map <leader>7 5gt
map <leader>8 5gt
map <leader>9 5gt
"map <leader>u :MRU<cr>
"map <leader>? :FufFile<cr>
"map <leader>f :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
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

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Gif config
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
