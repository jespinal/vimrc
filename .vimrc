scriptencoding utf-8
set encoding=utf-8
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
set wildmenu
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
set tags=./tags;,tags
" vim: set ft=vim :

" ============================================
" https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8
" This terminal options were added to vim
" ============================================
let &t_TI = ""
let &t_TE = ""

" ============================================
" https://github.com/ryanoasis/vim-devicons/issues/359
" Disabling additional terminal options that were apparently added
" 13-Feb-2025: post system upgrade to latest LTS
" ============================================
let &t_RV = ""

" ============================================
" Determining current platform.
" ============================================
let current_platform = substitute(system('uname'), '\n', '', '')

call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeFind' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-vdebug/vdebug'
Plug 'mileszs/ack.vim', { 'on' : 'Ag' }
Plug 'editorconfig/editorconfig-vim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'craigemery/vim-autotag'
"Plug 'lumiliet/vim-twig'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'github/copilot.vim'
"Plug 'puremourning/vimspector'
call plug#end()


" ============================================
" vimspector
" ============================================
" Standard mappings
let g:vimspector_enable_mappings = 'HUMAN'

" ============================================
" Enabling relative line numbers and nomral
" line numbers
" ============================================
set number
set relativenumber

" ============================================
" Setting 'ttimeoutlen' in order to avoid a long timeout
" when Shift-O is pressed.
" ============================================
"
" The time in milliseconds that is waited for a key code or mapped key
" sequence to complete.  Also used for CTRL-\ CTRL-N and CTRL-\ CTRL-G
" when part of a command has been typed.
"
" Normally only 'timeoutlen' is used and 'ttimeoutlen' is -1.  When a
" different timeout value for key codes is desired set 'ttimeoutlen' to
" a non-negative number.
"
" ttimeoutlen	mapping delay	   key code delay	~
"     < 0		'timeoutlen'	   'timeoutlen'
"     >= 0		'timeoutlen'	   'ttimeoutlen'
"
" The timeout only happens when the 'timeout' and 'ttimeout' options
" tell so.  A useful setting would be >
"     :set timeout timeoutlen=3000 ttimeoutlen=100
" ============================================
set ttimeoutlen=100

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
"au FileType php,html setlocal makeprg=~/bin/phan_client\ --daemonize-socket\ /var/run/user/1000/phan.socket
au FileType php,html setlocal makeprg=~/bin/phan_client\ --daemonize-tcp-port\ default
au FileType php,html setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G

au! BufWritePost  *.php,*.html    call PHPsynCHK()

function! PHPsynCHK()
  let winnum =winnr() " get current window number
  " or 'silent make --disable-usage-on-error -l %' in Phan 0.12.3+
  silent make! -l %
  cw " open the error window if it contains an error. Don't limit the number of lines.
  " return to the window with cursor set on the line of the first error (if any)
  execute winnum . "wincmd w"
  :redraw!
endfunction

" ============================================
" Vim Colorscheme configuration
" ============================================
colorscheme tender
"colorscheme OceanicNext

" ============================================
" VimDiff configuration
" ============================================
" Setting default colorscheme for vimdiff
if &diff
    colorscheme default
    hi DiffAdd      ctermfg=White     ctermbg=DarkGreen
    hi DiffDelete   ctermfg=LightBlue ctermbg=NONE
    hi DiffText     ctermfg=White     ctermbg=DarkCyan " This applies only to the changed text, not the entire line.
    hi DiffChange   ctermfg=White     ctermbg=DarkCyan
endif

" ============================================
" Gvim color scheme
" ============================================
if has("gui_running")
    if filereadable(expand('~/.gvimrc'))
        source ~/.gvimrc
    else
        echo "Local Gvim overrides file not found (ignoring)"
    endif

    colorscheme OceanicNext
    "colorscheme elfond
    "colorscheme darkblue
    "colorscheme industry
    "colorscheme koeller
    "colorscheme murphy
    "colorscheme slate
    "colorscheme torte
endif

" ============================================
" Copilot
" ============================================
let g:copilot_enabled = v:false

