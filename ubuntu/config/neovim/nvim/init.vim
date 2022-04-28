call plug#begin('~/.config/nvim/plugged')
" Theme plugin
Plug 'joshdick/onedark.vim'

" multi-cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" File Manager Plugin
Plug 'ryanoasis/vim-devicons'
" Adds filetype-specific icons to NERDTree files and folders
Plug 'preservim/nerdtree'
" Shows Git status flags for files and folders in NERDTree.
Plug 'Xuyuanp/nerdtree-git-plugin'

" Search Plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status bar Plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Float Terminal Plugin
Plug 'voldikss/vim-floaterm'

" auto pair Plugin
Plug 'jiangmiao/auto-pairs'

" Enhanced C and C++ syntax highlighting
Plug 'bfrg/vim-cpp-modern'

" multi language graphical debugger
Plug 'puremourning/vimspector'

" Vim plugin for Git
" Plug 'tpope/vim-fugitive'

" plugin that provides C/C++/Cuda/ObjC semantic highlighting
" Plug 'jackguo380/vim-lsp-cxx-highlight'

" Intelligence Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set number
set shiftwidth=4
set tabstop=4
"set listchars=tab:\|\
set mouse=a
set clipboard=unnamedplus
set list

syntax on
colorscheme onedark
set guifont=Consolas:h13

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"nnoremap a i
"nnoremap i k
"nnoremap j h
"nnoremap k j
"nnoremap j k
"nnoremap k j
nnoremap <C-l> :w<CR> :bnext<CR>
nnoremap <C-h> :w<CR> :bprevious<CR>

execute 'source ~/.config/nvim/settings/floaterm.vim'
execute 'source ~/.config/nvim/settings/nerdtree.vim'
execute 'source ~/.config/nvim/settings/airline.vim'
execute 'source ~/.config/nvim/settings/vimspector.vim'
execute 'source ~/.config/nvim/settings/coc.vim'

