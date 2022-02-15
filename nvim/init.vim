" General settings
set mouse=a       " Full enable mouse suppore
set number        " Enable numbers
set encoding=UTF-8
set cursorline

" Plugin manager
call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'    
    Plug 'ryanoasis/vim-devicons'
    Plug 'projekt0n/github-nvim-theme'
    Plug 'tpope/vim-fugitive'
    Plug 'rbong/vim-flog'
    Plug 'jiangmiao/auto-pairs'

call plug#end()

" Indents settings
set tabstop=3
set shiftwidth=3
set softtabstop=3
set smarttab
set autoindent
set shiftwidth=4
set expandtab

" NERDTree settings
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Keybinds
nnoremap <C-t> :NERDTreeToggle<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
noremap <silent> <C-S>  :update<CR>

" COC completion settings
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-eslint',
  \  'coc-prettier',
  \  'coc-highlight'
  \ ]

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Color schemes
colorscheme github_dark

" autocmds
autocmd CursorHold * silent call CocActionAsync('highlight')