" ============================================
" ALE
" https://github.com/dense-analysis/ale
" ============================================
" ALE also offers its own automatic completion support, which does not require
" any other plugins, and can be enabled by changing a setting before ALE is
" loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
" let g:ale_completion_enabled = 1
"
" Note: YCM is a dedicated, powerful completer (backed by Clang, Jedi,
" TSServer, etc.) and generally faster/more accurate for code completion.
let g:ale_completion_enabled = 0

" ALE supports automatic imports from external modules. This behavior is
" enabled by default and can be disabled by setting:
" let g:ale_completion_autoimport = 0

" You configure your fixers from vimrc using g:ale_fixers, before or after ALE
" has been loaded.
"
" A * in place of the filetype will apply a List of fixers to all files which
" do not match some filetype in the Dictionary.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\}

" If you want to automatically fix files when you save them, you need to turn
" a setting on in vimrc.
let g:ale_fix_on_save = 1

" vim-airline integrates with ALE for displaying error information in the status
" bar. If you want to see the status for ALE in a nice format, it is recommended
" to use vim-airline with ALE.

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1"

" By default, ALE displays errors and warnings with virtual text. The problems
" ALE shows appear with comment-like syntax after every problem found. You can
" set ALE to only show problems where the cursor currently lies like so.
"
" let g:ale_virtualtext_cursor = 'current'
"
" If you want to disable virtual text completely, apply the following.
"
" let g:ale_virtualtext_cursor = 'disabled'

" ============================================
" YouCompleteMe
" ============================================
" LSP configuration
"
" Note: this is a symlink to my \$HOME/bin folder
"
if !exists("g:ycm_language_server")
    let g:ycm_language_server = []
endif
let g:ycm_language_server += [
\   {
\     'name': 'php',
\     'cmdline': ['/usr/bin/php8.2', '/home/jespinal/bin/phpactor', 'language-server' ],
\     'filetypes': [ 'php' ],
\   },
\ ]

let g:ycm_collect_identifiers_from_tags_files = 1

