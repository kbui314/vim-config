call plug#begin("~/.vim/plugged")
	Plug 'mhartington/oceanic-next'
	Plug 'arcticicestudio/nord-vim'
	Plug 'lifepillar/vim-solarized8'
	Plug 'raimondi/delimitmate'
	Plug 'scrooloose/nerdtree'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'junegunn/fzf', {'dir':'~/.fzf','do': './install --all'}
	Plug 'junegunn/fzf.vim'
	Plug 'dense-analysis/ale'
	Plug 'wellle/targets.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-ragtag'
	Plug 'ryanoasis/vim-devicons'
	Plug 'itchyny/lightline.vim'
call plug#end()

if(has ("termguicolors"))
	set termguicolors
endif
set background=light
syntax enable
colorscheme solarized8
" colorscheme OceanicNext 
" colorscheme nord

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-f> :NERDTreeToggle<CR>

let g:coc_global_extensions = ['coc-emmet','coc-css','coc-html','coc-json','coc-prettier','coc-tsserver']
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

set nowrap
set tabstop=4 softtabstop=4
set shiftwidth=4
set autoindent
set noswapfile
set incsearch
set number
set hidden
set ignorecase
set smartcase
set relativenumber
set signcolumn=yes
set scrolloff=8
set clipboard=unnamedplus
set cursorline
" open new split panes to right and below
set splitright
set splitbelow
"turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
" function! OpenTerminal()
" 	split term://bash
" 	resize 10
" endfunction
" nnoremap <c-n> :call OpenTerminal()<CR>
" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
	\}
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Clear search highlight with double <esc
nnoremap <silent> <esc><esc> :noh<CR>

" Remap Esc to jk and kj
imap jk <Esc>
imap kj <Esc>
imap JK <Esc>
imap KJ <Esc>
" Coc settings
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ 'component': {'lineinfo': "%{line('.') . '/' . line('$')}"}
	\}

