" General settings
set mouse=a       " Full enable mouse support
set number        " Enable numbers
set encoding=UTF-8
set cursorline
set clipboard=unnamed
set list
set lcs+=space:·


" Plugin manager
call plug#begin('~/.vim/plugged')

    Plug 'kdheepak/lazygit.nvim'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
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
    Plug 'alvan/vim-closetag'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
   " Plug 'hrsh7th/cmp-nvim-lsp'
   " Plug 'hrsh7th/cmp-buffer'
   " Plug 'hrsh7th/cmp-path'
   " Plug 'hrsh7th/cmp-cmdline'
   " Plug 'hrsh7th/nvim-cmp'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

" AutoComplete
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nmap <silent> <C-i> :LazyGit<CR>
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
" Indent fast with F7
map <F7> gg=G<C-o><C-o>
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <cmd>lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre

let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-css',
\  'coc-prettier',
\  'coc-eslint',
\  'coc-highlight',
\  'coc-tsserver'
\ ]

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

" Color schemes
let g:dark_float = "true"
colorscheme github_dark

" autocmds
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> K :call CocAction('doHover')<CR>
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" autopairs config
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
au FileType xml let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" LazyGIt config
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_border_chars = ['╭','─', '╮', '│', '╯','─', '╰', '│'] " customize lazygit popup window border characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

let g:lazygit_use_custom_config_file_path = 0 " config file path is evaluated if this value is 1
let g:lazygit_config_file_path = '' " custom config file path
" OR
let g:lazygit_config_file_path = [] " list of custom config file paths

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

