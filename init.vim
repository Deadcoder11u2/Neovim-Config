"" Srikanth's Neovim config file

""" Vim-Plug
call plug#begin()
" Aesthetics - Main
Plug 'bryanmylee/vim-colorscheme-icons'
" Plug 'mhinz/vim-startify'
Plug 'goolord/alpha-nvim'
Plug 'junegunn/limelight.vim'
" packer install
Plug 'junegunn/rainbow_parentheses.vim'
" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'vim-scripts/loremipsum'
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'
Plug 'psliwka/vim-smoothie'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'goolord/alpha-nvim'
Plug 'liuchengxu/vim-clap'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'akinsho/toggleterm.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Shatur/neovim-session-manager'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'hkupty/nvimux'
Plug 'tpope/vim-commentary'
call plug#end()



""" Main Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set number
set title

" Main Coloring Configurations
syntax on
" let g:vscode_disable_nvimtree_bg = v:true
let g:material_style="darker"
let g:gruvbox_material_background="hard"
colorscheme gruvbox-material
set background=dark

" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors

""" Plugin Configurations

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
"let g:airline#extensions#tabline#enabled = 1 " Uncomment to display buffer tabline above

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" vim-pydocstring
let g:pydocstring_doq_path = '~/.config/nvim/env/bin/doq'

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" TagBar
let g:tagbar_width = 30


" fzf-vim
" let g:fzf_action = {
"             \ 'ctrl-t': 'tab split',
"             \ 'ctrl-s': 'split',
"             \ 'ctrl-v': 'vsplit' }
" let g:fzf_colors =
"             \ { 'fg':      ['fg', 'Normal'],
"             \ 'bg':      ['bg', 'Normal'],
"             \ 'hl':      ['fg', 'Comment'],
"             \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"             \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"             \ 'hl+':     ['fg', 'Statement'],
"             \ 'info':    ['fg', 'Type'],
"             \ 'border':  ['fg', 'Constant'],
"             \ 'prompt':  ['fg', 'Character'],
"             \ 'pointer': ['fg', 'Exception'],
"             \ 'marker':  ['fg', 'Keyword'],
"             \ 'spinner': ['fg', 'Label'],
"             \ 'header':  ['fg', 'Comment'] }

" Bat theme for syntax coloring when viewing files in fzf
let $BAT_THEME='base16'

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'gray'
autocmd VimEnter *
            \   if !argc()
            \ |   wincmd w
            \ | endif



" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw =1

function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

let mapleader=","
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>q <Cmd>NERDTreeToggle<CR>
nmap \\ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap \| <leader>w
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>p <Plug>(pydocstring)
nmap <leader>s :Rg<CR>
nmap <leader>f :Telescope find_files<CR>
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>l :Limelight!!<CR>
nnoremap <leader>mm :lua require('material.functions').toggle_style()<CR>
autocmd FileType python nmap <leader>x :0 , $!~/.config/nvim/env/bin/python -m yapf<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
nmap <leader>c :bdelete!<CR>
nmap <C-BS> <C-w>
nmap <C-h> <C-w>

nnoremap <leader>g <Cmd>Telescope harpoon marks<CR>
nnoremap <leader>m <Cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

" LSP diagnostics
nnoremap gl <Cmd>lua vim.diagnostic.open_float()<CR>
nnoremap gr <Cmd>lua vim.lsp.buf.references()<CR>
nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gi <Cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>o <Cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <A-3> <Cmd>SessionManager save_current_session<CR>
nnoremap <A-2> <Cmd>SessionManager load_session<CR>
nnoremap <A-1> <Cmd>SessionManager delete_session<CR>
nnoremap <C-_> <Cmd>Commentary<CR>


xnoremap <C-_> <Cmd> Commentary<CR>


set termguicolors
lua << EOF

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.lsp"

require("bufferline").setup{}
local status_ok, telescope = pcall(require, "telescope")
local actions = require "telescope.actions"
require'lspconfig'.jdtls.setup{}
telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        }
    }
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
    end

    toggleterm.setup({
    size = 20,
    open_mapping = [[<c-m>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
            },
        },
    })

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _LAZYGIT_TOGGLE()
        lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})

        local node = Terminal:new({ cmd = "node", hidden = true })
        function _NODE_TOGGLE()
            node:toggle()
        end

        local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

        function _NCDU_TOGGLE()
            ncdu:toggle()
        end

        local htop = Terminal:new({ cmd = "htop", hidden = true })

        function _HTOP_TOGGLE()
            htop:toggle()
        end

        local python = Terminal:new({ cmd = "python", hidden = true })

        function _PYTHON_TOGGLE()
            python:toggle()
        end

        local powershell = Terminal:new({ cmd = "wsl -d Ubuntu", hidden = true })
        function _POWERSHELL_TOGGLE()
            powershell:toggle()
        end

        local pwsh = Terminal:new({cmd = "pwsh", hidden = true})
        function _PWSH_TOGGLE()
          pwsh:toggle()
        end


        vim.api.nvim_set_keymap("n", "<c-\\>", "<cmd>lua _POWERSHELL_TOGGLE()<CR>", {noremap = true, silent = true})


        local status_ok, alpha = pcall(require, "alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e C:/Users/Dell/AppData/Local/nvim/init.vim <CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
            }
        local function footer()
        return "Do The Simplest Thing That Could Possibly Work"
        end
        dashboard.section.footer.val = footer()
        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
        local last_echo = { false, -1, -1 }

        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "c" },
            sync_install = false,
            ignore_install = { "javascript" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                },
            }
        require("telescope").load_extension('harpoon')
        require("nvim-tree").setup()

require('lualine').setup{
  options = {
    theme = 'gruvbox-material',
  },
}
require("telescope").load_extension("ui-select")
local Path = require('plenary.path')
require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  }, 
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})
local nvimux = require('nvimux')
nvimux.setup{
  config = {
    prefix = '<C-a>',
  },
  bindings = {
    {{'n', 'v', 'i', 't'}, 's', nvimux.commands.horizontal_split},
    {{'n', 'v', 'i', 't'}, 'v', nvimux.commands.vertical_split},
  }
}
EOF
