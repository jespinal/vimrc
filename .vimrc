version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <Nul> <C-Space>
inoremap <expr> <Up> pumvisible() ? "\" : "\<Up>"
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\<S-Tab>"
inoremap <expr> <Down> pumvisible() ? "\" : "\<Down>"
nnoremap \d :YcmShowDetailedDiagnostic
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
inoremap <expr> 	 pumvisible() ? "\" : "\	"
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set cindent
set completeopt=preview,menuone
set cpoptions=aAceFsB
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set nomodeline
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,~/.vim/plugged/typescript-vim/,~/.vim/plugged/YouCompleteMe/,~/.vim/plugged/phpcomplete.vim/,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set shiftwidth=4
set shortmess=filnxtToOc
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=4
set tags=./tags,./TAGS,tags,TAGS,/home/jespinal/hostpapa/hpcms-tags
" vim: set ft=vim :

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'leafgarland/typescript-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'osfameron/perl-tags'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
"Plug 'tpope/vim-fugitive'
"Plug 'tobyS/pdv'
call plug#end()

" ============================================
" Syntastic configuration
" ============================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"let g:syntastic_php_checkers = ['php']
let g:syntastic_php_checkers = ['php','phpcs']
let g:syntastic_sh_checkers = ['bashate']
let g:ycm_collect_identifiers_from_tags_files = 1 

" ============================================
" Airline
" ============================================
let g:airline#extensions#tagbar#flags = 'f'  " show function name in status bar

" ============================================
" NERDTree
" ============================================
" In order to have NERDTree automatically start when vim starts up
" autocmd vimenter * NERDTree

nnoremap <F9> :!%:p<Enter>

" In many terminal emulators the mouse works just fine, use this to enable it 
if has('mouse')
    "set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else
  set autoindent        " always set autoindenting on
endif " has("autocmd")
