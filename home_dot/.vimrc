if !1 | finish | endif

" basic settings{{{1
set nocompatible
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
language message C
language time C
set langmenu=none
let g:mapleader = ','
set t_Co=256
set cindent
set vb t_vb=
set nobackup
set backupskip=/tmp/*,/private/tmp/*
set swapfile
if !isdirectory($HOME . '/.vim_swap')
  call mkdir($HOME . '/.vim_swap', 'p')
endif
set directory=~/.vim_swap
if has('persistent_undo')
  if !isdirectory($HOME . '/.vim_undo')
    call mkdir($HOME . '/.vim_undo', 'p')
  endif
  set undodir=~/.vim_undo
  set undofile
endif
set ruler
set laststatus=2
set notitle
set noequalalways
set backspace=indent,eol,start
set history=100
set autoread
set wildmenu
set incsearch
set hlsearch
set ignorecase
set smartcase
" set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set shiftround
set foldmethod=marker
set foldlevel=0
set formatoptions+=r
set cinoptions=(0,g0,t0
set keywordprg=:help
set splitright
set splitbelow
set completeopt-=preview
"set virtualedit+=block
set nrformats=hex,alpha
set lazyredraw
set ttyfast
set updatetime=300
set timeoutlen=500
set ttimeout
set ttimeoutlen=50
set display=lastline
set statusline=%f%m%=\ %-14.(%l,%v%)\ %P
" set pumheight=5
set spelllang+=cjk
set matchpairs+=（:）,「:」,『:』,＜:＞,【:】
set hidden
set clipboard=unnamed
set mouse=
set noshowcmd
set conceallevel=0
set concealcursor=
set list
set listchars=tab:>\･
"set synmaxcol=200
set guicursor=
"set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
"autocmd VimLeave * set guicursor=a:block-blinkon1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
syntax enable
autocmd ColorScheme * highlight Normal cterm=none ctermfg=231 ctermbg=none gui=none guifg=#fffeeb guibg=#020814
autocmd ColorScheme * highlight Ignore cterm=none ctermfg=231 gui=none guifg=#fffeeb
autocmd ColorScheme * highlight EndOfBuffer cterm=none ctermfg=242 gui=none guifg=#fffeeb
autocmd ColorScheme * highlight TabLineFill cterm=reverse ctermfg=242 gui=reverse guifg=#3a4b5c
autocmd ColorScheme * highlight ZenkakuSpace cterm=none ctermbg=9 gui=none guibg=#ff0000
autocmd ColorScheme * highlight TabString cterm=none ctermbg=238 gui=none guibg=#303030
autocmd ColorScheme * highlight TrailingSpaces term=underline ctermbg=238 guibg=#444444
" autocmd ColorScheme * highlight ALEError ctermbg=167 guibg=#ab6560
autocmd ColorScheme * highlight ALEError ctermbg=89 guibg=#ab6560
" autocmd ColorScheme * highlight ALEErrorSign cterm=bold ctermfg=235 ctermbg=167 gui=bold guifg=#3a4b5c guibg=#ab6560
autocmd ColorScheme * highlight ALEErrorSign cterm=bold ctermfg=235 ctermbg=89 gui=bold guifg=#3a4b5c guibg=#ab6560
autocmd VimEnter,WinEnter * let w:m1 = matchadd("TabString", '	')
autocmd VimEnter,WinEnter * let w:m2 = matchadd("ZenkakuSpace", '　')
autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
    \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif
autocmd WinEnter * checktime

autocmd SwapExists * let v:swapchoice = 'o'

augroup vimrc-misc
  autocmd!
  autocmd BufReadPost
  \ * if line("'\"") && line("'\"") <= line('$')
  \ |   execute 'normal! g`"'
  \ | endif
augroup END

function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" key mapping{{{1
noremap ; :
nnoremap <silent><Space> <PageDown>
nnoremap <silent><C-Space> <C-w>p<PageDown><C-w>p
nnoremap <C-w>* <C-w>s*
nnoremap <C-w># <C-w>s#
nnoremap Y y$
nnoremap <silent><C-j> :<C-u>bnext<CR>
nnoremap <silent><C-k> :<C-u>bprevious<CR>
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>
inoremap <C-j> <CR>
cnoremap <C-j> <CR>
inoremap <C-h> <BS>
inoremap <M-d> <C-o>de
inoremap <C-f> <C-o>l
inoremap <M-f> <C-o>w
inoremap <C-b> <C-o>h
inoremap <M-b> <C-o>b
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-_> <ESC>
inoremap <C-/> <ESC>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
" inoremap <C-r>+ <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>
inoremap <C-d> <C-o>x

" filetype detect settings{{{1
autocmd BufNewFile,BufRead *.dart set filetype=dart
autocmd BufNewFile,BufRead *.io set filetype=io
autocmd BufNewFile,BufRead lighttpd.conf set filetype=lighttpd
autocmd BufNewFile,BufRead *.m set filetype=objc
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.{atd,mly} set filetype=ocaml
autocmd BufNewFile,BufRead *.{cgi,t} set filetype=perl
autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd BufNewFile,BufRead *.test set filetype=text
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.toml set filetype=toml

" vim-plug{{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'nixprime/cpsm', { 'do' : 'PY3=ON ./install.sh' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'for' : 'go', 'do': 'make' }
else
  Plug 'Shougo/neocomplete.vim'
endif
Plug 'AndrewRadev/linediff.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do' : ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-markology'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-smartword'
Plug 'kana/vim-submode'
Plug 'tyru/open-browser.vim' | Plug 'kannokanno/previm', { 'for' : ['markdown', 'rst'] }
Plug 'osyo-manga/vim-anzu'
Plug 'r6eve/caw.vim', { 'branch': 'add-feature-to-delete-doc-comments' }
Plug 'Shougo/vimproc.vim' | Plug 'rhysd/clever-f.vim'
Plug 'Shougo/vimproc.vim' | Plug 'rhysd/committia.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'rhysd/vim-gfm-syntax'
Plug 'rhysd/vim-grammarous', { 'on' : 'GrammarousCheck' }
Plug 'Shougo/neosnippet.vim'
Plug 'thinca/vim-prettyprint'
Plug 'thinca/vim-qfreplace', { 'on' : 'Qfreplace' }
Plug 'Shougo/vimproc.vim' | Plug 'thinca/vim-quickrun', { 'on' : 'QuickRun' }
Plug 'thinca/vim-template'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/capture.vim', { 'on' : 'Capture' }
Plug 'Shougo/vimproc.vim' | Plug 'tyru/open-browser.vim'
Plug 'vim-scripts/gtags.vim'
" C++
Plug 'vim-jp/vim-cpp', { 'for' : 'cpp' }
Plug 'rhysd/vim-clang-format', { 'for' : ['c', 'cpp'] }
" D
Plug 'landaire/deoplete-d', { 'for' : 'd' }
" Go
Plug 'fatih/vim-go', { 'for' : 'go' }
" HTML
Plug 'mattn/emmet-vim', { 'for' : ['jsp', 'html', 'haml', 'xhtml', 'liquid', 'css', 'scss', 'sass'] }
" JavaScript
Plug 'jelera/vim-javascript-syntax'
" lighttpd
Plug 'glensc/vim-syntax-lighttpd', { 'for' : 'lighttpd' }
" Perl
Plug 'c9s/perlomni.vim', { 'for' : 'perl' }
Plug 'vim-perl/vim-perl'
" Ruby
Plug 'kana/vim-smartinput' | Plug 'cohama/vim-smartinput-endwise', { 'for' : 'ruby' }
" Rust
Plug 'rust-lang/rust.vim'
" Scala
Plug 'derekwyatt/vim-scala', { 'for' : 'scala' }
" Scheme
Plug 'aharisu/vim_goshrepl', { 'for' : 'scheme' }
" Shell script
Plug 'vim-scripts/sh.vim', { 'for' : 'sh' }
" TOML
Plug 'cespare/vim-toml', { 'for' : 'toml' }
" Vim Script
Plug 'kannokanno/vmock', { 'for' : 'vim' }
Plug 'thinca/vim-themis', { 'for' : 'vim' }

" textobjs
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-user' | Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user' | Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-user' | Plug 'thinca/vim-textobj-between'

" operators
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-user' | Plug 'kana/vim-operator-replace'

call plug#end()

" advanced settings{{{1
" auto-complete{{{2
if has('nvim')
  " Shougo/deoplete.nvim
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#max_abbr_width = 0
  let g:deoplete#max_menu_width = 0
  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\w*'
  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.ocaml = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*']
  let g:deoplete#omni#functions = {}
  inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-e> deoplete#cancel_popup()
else
  " Shougo/neocomplete
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#min_keyword_length = 3
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#auto_completion_start_length = 3
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
  let g:neocomplete#sources#dictionary#dictionaries = {
  \  'default' : '',
  \  'scheme' : $HOME.'/.gosh_completions',
  \}
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
  let g:neocomplete#sources#omni#functions = get(g:, 'neocomplete#sources#omni#functions', {})
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-e> neocomplete#cancel_popup()
endif

" Shougo/denite.nvim{{{2
call denite#custom#map(
  \ 'insert',
  \ '<C-j>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)
call denite#custom#map(
  \ 'insert',
  \ '<C-k>',
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)
call denite#custom#source(
  \ 'file_mru', 'matchers', ['matcher_cpsm', 'matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source(
  \ 'file_rec', 'matchers', ['matcher_cpsm'])
call denite#custom#option('default', 'prompt', '>')

" AndrewRadev/linediff.vim{{{2
vnoremap <silent><Leader>d :Linediff<CR>

" autozimu/LanguageClient-neovim{{{2
"  \ 'javascript': ['/usr/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
"  \ 'typescript': ['/usr/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ 'go': ['go-langserver'],
  \ 'ocaml': ['ocaml-language-server', '--stdio'],
  \ 'php': ['php', $HOME.'/.config/composer/vendor/bin/php-language-server.php'],
  \ 'python': ['pyls'],
  \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  \ }

autocmd FileType cpp,go,ocaml,php,python,rust set signcolumn=yes

let g:LanguageClient_autoStart = 1

autocmd FileType cpp,go,ocaml,php,python,rust nnoremap <silent>K :call LanguageClient_textDocument_hover()<CR>
autocmd FileType cpp,go,ocaml,php,python,rust nnoremap <silent><Leader>t :call LanguageClient_textDocument_definition()<CR>
autocmd FileType cpp,go,ocaml,php,python,rust nnoremap <silent><Leader>s <C-w>s:call LanguageClient_textDocument_definition()<CR>
autocmd FileType cpp,go,ocaml,php,python,rust nnoremap <silent><Leader>b :call LanguageClient_textDocument_documentSymbol()<CR>:Denite documentSymbol<CR>

" ctrlpvim/ctrlp.vim{{{2
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll|swp|pdf|DS_Store)$', }
let g:ctrlp_max_files = 500
let g:ctrlp_max_depth = 5
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_tilde_homedir = 1
let g:ctrlp_follow_symlinks = 2

" jeetsukumaran/vim-markology{{{2
let g:markology_enable = 0
let g:markology_disable_mappings = 1
nmap <silent>m! <Plug>MarkologyToggle
nmap <silent>m? <Plug>MarkologyLocationList

" kana/vim-smartinput{{{2
call smartinput#map_to_trigger('i', '<C-h>', '<BS>', '<C-h>')
call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>')
call smartinput#map_to_trigger('i', '<C-j>', '<CR>', '<C-j>')
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
call smartinput#map_to_trigger('i', '*', '*', '*')
" apostrophe
call smartinput#define_rule({
\  'at' : '\%#',
\  'char' : '''',
\  'input' : '''',
\  'filetype' : ['factor', 'ocaml', 'rust'],
\})
call smartinput#define_rule({
\  'at' : '\%#',
\  'char' : '''',
\  'input' : '''',
\  'syntax' : ['Constant'],
\  'filetype' : ['factor', 'ocaml', 'rust'],
\})
" paren
call smartinput#define_rule({
\  'at' : '(\%#)',
\  'char' : '<Space>',
\  'input' : '<Space><Space><Left>',
\})
call smartinput#define_rule({
\  'at' : '( \%# )',
\  'char' : '<BS>',
\  'input' : '<Del><BS>',
\})
call smartinput#define_rule({
\  'at' : '(\%#)',
\  'char' : '*',
\  'input' : '*<Space>*<Left><Left><Space>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '(\* \%# \*)',
\  'char' : '*',
\  'input' : '<BS>*<Space>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '(\* \%# \*)',
\  'char' : '<BS>',
\  'input' : '<BS><BS><BS><Del><Del><Del>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '(\*\* \%# \*)',
\  'char' : '<BS>',
\  'input' : '<BS><BS><BS><BS><Del><Del><Del>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '(\* \%# \*)',
\  'char' : '<Enter>',
\  'input' : '<BS><Enter><ENTER><BS><BS><BS><Del><Up><ESC>"_S',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '(\*\* \%# \*)',
\  'char' : '<Enter>',
\  'input' : '<BS><Enter><ENTER><BS><BS><BS><Del><Up><ESC>"_S',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '\%#\_s*\*)',
\  'char' : ')',
\  'input' : '<C-r>=smartinput#_leave_block('')'')<Enter><Right>',
\  'filetype' : ['ocaml'],
\})
" " less
" " TODO: cannot work
" call smartinput#define_rule({
" \  'at' : '\%#',
" \  'char': '<lt>',
" \  'input': '<><Left>',
" \  'filetype' : ['rust'],
" \})
" call smartinput#define_rule({
" \  'at' : '\%#\_s*\>',
" \  'char' : '>',
" \  'input' : '<C-r>=smartinput#_leave_block(''>'')<Enter><Right>',
" \  'filetype' : ['rust'],
" \})
" bracket
call smartinput#define_rule({
\  'at' : '\[\%#\]',
\  'char' : '<Space>',
\  'input' : '<Space><Space><Left>',
\})
call smartinput#define_rule({
\  'at' : '\[ \%# \]',
\  'char' : '<BS>',
\  'input' : '<Del><BS>',
\})
call smartinput#define_rule({
\  'at' : '\[\%#\]',
\  'char' : '<Enter>',
\  'input' : '<Enter><Enter><Up><Esc>"_S',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '\[\%#\]',
\  'char' : '<Bar>',
\  'input' : '<Bar><Bar><Left>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '\%#\_s*|\]',
\  'char' : ']',
\  'input' : '<C-r>=smartinput#_leave_block('']'')<Enter><Right>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '\[|\%#|\]',
\  'char' : '<BS>',
\  'input' : '<BS><BS><Del><Del>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '\[||\]\%#',
\  'char' : '<BS>',
\  'input' : '<BS><BS><BS><BS>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '\[|\%#|\]',
\  'char' : '<Space>',
\  'input' : '<Space><Space><Left>',
\  'filetype' : ['ocaml'],
\})
call smartinput#define_rule({
\  'at' : '\[| \%# |\]',
\  'char' : '<BS>',
\  'input' : '<Del><BS>',
\  'filetype' : ['ocaml'],
\})
" grave
call smartinput#define_rule({
\  'at' : '\%#',
\  'char' : '`',
\  'input' : '`',
\})
call smartinput#define_rule({
\  'at' : '\%#`',
\  'char' : '`',
\  'input' : '`',
\})
call smartinput#define_rule({
\  'at' : '`\%#`',
\  'char' : '<BS>',
\  'input' : '<BS>',
\})
call smartinput#define_rule({
\  'at' : '``\%#',
\  'char' : '<BS>',
\  'input' : '<BS>',
\})
call smartinput#define_rule({
\  'at' : '``\%#',
\  'char' : '`',
\  'input' : '`',
\})
call smartinput#define_rule({
\  'at' : '\%#```',
\  'char' : '`',
\  'input' : '`',
\})
call smartinput#define_rule({
\  'at' : '```\%#```',
\  'char' : '<BS>',
\  'input' : '<BS>',
\})
call smartinput#define_rule({
\  'at' : '``````\%#',
\  'char' : '<BS>',
\  'input' : '<BS>',
\})
" brace
call smartinput#define_rule({
\  'at' : '{\%#}',
\  'char' : '<Space>',
\  'input' : '<Space><Space><Left>',
\})
call smartinput#define_rule({
\  'at' : '{ \%# }',
\  'char' : '<BS>',
\  'input' : '<Del><BS>',
\})
" bar
call smartinput#define_rule({
\  'at' : '\%#',
\  'char' : '<Bar>',
\  'input' : '<Bar><Bar><Left>',
\  'filetype' : ['rust'],
\})
call smartinput#define_rule({
\  'at' : '\%#\_s*|',
\  'char' : '<Bar>',
\  'input' : '<C-r>=smartinput#_leave_block(''|'')<Enter><Right>',
\  'filetype' : ['rust'],
\})
call smartinput#define_rule({
\  'at' : '|\%#|',
\  'char' : '<BS>',
\  'input' : '<BS><BS><Del><Del>',
\  'filetype' : ['rust'],
\})
call smartinput#define_rule({
\  'at' : '||\%#',
\  'char' : '<BS>',
\  'input' : '<BS><BS><BS><BS>',
\  'filetype' : ['rust'],
\})
call smartinput#define_rule({
\  'at' : '|\%#|',
\  'char' : '<Space>',
\  'input' : '<Space><Space><Left>',
\  'filetype' : ['rust'],
\})
call smartinput#define_rule({
\  'at' : '| \%# |',
\  'char' : '<BS>',
\  'input' : '<Del><BS>',
\  'filetype' : ['rust'],
\})

" kana/vim-smartword{{{2
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)
nmap ge <Plug>(smartword-ge)
xmap w <Plug>(smartword-w)
xmap b <Plug>(smartword-b)
xmap e <Plug>(smartword-e)
xmap ge <Plug>(smartword-ge)

" kana/vim-submode{{{2
let g:submode_keep_leaving_key = 1
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')
call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')
call submode#enter_with('change-list', 'n', '', 'g;', 'g;')
call submode#enter_with('change-list', 'n', '', 'g,', 'g,')
call submode#map('change-list', 'n', '', ';', 'g;')
call submode#map('change-list', 'n', '', ',', 'g,')
call submode#enter_with('move-to-fold', 'n', '', 'zj', 'zj')
call submode#enter_with('move-to-fold', 'n', '', 'zk', 'zk')
call submode#map('move-to-fold', 'n', '', 'j', 'zj')
call submode#map('move-to-fold', 'n', '', 'k', 'zk')

" kannokanno/previm{{{2
autocmd Filetype markdown,rst nmap <Leader>p :<C-u>PrevimOpen<CR>

" osyo-manga/vim-anzu{{{2
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" r6eve/caw.vim{{{2
let g:caw_no_default_keymappings = 1
let g:caw_dollarpos_sp_left = ' '
autocmd FileType python let g:caw_dollarpos_sp_left = '  '
map gci <Plug>(caw:hatpos:comment)
map gcui <Plug>(caw:hatpos:uncomment)
map gca <Plug>(caw:dollarpos:comment)
map gcua <Plug>(caw:dollarpos:uncomment)
map gcw <Plug>(caw:wrap:comment)
map gcuw <Plug>(caw:wrap:uncomment)
map gco <Plug>(caw:jump:comment-next)
map gcO <Plug>(caw:jump:comment-prev)

" rhysd/clever-f.vim{{{2
let g:clever_f_across_no_line = 1
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
if has('nvim')
  let g:clever_f_hide_cursor_on_cmdline = 0
endif

" rhysd/committia.vim{{{2
let g:committia_hooks = {}
let g:committia_min_window_width = 120
function! g:committia_hooks.edit_open(info)
  setlocal spell
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" rhysd/vim-color-spring-night{{{2
colorscheme spring-night

" rhysd/vim-grammarous{{{2
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }
let g:grammarous#disabled_rules = {
            \ '*' : ['EN_QUOTES', 'UPPERCASE_SENTENCE_START', 'WHITESPACE_RULE'],
            \ }

" Shougo/neosnippet{{{2
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory='~/.vim/snippets'

" thinca/vim-quickrun{{{2
nnoremap <silent><Leader>r :<C-u>QuickRun<CR>
let g:quickrun_config = {
  \  '_' : {
  \    'runner' : 'vimproc',
  \    'runner/vimproc/updatetime' : 500
  \  },
  \  'c' : {
  \    'cmdopt' : '-std=c99 -O2 -Wall -Wextra -pedantic -Wformat=2 -Wstrict-aliasing=2'
  \  },
  \  'cpp' : {
  \    'cmdopt' : '-std=c++11 -O2 -Wall -Wextra -pedantic -Wformat=2 -Wstrict-aliasing=2'
  \  },
  \  'lisp' : { 'command' : 'sbcl' },
  \  'r': {
  \    'command': 'Rscript',
  \    'exec' : '%c %o --no-save --slave %s %a'
  \  },
  \  'st' : { 'command' : 'gst' },
  \  'scheme' : { 'command' : 'gosh' }
  \}

" tyru/open-browser{{{2
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)
let g:openbrowser_open_filepath_in_vim = 0
command! OpenBrowserCurrent execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')
nmap <Leader>O :<C-u>OpenBrowserCurrent<CR>
if has('unix')
  let g:openbrowser_browser_commands = [
  \  { 'name' : 'firefox-nightly',
  \    'cmd' : 'firefox-nightly',
  \    'args' : ['{browser}', '{uri}'] },
  \  { 'name' : 'xdg-open',
  \    'cmd' : 'xdg-open',
  \    'args' : ['{browser}', '{uri}'] },
  \  { 'name' : 'x-www-browser',
  \    'cmd' : 'x-www-browser',
  \    'args' : ['{browser}', '{uri}'] },
  \  { 'name' : 'w3m',
  \    'cmd' : 'w3m',
  \    'args' : ['{browser}', '{uri}'] },
  \]
endif

" kana/vim-operator-replace{{{2
map _ <Plug>(operator-replace)

" C/C++{{{2
autocmd FileType c,cpp nmap <silent><Leader>f :ClangFormat<CR>

" Go{{{2
autocmd FileType go nnoremap <silent><Leader>f :GoFmt<CR>

" Fortran{{{2
let fortran_free_source=1

" HTML{{{2
let g:html_indent_inctags = "html,body,head,tbody"

" LaTeX{{{2
let g:tex_conceal=""
let g:tex_flavor='latex'
autocmd FileType tex set spell

" OCaml{{{2
if executable('ocamlmerlin') && has('python')
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  exec "set rtp+=" . g:opamshare . "/merlin/vim"
end
autocmd FileType ocaml set commentstring=(*%s*)
autocmd BufNewFile,BufRead *.mly syn region ocamlComment start="/\*" end="\*/" contains=@Spell,ocamlComment,ocamlTodo

" Python{{{2
autocmd FileType python nnoremap <silent><Leader>f :0,$!yapf<CR>

" R{{{2
let vimrplugin_assign = 0

" Ruby{{{2
let g:ruby_path = ""
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif
autocmd FileType ruby call smartinput_endwise#define_default_rules()

" Rust{{{2
let g:rustfmt_command = 'rustup run nightly rustfmt'
autocmd FileType rust nnoremap <silent><Leader>f :RustFmt<CR>
" let g:racer_cmd = 'racer'
" let g:racer_insert_paren = 0
" let g:racer_experimental_completer = 1
" autocmd FileType rust nmap <silent><Leader>t <Plug>(rust-def)
" autocmd FileType rust nmap <silent><Leader>s <Plug>(rust-def-split)
" autocmd FileType rust nmap <silent><Leader>v <Plug>(rust-def-vertical)

" Scheme{{{2
autocmd FileType scheme vmap <C-j> <Plug>(gosh_repl_send_block)

" Shell script{{{2
let g:sh_indent_case_labels=1

" __END__{{{1
" vim: foldmethod=marker
