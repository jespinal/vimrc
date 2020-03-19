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
set tags=./tags,./TAGS,tags,TAGS,~/hostpapa/hpcms-tags,~/hostpapa/hpangularform-tags
" vim: set ft=vim :

call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'osfameron/perl-tags'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTree' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-vdebug/vdebug'
Plug 'mileszs/ack.vim', { 'on' : 'Ag' }
Plug 'shawncplus/phpcomplete.vim'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

"set number
"set relativenumber

" ============================================
" Phan + vim
" ============================================
" https://github.com/phan/phan/blob/master/plugins/vim/phansnippet.vim
"
" Standalone vim snippet for php and html files.
"
" May conflict with other syntax checking plugins.
" Need to use absolute path to phan_client, or put it in your path (E.g. $HOME/bin/phan_client)
" This is based off of a snippet mentioned on http://vim.wikia.com/wiki/Runtime_syntax_check_for_php

" Note: in Neovim, instead use %m\ in\ %f\ on\ line\ %l
au FileType php,html setlocal makeprg=~/bin/phan_client
au FileType php,html setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G

au! BufWritePost  *.php,*.html    call PHPsynCHK()

function! PHPsynCHK()
  let winnum =winnr() " get current window number
  " or 'silent make --disable-usage-on-error -l %' in Phan 0.12.3+
  silent make -l %
  cw " open the error window if it contains an error. Don't limit the number of lines.
  " return to the window with cursor set on the line of the first error (if any)
  execute winnum . "wincmd w"
  :redraw!
endfunction

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

" Tweaking the fg and bg colors in color terminals in order
" to have it looking more like ErrorMsg than SpellBad, which
" looks horrible in dark terminals
:hi SyntasticError ctermbg=1 ctermfg=15

" Remaping tabs switching to capital H and capital L
nnoremap H gT
nnoremap L gt

" Enabling Smarty template format
" site: https://github.com/vim-scripts/smarty.vim
"
au BufRead,BufNewFile *.tpl set filetype=smarty
au Filetype smarty exec('set dictionary=~/.vim/syntax/smarty.vim')
au Filetype smarty set complete+=k

" Enabling Smarty template format for SilverStripe
au BufNewFile,BufRead *.ss set filetype=smarty

"" Go to last file(s) if invoked without arguments.
"autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"    \ call mkdir($HOME . "/.vim") |
"    \ endif |
"    \ execute "mksession! " . $HOME . "/.vim/Session.vim"
"
"autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"    \ execute "source " . $HOME . "/.vim/Session.vim"

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

"============================================
" NERDTree
"============================================
" In order to have NERDTree automatically start when vim starts up
" autocmd vimenter * NERDTree

" ============================================
" Vdebug
" ============================================
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9000
let g:vdebug_options.path_maps = {
            \ "/var/www/local.srv.hostpapa/cms/current" : "/var/www/html/hpcms",
            \ "/var/www/local.srv.oneplan/current/" : "/var/www/html/opsite",
            \ "/var/www/local.srv.support/current/" : "/var/www/html/kbwordpress",
\ }

let g:vdebug_options.break_on_open = 0

" ============================================
" phpcomplete.vim (replacement for 'omnifunc', for YouCompleteMe
" ============================================
"
if has("autocmd") && exists("+omnifunc")
autocmd FileType *
        \	if &omnifunc == "" |
        "\		setlocal omnifunc=syntaxcomplete#Complete |
        \		setlocal omnifunc=phpcomplete#Complete |
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
" Fuzzy Finder: installed via Linuxbrew
" ============================================
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" ============================================
" Highlight variable under the cursor
" ============================================
" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch
set nohls

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
