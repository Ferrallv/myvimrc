syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set showcmd
set autowrite
" AUTOCOMPLETION FOR CSS
filetype plugin on
set omnifunc=syntaxcomplete#Complete

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'mbbill/undotree'
Plug 'SirVer/ultisnips'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim'
Plug 'gregsexton/matchtag'
Plug 'cwfoo/vim-text-omnicomplete'
Plug 'jparise/vim-graphql'
Plug 'habamax/vim-godot'
call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
	let g:rg_derive_root='true'
endif

" Some au group stuff
" get html formatting
au BufRead,BufNewFile *.gohtml set filetype=html

" Get javascript formatting
augroup FileTypeSpecificAutocommands
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" I want 'K' to give me the goods in python
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc3.10

let mapleader = ' '

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:UltiSnipsExpandTrigger='<C-j>'
let g:go_fmt_command = 'goimports'

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 50<CR>
nnoremap <leader>> <C-w>><CR>
nnoremap <leader>> <C-w><<CR>

" Make GoTest faster
cmap gt GoTest
" Pretty Print Json
cmap ppj %!python3 -m json.tool

" To copy to windows clipboard
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
