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
set cinoptions=:0,(0,g0,t0
set keywordprg=:help
set splitright
set splitbelow
set completeopt-=preview
"set virtualedit+=block
set nrformats=hex,alpha
set lazyredraw
set ttyfast
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
autocmd ColorScheme * highlight TabString cterm=none ctermbg=236 gui=none guibg=#303030
autocmd ColorScheme * highlight TrailingSpaces term=underline ctermbg=238 guibg=#444444
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
" nnoremap <silent><Space> <PageDown>
" nnoremap <silent><C-Space> <C-w>p<PageDown><C-w>p
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
inoremap <C-k> <C-o>D
inoremap <C-_> <ESC>
inoremap <C-/> <ESC>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-r>+ <C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>
inoremap <C-d> <C-o>x

" filetype detect settings{{{1
autocmd BufNewFile,BufRead *.dart set filetype=dart
autocmd BufNewFile,BufRead *.io set filetype=io
autocmd BufNewFile,BufRead lighttpd.conf set filetype=lighttpd
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.{atd,mly} set filetype=ocaml
autocmd BufNewFile,BufRead *.{cgi,t} set filetype=perl
autocmd BufNewFile,BufRead *.scala set filetype=scala
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
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/neocomplete.vim'
" endif
Plug 'Shougo/vimproc.vim' | Plug 'Shougo/neosnippet'
Plug 'AndrewRadev/linediff.vim'
Plug 'fuenor/JpFormat.vim'
Plug 'jeetsukumaran/vim-markology'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-smartword'
Plug 'kana/vim-submode'
Plug 'tyru/open-browser.vim' | Plug 'kannokanno/previm', { 'for' : ['markdown', 'rst'] }
Plug 'osyo-manga/vim-anzu'
Plug 'r6eve/caw.vim', { 'branch': 'add-feature-to-delete-doc-comments' }
Plug 'Shougo/vimproc.vim' | Plug 'rhysd/clever-f.vim'
Plug 'Shougo/vimproc.vim' | Plug 'rhysd/committia.vim'
Plug 'rhysd/vim-gfm-syntax'
Plug 'rhysd/vim-color-spring-night'
Plug 'thinca/vim-prettyprint'
Plug 'thinca/vim-qfreplace', { 'on' : 'Qfreplace' }
Plug 'Shougo/vimproc.vim' | Plug 'thinca/vim-quickrun', { 'on' : 'QuickRun' }
Plug 'thinca/vim-template'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-surround'
Plug 'tyru/capture.vim', { 'on' : 'Capture' }
Plug 'Shougo/vimproc.vim' | Plug 'tyru/open-browser.vim'
Plug 'r6eve/YouCompleteMe', { 'branch': 'support-neosnippet', 'do' : './install.py --clang-completer --tern-completer --racer-completer' }
" C++
Plug 'vim-jp/vim-cpp', { 'for' : 'cpp' }
" Haskell
"Plug 'eagletmt/neco-ghc', { 'for' : 'haskell' }
"Plug 'ujihisa/ref-hoogle', { 'for' : 'haskell' }
" HTML
Plug 'mattn/emmet-vim', { 'for' : ['jsp', 'html', 'haml', 'xhtml', 'liquid', 'css', 'scss', 'sass'] }
" Java
"Plug 'artur-shaik/vim-javacomplete2', { 'for' : 'java' }
" JavaScript
Plug 'jelera/vim-javascript-syntax'
"Plug 'marijnh/tern_for_vim', { 'for' : 'javascript', 'do' : 'npm install' }
" lighttpd
Plug 'glensc/vim-syntax-lighttpd', { 'for' : 'lighttpd' }
" OCaml
Plug 'simonjbeaumont/vim-ocamlspot', { 'for' : 'ocaml' }
" Perl
Plug 'c9s/perlomni.vim', { 'for' : 'perl' }
Plug 'vim-perl/vim-perl'
" Ruby
Plug 'kana/vim-smartinput' | Plug 'cohama/vim-smartinput-endwise', { 'for' : 'ruby' }
" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer', { 'for' : 'rust' }
" Scala
"Plug 'derekwyatt/vim-scala', { 'for' : 'scala' }
" Scheme
Plug 'aharisu/vim_goshrepl', { 'for' : 'scheme' }
" Shell script
Plug 'vim-scripts/sh.vim', { 'for' : 'sh' }
" Smalltalk
"Plug 'st.vim', { 'for' : 'st' }
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
Plug 'kana/vim-operator-user' | Plug 'rhysd/vim-operator-filled-with-blank'

call plug#end()

" advanced settings{{{1
" auto-complete{{{2
" if has('nvim')
"   " Shougo/deoplete.nvim
"   let g:deoplete#enable_at_startup = 1
"   let g:deoplete#enable_smart_case = 1
"   " let g:min_pattern_length = 3
"   " let g:deoplete#sources#syntax#min_keyword_length = 3
"   let g:deoplete#max_abbr_width = 0
"   let g:deoplete#max_menu_width = 0
"   let g:deoplete#keyword_patterns = {}
"   let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\w*'
"   let g:deoplete#omni#input_patterns = {}
"   let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'
"   let g:deoplete#omni#input_patterns.ocaml = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*']
"   let g:deoplete#omni#functions = {}
"   let g:deoplete#omni#functions.javascript = 'tern#Complete'
"   autocmd FileType javascript call tern#Enable()
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
"   inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
"   inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
"   inoremap <expr><C-e> deoplete#cancel_popup()
" else
"   " Shougo/neocomplete
"   let g:neocomplete#enable_at_startup = 1
"   let g:neocomplete#enable_smart_case = 1
"   let g:neocomplete#min_keyword_length = 3
"   let g:neocomplete#sources#syntax#min_keyword_length = 3
"   let g:neocomplete#auto_completion_start_length = 3
"   if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
"   endif
"   let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"   let g:neocomplete#sources#dictionary#dictionaries = {
"   \  'default' : '',
"   \  'scheme' : $HOME.'/.gosh_completions',
"   \}
"   if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
"   endif
"   let g:neocomplete#force_omni_input_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
"   let g:neocomplete#sources#omni#functions = get(g:, 'neocomplete#sources#omni#functions', {})
"   let g:neocomplete#sources#omni#functions.javascript = 'tern#Complete'
"   autocmd FileType javascript call tern#Enable()
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
"   inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"   inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"   inoremap <expr><C-e> neocomplete#cancel_popup()
" endif

" Shougo/neosnippet{{{2
imap <C-t> <Plug>(neosnippet_expand_or_jump)
smap <C-t> <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory='~/.vim/snippets'

" AndrewRadev/linediff.vim{{{2
vnoremap <silent><Leader>d :Linediff<CR>

" fuenor/JpFormat.vim{{{2
set formatexpr=jpvim#formatexpr()

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
  \  { 'name' : 'firefox-nightly', 'args' : ['{browser}', '{uri}'] },
  \  { 'name' : 'xdg-open', 'args' : ['{browser}', '{uri}'] },
  \  { 'name' : 'x-www-browser', 'args' : ['{browser}', '{uri}'] },
  \  { 'name' : 'w3m', 'args' : ['{browser}', '{uri}'] },
  \]
