call plug#begin("~/.vim/plugged")
	"Plug 'mhartington/oceanic-next'
	Plug 'flrnd/candid.vim'
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
call plug#end()

if(has ("termguicolors"))
	set termguicolors
endif
set background=dark
syntax enable
"colorscheme OceanicNext 
colorscheme candid

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-g> :NERDTreeToggle<CR>

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
" open new split panes to right and below
set splitright
set splitbelow
"turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
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
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Clear search highlight with double <esc>
nnoremap <silent> <esc><esc> :noh<CR>












