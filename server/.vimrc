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
set visualbell t_vb=
set nobackup
set backupskip=/tmp/*,/private/tmp/*
set swapfile
set directory=~/.vim_swap
if !isdirectory(&directory)
  call mkdir(&directory, 'p')
endif
if has('persistent_undo')
  set undofile
  set undodir=~/.vim_undo
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif
set ruler
set laststatus=2
set notitle
set noequalalways
set iskeyword+=\-
set backspace=indent,eol,start
set history=100
set autoread
set wildmenu
set incsearch
if has('nvim')
  set inccommand=nosplit
endif
set hlsearch
set ignorecase
set smartcase
set tabstop=2
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
set nostartofline
autocmd BufNewFile,BufRead *.{md,tsv} set nostartofline
set completeopt-=preview
set nrformats=hex,alpha
set lazyredraw
set ttyfast
set updatetime=300
set timeoutlen=500
set ttimeout
set ttimeoutlen=50
set display=lastline
set statusline=%f%m%=\ %-14.(%l/%L,%v%)\ %P
set spelllang+=cjk
set matchpairs+=（:）,「:」,『:』,＜:＞,【:】,⥹:⥻
set pumheight=12
set hidden
set clipboard=unnamed
set mouse=
set noshowcmd
set conceallevel=0
set concealcursor=
set list
set listchars=tab:>\･
set wildignore=*.a,*.class,*.cma,*.cmt,*.cmti,*.cmxa,*.cmxs,*.exe
set guicursor=
autocmd VimLeave,VimSuspend * set guicursor=
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
if !has('nvim')
  set pyx=3
endif
syntax enable
autocmd ColorScheme * highlight ALEError ctermbg=89 guibg=#ab6560
autocmd ColorScheme * highlight ALEErrorSign cterm=bold ctermfg=235 ctermbg=89 gui=bold guifg=#3a4b5c guibg=#ab6560
autocmd ColorScheme * highlight EndOfBuffer cterm=none ctermfg=242 gui=none guifg=#fffeeb
autocmd ColorScheme * highlight Ignore cterm=none ctermfg=231 gui=none guifg=#fffeeb
autocmd ColorScheme * highlight MatchParen cterm=none ctermfg=233 ctermbg=132 gui=none guifg=#334152 guibg=#a9667a
autocmd ColorScheme * highlight Normal cterm=none ctermfg=14 ctermbg=none gui=none guifg=#fffeeb guibg=#020814
autocmd ColorScheme * highlight SpellBad cterm=underline ctermfg=210 ctermbg=23 gui=underline guifg=#fd8489 guisp=#fd8489
autocmd ColorScheme * highlight TabLineFill cterm=reverse ctermfg=242 gui=reverse guifg=#3a4b5c
autocmd ColorScheme * highlight TabString cterm=none ctermfg=239 ctermbg=none gui=none guibg=#303030
autocmd ColorScheme * highlight TrailingSpaces term=underline ctermbg=238 guibg=#444444
autocmd ColorScheme * highlight Visual ctermbg=132 guibg=#a9667a
autocmd ColorScheme * highlight ZenkakuSpace cterm=none ctermbg=9 gui=none guibg=#ff0000
autocmd VimEnter,WinEnter * let w:m1 = matchadd('TabString', '	')
autocmd VimEnter,WinEnter * let w:m2 = matchadd('ZenkakuSpace', '　')
autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
autocmd VimEnter,WinEnter *.py syntax keyword Special self

augroup vimrc-todo
  autocmd!
  autocmd Syntax * syn match myTodo /\C\v<(DEBUG|DONE|FIXME|HACK|NB|NOTE|OPTIMIZE|REVIEW|TODO|WIP|XXX):/ containedin=.*Comment
augroup END
highlight def link myTodo Todo

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
  let synid = synID(line('.'), col('.'), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, 'name')
  let ctermfg = synIDattr(a:synid, 'fg', 'cterm')
  let ctermbg = synIDattr(a:synid, 'bg', 'cterm')
  let guifg = synIDattr(a:synid, 'fg', 'gui')
  let guibg = synIDattr(a:synid, 'bg', 'gui')
  return {
        \ 'name': name,
        \ 'ctermfg': ctermfg,
        \ 'ctermbg': ctermbg,
        \ 'guifg': guifg,
        \ 'guibg': guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo 'name: ' . baseSyn.name .
        \ ' ctermfg: ' . baseSyn.ctermfg .
        \ ' ctermbg: ' . baseSyn.ctermbg .
        \ ' guifg: ' . baseSyn.guifg .
        \ ' guibg: ' . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo 'link to'
  echo 'name: ' . linkedSyn.name .
        \ ' ctermfg: ' . linkedSyn.ctermfg .
        \ ' ctermbg: ' . linkedSyn.ctermbg .
        \ ' guifg: ' . linkedSyn.guifg .
        \ ' guibg: ' . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" key mapping{{{1
set pastetoggle=<F2>
nnoremap <F3> :setlocal spell! spell?<CR>
inoremap <F3> <C-o>:setlocal spell! spell?<CR>
nnoremap <F4> :setlocal list! list?<CR>
inoremap <F4> <C-o>:setlocal list! list?<CR>
noremap ; :
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
inoremap <C-e> <C-o>$
inoremap <C-_> <ESC>
inoremap <C-/> <ESC>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-d> <C-o>x

function! ToggleSigncolumn() abort
  if &signcolumn ==# 'yes'
    let &signcolumn = 'no'
  else
    let &signcolumn = 'yes'
  endif
endfunction
nnoremap <F1> :call ToggleSigncolumn()<CR>

function! s:on_FileType_qf_define_mappings() abort
  nnoremap <buffer><silent> q :<C-u>cclose<CR>
  nnoremap <buffer><silent> j :<C-u>cnext<CR>:copen<CR>
  nnoremap <buffer><silent> k :<C-u>cprevious<CR>:copen<CR>
  nnoremap <buffer><silent> J :<C-u>cnfile<CR>:copen<CR>
  nnoremap <buffer><silent> K :<C-u>cpfile<CR>:copen<CR>
  nnoremap <buffer><silent> l :<C-u>clist<CR>
  nnoremap <buffer><CR> <CR>
endfunction
autocmd FileType qf call s:on_FileType_qf_define_mappings()

" filetype detect settings{{{1
autocmd BufNewFile,BufRead *.clje set filetype=clojure
autocmd BufNewFile,BufRead *.dart set filetype=dart
autocmd BufNewFile,BufRead *.gnu set filetype=gnuplot
autocmd BufNewFile,BufRead *.io set filetype=io
autocmd BufNewFile,BufRead *.jnlp set filetype=html
autocmd BufNewFile,BufRead *.{md,md.html,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.m set filetype=objc
autocmd BufNewFile,BufRead *.{atd,mly,mlt} set filetype=ocaml
autocmd BufNewFile,BufRead *.{cgi,t} set filetype=perl
autocmd BufNewFile,BufRead *.re set filetype=reason
autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd BufNewFile,BufRead *.test set filetype=text
autocmd BufNewFile,BufRead *.tf set filetype=terraform
autocmd BufNewFile,BufRead *.toml set filetype=toml
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.vimspec set filetype=vim

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
Plug 'AndrewRadev/linediff.vim'
Plug 'dense-analysis/ale', {
  \ 'for' : [
    \ 'c', 'cpp', 'clojure', 'cmake', 'css', 'dockerfile', 'elixir', 'go',
    \ 'haskell', 'java', 'javascript', 'json', 'lua', 'ocaml', 'perl', 'python',
    \ 'rust', 'r', 'scss', 'sh', 'terraform', 'vim', 'xml', 'yaml.ansible'
    \]
  \}
" Plug 'r6eve/ale', {
"   \ 'branch' : 'fix/r-options',
"   \ 'for' : [
"     \ 'c', 'cpp', 'clojure', 'cmake', 'css', 'dockerfile', 'elixir', 'go',
"     \ 'haskell', 'java', 'javascript', 'json', 'lua', 'ocaml', 'perl', 'python',
"     \ 'rust', 'r', 'scss', 'sh', 'terraform', 'vim', 'xml', 'yaml.ansible'
"     \]
"   \}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-mark'
" Plug 'itchyny/vim-cursorword' " a little too heavy
Plug 'kana/vim-smartinput'
Plug 'kana/vim-smartword'
Plug 'kana/vim-submode'
Plug 'mbbill/undotree'
Plug 'osyo-manga/vim-anzu'
Plug 'Shougo/vimproc.vim' | Plug 'rhysd/clever-f.vim'
Plug 'Shougo/vimproc.vim' | Plug 'rhysd/committia.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'rhysd/vim-gfm-syntax'
Plug 'sgur/vim-editorconfig'
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-qfreplace', { 'on' : 'Qfreplace' }
Plug 'thinca/vim-template'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'Shougo/vimproc.vim' | Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser.vim' | Plug 'tyru/open-browser-github.vim'
Plug 'vim-scripts/gtags.vim'
" Textobjs
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-user' | Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user' | Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-user' | Plug 'thinca/vim-textobj-between'
" Operators
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-user' | Plug 'kana/vim-operator-replace'

Plug 'pearofducks/ansible-vim', { 'for' : 'yaml.ansible' }

" " C++
" Plug 'vim-jp/vim-cpp', { 'for' : 'cpp' }
" Plug 'rhysd/vim-clang-format', { 'for' : ['c', 'cpp'] }

" " CWL
" Plug 'manabuishii/vim-cwl', { 'for' : 'cwl' }

" " Clojure
" Plug 'guns/vim-sexp', { 'for' : 'clojure' }
" " Plug '~/repos/vim-iced', { 'for' : 'clojure' }
" Plug 'liquidz/vim-iced', { 'for' : 'clojure' }
" Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
" Plug 'liquidz/vim-iced-multi-session', {'for': 'clojure'}

" " vim-fireplace
" Plug 'tpope/vim-salve', { 'for' : 'clojure' }
" Plug 'tpope/vim-fireplace', { 'for' : 'clojure' }
" Plug 'venantius/vim-cljfmt', { 'for' : 'clojure' }
" Plug 'venantius/vim-eastwood', { 'for' : 'clojure' }
" Plug 'vim-syntastic/syntastic', { 'for' : 'clojure' }
"
" " acid.nvim
" Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
"
" " conjure
" Plug 'Olical/conjure',  { 'for' : 'clojure' }

" Dot
Plug 'wannesm/wmgraphviz.vim', { 'for' : 'dot' }

" " Elixir
" Plug 'elixir-editors/vim-elixir', { 'for' : 'elixir' }

" " Elm
" Plug 'ElmCast/elm-vim', { 'for' : 'elm' }

" " Fennel
" Plug 'bakpakin/fennel.vim', { 'for' : 'fennel' }

" HTML
Plug 'mattn/emmet-vim', {
  \ 'for' : ['jsp', 'html', 'haml', 'xhtml', 'liquid', 'css', 'scss', 'sass']
  \}

" " Haxe
" Plug 'jdonaldson/vaxe', { 'for' : ['haxe'] }

" " JavaScript
" Plug 'posva/vim-vue', { 'for' : ['javascript', 'html'] }
" Plug 'gavocanov/vim-js-indent', { 'for' : ['javascript', 'html'] }

" Markdown
Plug 'tyru/open-browser.vim' | Plug 'kannokanno/previm', { 'for' : ['markdown', 'rst'] }
Plug 'rhysd/github-complete.vim', { 'for' : ['markdown', 'rst'] }
Plug 'godlygeek/tabular', { 'for' : ['markdown'] }
Plug 'plasticboy/vim-markdown', { 'for' : ['markdown'] }

" " Perl
" Plug 'c9s/perlomni.vim', { 'for' : 'perl' }
" Plug 'vim-perl/vim-perl'

" Python
Plug 'vim-scripts/python_match.vim', { 'for' : 'python' }

" " ReasonML
" Plug 'reasonml-editor/vim-reason-plus', { 'for' : 'reason' }

" Ruby
Plug 'kana/vim-smartinput' | Plug 'cohama/vim-smartinput-endwise', { 'for' : 'ruby' }

" " Rust
" Plug 'rust-lang/rust.vim'

" " SATySFi
" Plug 'qnighy/satysfi.vim', { 'for' : 'satysfi' }

" Shell script
Plug 'vim-scripts/sh.vim', { 'for' : 'sh' }

" " Standard ML
" Plug 'jez/vim-better-sml', { 'for' : 'sml' }

" " TOML
" Plug 'cespare/vim-toml', { 'for' : 'toml' }

" Terraform
Plug 'hashivim/vim-terraform', { 'for' : 'terraform' }

" " TypeScript
" Plug 'leafgarland/typescript-vim', { 'for' : 'typescript' }

" " WDL
" Plug 'broadinstitute/vim-wdl', { 'for' : 'wdl' }

" " Workflow with GitHub Actions
" Plug 'rhysd/vim-github-actions', { 'for' : 'ghaworkflow' }

call plug#end()

" advanced settings{{{1
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

" dense-analysis/ale{{{2
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_lint_on_text_changed = 'normal'
let g:ale_set_balloons = 0
let g:airline#extensions#ale#enabled = 0
let g:ale_set_highlights = 0
let g:ale_hover_cursor = 0

let g:ale_fixers = {
  \ 'c': ['clang-format'],
  \ 'cpp': ['clang-format'],
  \ 'cmake': ['cmakelint'],
  \ 'css': ['prettier'],
  \ 'go': ['gofmt'],
  \ 'haskell': ['stylish-haskell'],
  \ 'java': ['google_java_format'],
  \ 'javascript': ['prettier'],
  \ 'json': ['fixjson'],
  \ 'ocaml': ['ocp-indent'],
  \ 'perl': ['perltidy'],
  \ 'python': ['yapf'],
  \ 'r': ['styler'],
  \ 'rust': ['rustfmt'],
  \ 'scss': ['prettier'],
  \ 'sh': ['shfmt'],
  \ 'terraform': ['terraform'],
  \ }

let g:ale_linters = {
  \ 'clojure': ['clj-kondo'],
  \ 'dockerfile': ['hadolint'],
  \ 'elixir': ['elixir-ls', 'mix'],
  \ 'java': ['eclipselsp'],
  \ 'json': ['jsonlint'],
  \ 'lua': ['luacheck'],
  \ 'perl': ['perl', 'perlcritic'],
  \ 'r': ['lintr'],
  \ 'python': ['pylint', 'pyls'],
  \ 'rust': ['analyzer', 'cargo'],
  \ 'sh': ['language_server', 'shellcheck'],
  \ 'terraform': ['terraform_lsp', 'tflint'],
  \ 'vim': ['vimls', 'vint'],
  \ 'xml': ['xmllint'],
  \ 'yaml.ansible': ['ansible-lint'],
  \ }

let g:ale_elixir_elixir_ls_release = $HOME . '/repos/elixir-ls/rel'
let g:ale_elixir_elixir_ls_config = {
  \ 'elixirLS': {'dialyzerEnabled': v:false}
  \ }
" let g:ale_java_javalsp_executable = '/usr/share/java/java-language-server/lang_server_linux.sh'
let g:ale_java_eclipselsp_path = $HOME . '/repos/eclipse.jdt.ls'
let g:ale_java_eclipselsp_javaagent = $HOME . '/repos/lombok/lombok.jar'
let g:ale_ocaml_ocp_indent_config = 'JaneStreet'
let g:ale_perl_perltidy_options = '-bbt=2 -bt=2 -ce -i=2 -iscl -naws -nhsc -nolc -noll -nolq -novalign -pt=2 -fbl'
let g:ale_reason_ls_executable = '/usr/bin/reason-language-server'
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_sh_shfmt_options = '-s -i 2 -ci'

" let g:ale_sign_column_always = 1 " Too slow.
autocmd FileType c,cpp,clojure,cmake,css,dockerfile,elixir,go,haskell,java,javascript,json,lua,ocaml,perl,python,r,rust,scss,sh,terraform,vim,xml,yaml.ansible set signcolumn=yes

autocmd FileType c,cpp,cmake,css,elixir,haskell,go,java,javascript,ocaml,perl,python,r,rust,scss,sh,terraform,vim nmap <silent>K <Plug>(ale_find_references)
autocmd FileType c,cpp,cmake,css,elixir,haskell,go,java,javascript,json,ocaml,perl,python,r,rust,scss,sh,terraform,vim nmap <silent><Leader>f <Plug>(ale_fix)
autocmd FileType cpp,cmake,css,elixir,haskell,go,javascript,ocaml,perl,python,r,rust,scss,sh,terraform,vim nmap <silent><C-]> <Plug>(ale_go_to_definition)
autocmd FileType cpp,cmake,css,elixir,haskell,go,javascript,ocaml,perl,python,r,rust,scss,sh,terraform,vim nmap <silent><Leader>s <C-w>s<Plug>(ale_go_to_definition)
autocmd FileType cpp,cmake,css,elixir,haskell,go,javascript,ocaml,perl,python,r,rust,scss,sh,terraform,vim nmap <silent><C-T> <C-O>

" ctrlpvim/ctrlp.vim{{{2
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.(git|hg|svn)|resources|target|test-resources)$',
  \ 'file': '\v\.(o|exe|so|dll|gitkeep|png|gif|jpg)$',
  \ }
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_files = 200

" haya14busa/vim-asterisk{{{2
map *   <Plug>(asterisk-g*)<Plug>(anzu-update-search-status-with-echo)
map #   <Plug>(asterisk-g#)<Plug>(anzu-update-search-status-with-echo)
map g*  <Plug>(asterisk-*)<Plug>(anzu-update-search-status-with-echo)
map g#  <Plug>(asterisk-#)<Plug>(anzu-update-search-status-with-echo)
map z*  <Plug>(asterisk-gz*)<Plug>(anzu-update-search-status-with-echo)
map gz* <Plug>(asterisk-z*)<Plug>(anzu-update-search-status-with-echo)
map z#  <Plug>(asterisk-gz#)<Plug>(anzu-update-search-status-with-echo)
map gz# <Plug>(asterisk-z#)<Plug>(anzu-update-search-status-with-echo)

let g:asterisk#keeppos = 1

" inkarkat/vim-mark{{{2
let g:mw_no_mappings = 1
nmap <silent><Leader>m <Plug>MarkSet
xmap <silent><Leader>m <Plug>MarkSet
nmap <silent><Leader>n <Plug>MarkAllClear

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

" osyo-manga/vim-anzu{{{2
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)

" tyru/caw.vim{{{2
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
let g:clever_f_highlight_timeout_ms = 5000

" rhysd/committia.vim{{{2
let g:committia_hooks = {}
let g:committia_min_window_width = 120
function! g:committia_hooks.edit_open(info)
  setlocal spell
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" rhysd/reply.vim{{{2
let g:reply_repls = {
 \ 'ocaml': ['utop']
 \}

" rhysd/vim-color-spring-night{{{2
colorscheme spring-night

" tyru/open-browser{{{2
nmap <Leader>o <Plug>(openbrowser-smart-search)
vmap <Leader>o <Plug>(openbrowser-smart-search)
let g:openbrowser_open_filepath_in_vim = 0
command! OpenBrowserCurrent execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')
nmap <Leader>O :<C-u>OpenBrowserCurrent<CR>
if has('unix')
  let g:openbrowser_browser_commands = [
  \  { 'name' : 'firefox',
  \    'cmd' : 'firefox',
  \    'args' : ['{browser}', '--private-window', '{uri}'] },
  \  { 'name' : 'google-chrome-stable',
  \    'cmd' : 'google-chrome-stable',
  \    'args' : ['{browser}', '--incognito', '{uri}'] },
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

" vim-scripts/gtags.vim{{{2
autocmd FileType c,cpp nmap <silent><Leader>g :Gtags -f %<CR>

" Dot{{{2
let g:WMGraphviz_output = 'png'
let g:WMGraphviz_viewer = 'firefox'
let g:WMGraphviz_shelloptions = '-Gdpi=300'

" HTML{{{2
let g:html_indent_inctags = 'html,body,head,tbody'

" LaTeX{{{2
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
autocmd FileType tex set spell

" Markdown{{{2
autocmd Filetype markdown,rst nmap <Leader>p :<C-u>PrevimOpen<CR>

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" R{{{2
let vimrplugin_assign = 0
let g:tagbar_type_r = {
  \ 'ctagstype' : 'r',
  \ 'kinds' : [
    \ 'f:Functions',
    \ 'g:GlobalVariables',
    \ 'v:FunctionVariables',
    \]
\}

" Ruby{{{2
let g:ruby_path = ''
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif
autocmd FileType ruby call smartinput_endwise#define_default_rules()

" Shell script{{{2
let g:sh_indent_case_labels=1

" __END__{{{1
" vim: foldmethod=marker