" https://github.com/Microsoft/TypeScript/wiki/TypeScript-Editor-Support#vim
if !exists("g:ycm_semantic_triggers")
     let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers =  {
  \   'typescript': ['.'],
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

" By default, semantic completion is triggered automatically after typing
" ., -> and :: in insert mode (if semantic completion support has been compiled
" in). This key mapping can be used to trigger semantic completion anywhere.
" Useful for searching for top-level functions and classes.
let g:ycm_key_invoke_completion = '<C-Space>'

" By unsetting this option you can ensure that the omnicompletion engine is
" re-queried on every keypress.
let g:ycm_cache_omnifunc = 0

let g:ycm_autoclose_preview_window_after_completion = 1

" Turning off Hover window by default
let g:ycm_auto_hover=''

" The logging level that YCM and the ycmd completion server use.
" Valid values are the following, from most verbose to least verbose: - debug - info - warning - error - critical
let g:ycm_log_level='critical'

nmap <leader>D <plug>(YCMHover)

" Since ALE shows lint errors, you can disable YCM's diagnostics to reduce noise:
" let g:ycm_show_diagnostics_ui = 0  " Let ALE handle errors/warnings

" Tweaking the fg and bg colors in color terminals in order
" to have it looking more like ErrorMsg than SpellBad, which
" looks horrible in dark terminals
:hi SyntasticError ctermbg=1 ctermfg=15
:hi SyntasticWarning cterm=NONE

" ============================================
" Tabs remaping
" ============================================
" Remaping tabs switching to capital H and capital L
nnoremap H gT
nnoremap L gt

" ============================================
" Using jk combination as "esc" key
" ============================================
inoremap jk <esc>
inoremap kj <esc>

" ============================================
" Enclosing words into "", {}, and ()
" ============================================
nmap \" <Esc>Bvexi""<Esc>P
nmap \( <Esc>Bvexi()<Esc>P
nmap \{ <Esc>Bvexi{}<Esc>P

" ============================================
" Smarty Templates
" ============================================
" site: https://github.com/vim-scripts/smarty.vim
"
au BufRead,BufNewFile *.tpl set filetype=smarty
au Filetype smarty exec('set dictionary=~/.vim/syntax/smarty.vim')
au Filetype smarty set complete+=k

" Enabling Smarty template format for SilverStripe
au BufNewFile,BufRead *.ss set filetype=smarty

"" Set the filetype based on the file's extension, overriding any
"" 'filetype' that has already been set
"au BufRead,BufNewFile *.html.twig set filetype=html

" ============================================
" Airline
" ============================================
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#tagbar#flags='f'  " show function name in status bar
let g:airline#extensions#gutentags#enabled = 1

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
" Gutentags
" ============================================
"let g:gutentags_ctags_executable = "~/bin/ctags"
"let g:gutentags_trace = 0
"let g:gutentags_project_root = [
"    \ 'hostpapa',
"\]
"
"let g:gutentags_add_default_project_roots = 1
"
"let g:gutentags_ctags_exclude = [
"    \ 'themes/*',
"    \ 'puphpet/*',
"    \ 'vendor/*',
"    \ 'googlesitemaps/*',
"    \ 'minify/*',
"    \ 'Landers/*',
"    \ 'sqlite3/*',
"    \ 'phpunit/*',
"    \ 'framework/thirdparty*',
"    \ 'bootstrap-forms*'
"\]

"============================================
" GitGutter
"============================================
"
" Customizing the signal column:
"
" Note: these colors can be specified as hexadecimal
" values, or as a value from the highlight-ctermbg palette.
" gnome-terminal tends to overwrite the palette with the current
" theme colors
"
" a. Removing the console-terminal-background
" b. Setting additions foreground color green
" c. Setting changes foreground color skyblue
" d. Setting delete to red
"
:hi SignColumn   term=bold ctermbg=NONE
:hi GitGutterAdd term=bold ctermfg=2
:hi GitGutterChange term=bold ctermfg=4
:hi GitGutterDelete term=bold ctermfg=1

if current_platform == "FreeBSD"
    let g:gitgutter_git_executable = '/usr/local/bin/git'
elseif current_platform == "Linux"
    let g:gitgutter_git_executable = '/usr/bin/git'
endif

" Get a list of counts of added, modified, and removed lines in the current buffer
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

let g:gitgutter_max_signs = -1

"============================================
" NERDTree
"============================================
" In order to have NERDTree automatically start when vim starts up
" autocmd vimenter * NERDTree

" ============================================
" SystemD syntax highlight
" ============================================
autocmd BufNewFile,BufRead *.service* set ft=systemd

" ============================================
" Vdebug
" ============================================
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9500
let g:vdebug_options.path_maps = {
    \ "/var/www/local.srv.hostpapa/legacy" : "/var/www/html/hostpapa/hplegacy",
    \ "/var/www/local.srv.hostpapa/cms/current" : "/var/www/html/hostpapa/hpcms",
    \ "/var/www/local.srv.oneplan/current/" : "/var/www/html/hostpapa/opsite",
    \ "/var/www/local.srv.support/current/" : "/var/www/html/hostpapa/kbwordpress",
    "\ "/var/www/ubersmith_root/app/custom/plugins/psg-uber-payment-gateway-plugin" : "/var/www/html/hostpapa/hp-ubersmith-payment-gw-plugin",
\ }

let g:vdebug_options.break_on_open = 0
let g:vdebug_options.debug_file = "/tmp/vdebug.log"
let g:vdebug_options.debug_file_level = 4
"let g:vdebug_options.vdebug_force_ascii = 1

" :help Vdebug, #VdebugFeatures:
" https://xdebug.org/docs/dbgp#feature-names
"
" The DBGP protocol allows you to set features for debugging, such as the max
" length of data that the debugger returns. You can set these features in the Vim
" dictionary g:vdebug_features, and they will be sent to the debugger when you
" start a new debugging session.
"
" For example:
"    let g:vdebug_features['max_depth'] = 2048
"
" max number of array or object children to initially retrieve
let g:vdebug_features = { 'max_children': 512 }

" ============================================
" Replacement for 'omnifunc'
" ============================================
"
if has("autocmd") && exists("+omnifunc")
autocmd FileType php,html
        \	if &omnifunc == "" |
        \       setlocal omnifunc=phpactor#Complete |
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
if current_platform == "FreeBSD"
    set rtp+=/usr/local/bin/fzf
elseif current_platform == "Linux"
    set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
endif

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

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

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
    set mouse-=a
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
