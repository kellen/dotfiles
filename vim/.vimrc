set runtimepath+=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after 
set nocompatible

" Vundle settings 
"filetype off

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

"Bundle 'gmarik/vundle'
"Bundle 'msanders/snipmate.vim'
"Bundle 'mattn/zencoding-vim'
"Bundle 'tpope/vim-surround'
"Bundle 'scrooloose/nerdtree'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" youcompleteme
"Bundle 'Valloric/YouCompleteMe'
" solarized color scheme
"Bundle 'altercation/vim-colors-solarized'

" KELLEN VIMRC settings

" ensure directory exists
" from: http://stackoverflow.com/a/8462159/320220
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
      echo "Created directory: " . a:dir
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction

set backup
set backupdir=~/.vim/backup
call EnsureDirExists(&backupdir)
set directory=~/.vim/tmp
call EnsureDirExists(&directory)

" trying to fix slow scrolling:
set nowrap
set nocursorline
set ttyfast
set lazyredraw
" reduce syntax highlighting to first 120 chars
"set synmaxcol=120
syntax sync minlines=256
set scrolljump=5

" basic settings
set fileencodings=ucs-bom,utf-8,big5,gb18030
set encoding=utf-8
set hlsearch
set number
set ruler
set bs=2
"set mouse=a
"set ttymouse=xterm2
set wildmode=longest,list,full
set wildmenu

" turn on color
if &term =~ "xterm" || &term =~ "screen"
 set t_Co=256
 " turn off background-color erase for tmux/screen
 " http://sunaku.github.io/vim-256color-bce.html
 set t_ut=
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

" syntax highlighting
colorscheme herald
syntax on
let python_highlight_all=1
" disable ugly syntax highlighting
" DOESN'T WORK :(
"if &t_Co == 256
highlight texItalStyle      ctermbg=234  ctermfg=252   cterm=none
highlight texBoldStyle      ctermbg=234  ctermfg=252   cterm=none
highlight texBoldItalStyle  ctermbg=234  ctermfg=252   cterm=none
highlight texItalBoldStyle  ctermbg=234  ctermfg=252   cterm=none
"endif

" fixing spacing/indenting
filetype indent on
set autoindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
" expand tabs except for fucking Makefiles
set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" wrap long lines for tex files
au BufRead,BufNewFile *.tex set wrap
" assume latex rather than tex
let g:tex_flavor = "latex"

" remap Q to disable ex-mode
map Q <Nop>

" binding for indenting the entire file w/o moving the cursor
nnoremap g= :let b:PlugView=winsaveview()<CR>gg=G:call winrestview(b:PlugView) <CR>:echo "file indented"<CR>
" binding to show the current syntax highlighting properties under the cursor:
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.elm,*.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" detect elm files
au BufNewFile,BufRead *.elm set filetype=elm

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
au BufNewFile * set fileformat=unix
