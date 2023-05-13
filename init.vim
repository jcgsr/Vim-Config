set nocompatible
call plug#begin()
Plug 'leafOfTree/vim-vue-plugin'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'posva/vim-vue'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdcommenter'
Plug 'vim-scripts/c.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'sirver/ultisnips'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'inkarkat/vim-linejuggler'
Plug 'inkarkat/vim-ingo-library'
Plug 'ryanoasis/vim-devicons'
Plug 'mlaursen/vim-react-snippets'
Plug 'plasticboy/vim-markdown'
Plug 'jparise/vim-graphql'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale', { 'do': 'pip install flake8 isort yapf' }
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
set guicursor=a:blinkon100
set clipboard=unnamedplus 

syntax sync fromstart

set termguicolors
set t_Co=256 
"set term=xterm-256color

set colorcolumn=72
set textwidth=72
set wrap
set linebreak

set path=.,,**

set mouse=a

"inoremap <Esc> <Esc>:w<CR>

vnoremap <C-C> :w !xclip -i -sel c<CR><CR>
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

let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

let g:airline_theme = 'vim_monokai_tasty'

" Color Scheme
set background=dark
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

" Copy to clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p


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

