""" Optixal's Neovim Init.vim

""" Vim-Plug
call plug#begin()
" Aesthetics - Main
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bryanmylee/vim-colorscheme-icons'
" Plug 'mhinz/vim-startify'
Plug 'goolord/alpha-nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" packer install
Plug 'wbthomason/packer.nvim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'nightsense/forgotten'
Plug 'zaki/zazen'
Plug 'Deadcoder11u2/monokai.nvim'
" Aethetics - Additional
Plug 'nightsense/nemo'
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'vim-scripts/loremipsum'
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'
Plug 'psliwka/vim-smoothie'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'wellle/context.vim'

" Entertainment
Plug 'dansomething/vim-hackernews'

" Vscode Theme
Plug 'Mofiqul/vscode.nvim'

" BufferLine
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Alpha Vim
" Plug 'goolord/alpha-nvim'
Plug 'liuchengxu/vim-clap'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'

" Toggle Terminal
Plug 'akinsho/toggleterm.nvim'
call plug#end()

let g:dashboard_default_executive ='telescope'


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

""" Coloring

" Functions and autocmds to run whenever changing colorschemes
function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\│
    highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

function! DraculaPMenu()
    highlight Pmenu guibg=#363948
    highlight PmenuSbar guibg=#363948
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula call DraculaPMenu()
    "autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that
augroup END

" Main Coloring Configurations
syntax on
" colorscheme monokai_soda

" Vim-Script:
" For dark theme
let g:vscode_style = "dark"
" For light theme
" let g:vscode_style = "light"
" Enable transparent background
let g:vscode_transparency = 1
" Enable italic comment
let g:vscode_italic_comment = 1
" Disable nvim-tree background color
" let g:vscode_disable_nvimtree_bg = v:true
colorscheme monokai_ristretto


" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors

""" Plugin Configurations

" NERDTree
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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

" Startify

"let g:startify_fortune_use_unicode = 1

" use {
"     'goolord/alpha-nvim',
"     requires = { 'kyazdani42/nvim-web-devicons' },
"     config = function ()
"         require'alpha'.setup(require'alpha.themes.startify'.config)
"     end
" }

" Startify + NERDTree on start when no file is specified
" let g:startify_custom_header = [
"     \ '    ___       ___       ___       ___       ___       ___    ',
"     \ '   /\__\     /\  \     /\  \     /\__\     /\  \     /\__\   ',
"     \ '  /:| _|_   /::\  \   /::\  \   /:/ _/_   _\:\  \   /::L_L_  ',
"     \ ' /::|/\__\ /::\:\__\ /:/\:\__\ |::L/\__\ /\/::\__\ /:/L:\__\ ',
"     \ ' \/|::/  / \:\:\/  / \:\/:/  / |::::/  / \::/\/__/ \/_/:/  / ',
"     \ '   |:/  /   \:\/  /   \::/  /   L;;/__/   \:\__\     /:/  /  ',
"     \ '   \/__/     \/__/     \/__/               \/__/     \/__/   ',]

" let g:startify_lists = [
"             \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
"             \ { 'header': ['   MRU'],            'type': 'files' },
"             \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
"             \ ]


autocmd VimEnter *
            \   if !argc()
            \ |   wincmd w
            \ | endif



" coc.vim START
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc.vim END

" signify
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw =1

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme='dracula'
    " color dracula
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    " color seoul256
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Other light airline themes: tomorrow, silver, alduin
    let g:airline_theme='tomorrow'
    " Other light colors: forgotten-light, nemo-light
    " color forgotten-light
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='minimalist'
    " color zazen
endfunction

function! ColorVscode()
    let g:airline_theme='google_dark'
    " color vscode
endfunction

""" Custom Mappings

let mapleader=","
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>q :NERDTreeToggle<CR>
nmap \\ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap \| <leader>w
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorSeoul256()<CR>
nmap <leader>e3 :call ColorForgotten()<CR>
nmap <leader>e4 :call ColorZazen()<CR>
nmap <leader>e5 :call ColorVscode()<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>y <C-w>v<C-w>l:HackerNews best<CR>J
nmap <leader>p <Plug>(pydocstring)
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>s :Rg<CR>
nmap <leader>d :Telescope find_files<CR>
nmap <leader>f :BLines<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
nmap <leader>l :Limelight!!<CR>
autocmd FileType python nmap <leader>x :0 , $!~/.config/nvim/env/bin/python -m yapf<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

nmap <C-BS> <C-w>
nmap <C-h> <C-w>

set termguicolors
lua << EOF
    require("bufferline").setup{}
    local status_ok, telescope = pcall(require, "telescope")
    local actions = require "telescope.actions"
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

    local powershell = Terminal:new({ cmd = "powershell", hidden = true })
    function _POWERSHELL_TOGGLE()
        powershell:toggle()
    end

    vim.api.nvim_set_keymap("n", "<c-\\>", "<cmd>lua _POWERSHELL_TOGGLE()<CR>", {noremap = true, silent = true})
EOF
