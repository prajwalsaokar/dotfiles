let &packpath = &runtimepath
let g:doom_one_terminal_colors = v:true

"terminal colorscheme
if (has("termguicolors"))
	set termguicolors
endif

"neovim defaults
set nocompatible
syntax on	
set number
set relativenumber
set ignorecase
set smartcase
set incsearch
set laststatus=2
set ruler
set sessionoptions-=options
set showcmd
set cursorline
set sidescroll=1
set smarttab
set ttyfast
set viminfo+=!
set noswapfile
set wildmenu
set autoread
set backspace=indent,eol,start
set belloff=all
set complete-=i
set display=lastline
filetype plugin indent on

inoremap jj <esc>
inoremap <C-e> <C-o>de
tnoremap <Esc> <C-\><C-n><CR>

"Remap leader to Space
let mapleader = "\<Space>"

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'
Plug 'romgrk/doom-one.vim'
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
Plug 'goerz/jupytext.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'mfussenegger/nvim-dap'
Plug 'williamboman/nvim-lsp-installer'
call plug#end()
"================================================

"Telescope 
lua << EOF
	require('telescope').setup {
		
	}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"Which Key
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
	}
EOF

"Vimwiki configuration
let g:vimwiki_list = [{'path':'$HOME\Dropbox\wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}"
let g:vimwiki_global_ext = 0

"Vimwiki attachment setup
function! VimwikiLinkHandler(link)
    if a:link =~ '\.\(pdf\|jpg\|jpeg\|png\|gif\)$'
        call vimwiki#base#open_link(':e ', 'file:'.a:link)
        return 1
    endif	
    return 0
endfunction

"LSP Configutation
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'clangd' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

"clear highlights
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

"Autosave
au TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif

"clipboard
set clipboard+=unnamedplus

"Always center the line cursor is on
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END


"set colorscheme to onedark
colorscheme doom-one

"set undo history
set undofile
set undodir=$HOME/.vimundo

