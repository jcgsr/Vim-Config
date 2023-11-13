set nocompatible

" automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'leafOfTree/vim-vue-plugin', {'for': 'vue'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'preservim/nerdtree', {'on': 'NERDCommenterToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rakr/vim-one' "color
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow' "color for Parenthesis
Plug 'patstockwell/vim-monokai-tasty' "color
Plug 'crusoexia/vim-monokai' "color
Plug 'dracula/vim', { 'as': 'dracula' } "color
Plug 'sainnhe/everforest' "color
Plug 'tomasr/molokai' "color
Plug 'NLKNguyen/papercolor-theme' "color
Plug 'preservim/nerdcommenter', {'on': 'NERDCommenterToggle'}
Plug 'vim-scripts/c.vim', {'for': 'c'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'sirver/ultisnips'
Plug 'pangloss/vim-javascript', {'for': 'js'}
Plug 'leafgarland/typescript-vim', {'for': 'ts'}
Plug 'mxw/vim-jsx', {'for': 'jsx'}
Plug 'mattn/emmet-vim'
Plug 'inkarkat/vim-ingo-library'
Plug 'ryanoasis/vim-devicons'
Plug 'mlaursen/vim-react-snippets', {'for': 'jsx'}
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'md']}
Plug 'rust-lang/rust.vim', {'for': ['rs', 'rust']}
Plug 'w0rp/ale', { 'do': 'pip install flake8 isort yapf' }
Plug 'othree/html5.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
call plug#end()

"Seção de configuração
set encoding=UTF-8
set number
set tabstop=2
set smartindent
set shiftwidth=2
set expandtab
set laststatus=2
set noshowmode
set ai
filetype on
filetype plugin on
filetype indent on
set hlsearch
nnoremap <CR> :noh<CR><CR>
set clipboard=unnamedplus 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

syntax sync fromstart

set termguicolors
set t_Co=256 
set term=xterm-256color

set colorcolumn=72
set textwidth=72
set wrap
set linebreak

set path=.,,**

set mouse=a

" search case sensitive
set ignorecase
set smartcase
set incsearch

" mappings
:nnoremap <leader>di di'
:nnoremap <leader>{ va{

nmap <C-s> <Esc>:w<CR>
imap <C-s> <Esc>:w<CR>

nmap ; :

" Copy to clipboard
noremap <C-y> "*y
noremap <C-p> "*p

" screens
nnoremap <leader>b <C-w>v
nnoremap <leader>bd <C-w>s
nnoremap <leader>x <Esc>:q<CR>
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" tabs 
nnoremap <leader>t <Esc>:tabnew<CR>
nnoremap <tab> gt

" cursor moving
nnoremap <leader>e $

" cursor_behaviour
augroup cursor_behaviour
    autocmd!

    " reset cursor on start:
    autocmd VimEnter * silent !echo -ne "\e[2 q"
    " cursor blinking bar on insert mode
    let &t_SI = "\e[5 q"
    " cursor steady block on command mode
    let &t_EI = "\e[2 q"

    " highlight current line when in insert mode
    autocmd InsertEnter * set cursorline
    " turn off current line highlighting when leaving insert mode
    autocmd InsertLeave * set nocursorline

augroup END

" moving lines 
nnoremap <leader><up> <Esc>:move -2<CR>
nnoremap <leader><down> <Esc>:move +1<CR>
vnoremap <leader><up> <Esc>:move -2<CR>
vnoremap <leader><down> <Esc>:move +1<CR>

"git 
nnoremap <leader>gs <Esc>:Git status<CR>
nnoremap <leader>gp <Esc>:Git push<CR>

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" C compile
map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

" True colors
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

nnoremap <silent><expr><leader>bg printf(":set bg=%s \| colo %s\r",&bg==# 'dark' ? 'light' : 'dark', &bg ==# 'dark' ? 'everforest' :
      \'molokai')

  " For dark version.
        set background=dark

        " For light version.
        "set background=light

        " Set contrast.
        " This configuration option should be placed before `colorscheme everforest`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:everforest_background = 'soft'

        " For better performance
        let g:everforest_better_performance = 1

        let g:molokai_original = 1
        colorscheme molokai


" Color Scheme
hi Normal ctermbg=16 guibg=#111110
hi LineNr ctermbg=16 guibg=#111110

"Emmet

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" COC
let g:coc_global_extensions = [
    \  'coc-snippets',
    \  'coc-emmet',
    \  'coc-html',
    \  'coc-css',
    \  'coc-json', 
    \  'coc-phpls',
    \  'coc-yaml',
    \  'coc-prettier',
    \  'coc-eslint',
    \  'coc-jedi',
    \  'coc-rust-analyzer',
    \   ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Vue
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Brackets/Parenthesis color
let g:rainbow_active = 1

" Ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': [
\       'isort',
\       'yapf',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ],
\   'javascript': ['prettier']
\}