endif

" r6eve/YouCompleteMe{{{2
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_complete_in_comments = 1
let g:ycm_use_ultisnips_completer = 0

" kana/vim-operator-replace{{{2
map _ <Plug>(operator-replace)

" rhysd/vim-operator-filled-with-blank{{{2
map <silent><Leader>b <Plug>(operator-filled-with-blank)

" Fortran{{{2
let fortran_free_source=1

" HTML{{{2
let g:html_indent_inctags = "html,body,head,tbody"

" Java{{{2
"let g:JavaComplete_EnableDefaultMappings = 0

" Haskell{{{2
"let s:bundle = neobundle#get("neco-ghc")
"function! s:bundle.hooks.on_source(bundle)
"  let g:necoghc_enable_detailed_browse = 1
"endfunction
"unlet s:bundle

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
autocmd FileType ocaml nnoremap <Leader>t :call OCamlType()<CR>
autocmd FileType ocaml nnoremap <Leader>s :call OCamlSpot()<CR>
autocmd BufNewFile,BufRead *.mly syn region ocamlComment start="/\*" end="\*/" contains=@Spell,ocamlComment,ocamlTodo

" R{{{2
let vimrplugin_assign = 0

" Ruby{{{2
let g:ruby_path = ""
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif
autocmd FileType ruby call smartinput_endwise#define_default_rules()

" Rust{{{2
let g:racer_cmd = 'racer'
let g:racer_insert_paren = 0
let g:racer_experimental_completer = 1
autocmd FileType rust nnoremap <silent><Leader>f :RustFmt<CR>
autocmd FileType rust nmap <silent><Leader>t <Plug>(rust-def)
autocmd FileType rust nmap <silent><Leader>s <Plug>(rust-def-split)
autocmd FileType rust nmap <silent><Leader>v <Plug>(rust-def-vertical)

" Scheme{{{2
autocmd FileType scheme vmap <C-j> <Plug>(gosh_repl_send_block)

" Shell script{{{2
let g:sh_indent_case_labels=1

" __END__{{{1
" vim: foldmethod=marker
