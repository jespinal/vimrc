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
set shiftwidth=4
set shortmess=filnxtToOc
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=4
set tags=./tags,./TAGS,tags,TAGS,/home/jespinal/hostpapa/hpcms-tags,/home/jespinal/hostpapa/hpangularform-tags
" vim: set ft=vim :

call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'osfameron/perl-tags'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-vdebug/vdebug'
Plug 'mileszs/ack.vim'
call plug#end()

" ============================================
" Syntastic configuration
" ============================================
" When using 'airline' you should NOT follow the recommendation outlined in
" the |syntastic-statusline-flag| section above to modify your |'statusline'|.
" airline" shall make all necessary changes automatically.
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers = ['php']
let g:syntastic_enable_perl_checker = 1
let g:ycm_collect_identifiers_from_tags_files = 1 

" https://github.com/Microsoft/TypeScript/wiki/TypeScript-Editor-Support#vim
if !exists("g:ycm_semantic_triggers")
     let g:ycm_semantic_triggers = {}
 endif
" let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_semantic_triggers =  {
  \   'typescript': ['.'],
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }


" ============================================
" Airline
" ============================================
let g:airline#extensions#tagbar#enabled=1 
let g:airline#extensions#tagbar#flags='f'  " show function name in status bar

" ============================================
" Airline Theme
" ============================================
let g:airline_theme='angr'

" ============================================
" Tagbar
" ============================================
let g:tagbar_ctags_bin='~/bin/ctags'

" Typescript ctags support 
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" ============================================
" NERDTree
" ============================================
" In order to have NERDTree automatically start when vim starts up
" autocmd vimenter * NERDTree

" ============================================
" Vdebug
" ============================================
if !exists('g:vdebug_options')
	let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9000
let g:vdebug_options.path_maps = { "/var/www/local.srv.hostpapa/cms/current" : "/var/www/html/hpcms" }

" ============================================
" phpcomplete.vim (replacement for 'omnifunc', for YouCompleteMe
" ============================================
"
if has("autocmd") && exists("+omnifunc")
autocmd FileType *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif

" ============================================
" Ack.vim (configuration needed for _ag_)
" Note: there's a slight modification in ack.vim where I duplicated the
" `command` lines at the end, and changed the handler from Ack to Ag
" (s/Ack/Ag/)
" ============================================
if executable("ag")
    let g:ackprg = "ag --nogroup --nocolor --column"
endif

" ============================================
" Highlight variable under the cursor
" ============================================
" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


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
  " autocmd FileType text setlocal textwidth=78

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
