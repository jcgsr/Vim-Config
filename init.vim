call plug#begin()
Plug 'leafOfTree/vim-vue-plugin'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'posva/vim-vue'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'phanviet/vim-monokai-pro'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', 
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
Plug 'ayu-theme/ayu-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-scripts/c.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'sirver/ultisnips'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mattn/emmet-vim'
Plug 'inkarkat/vim-linejuggler'
Plug 'inkarkat/vim-ingo-library'
Plug 'ryanoasis/vim-devicons'
Plug 'mlaursen/vim-react-snippets'
Plug 'plasticboy/vim-markdown'
Plug 'jparise/vim-graphql'
Plug 'rhysd/vim-clang-format'
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

set clipboard+=unnamedplus 

syntax sync fromstart

set termguicolors
set t_Co=256 

set colorcolumn=72
set textwidth=72
set wrap
set linebreak

set path=.,,**

set mouse=a

" :au FocusLost * :wa

inoremap <Esc> <Esc>:w<CR>

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

" Cursor 
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Default : "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
set guicursor=v-c-sm:block,n-i-ci-ve:block,r-cr-o:hor20

set guicursor=a:blinkon100

" True colors
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:lightline = {
    \ 'colorscheme': 'monokai_tasty' 
   \ }
let g:airline_theme = 'monokai_tasty'

" Color Scheme
set background=dark
colorscheme dracula 
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
    \  'coc-python',
    \  'coc-clangd',
    \  'coc-java'
    \   ]

" Coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.

" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

" Clang

let g:clang_format#auto_format=1
" g:clang_format#code_style=llvm

