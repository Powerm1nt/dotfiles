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
    Plug 'qpkorr/vim-bufkill'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'windwp/nvim-spectre'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

" Indents settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set shiftwidth=2
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
nmap <silent> <C-S>  :update<CR>
nmap <C-F> <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <cmd>lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre

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
let g:dark_float = "true"
colorscheme github_dark

" autocmds
autocmd CursorHold * silent call CocActionAsync('highlight')

" autopairs config
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
au FileType xml let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
