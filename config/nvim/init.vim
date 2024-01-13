""" General setup
let &runtimepath.=', "~/.config/nvim"'
"colorscheme catppuccin
set nosol
set noequalalways
set mouse=
" set mouse=a
" Setting up linenumbers as relative
set number relativenumber
" Absolute line numbers when in Insert mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
" Color status
if &term =~ '256color'
  set t_ut=
endif
if match($TERM, 'screen.xterm-256color')!=-1
  set mouse=a
endif
" Store .swp files in the following dir
set directory=/home/fdesjeunes/.config/nvim/swapfiles/
" Move cursor as you type a pattern to search
set incsearch
" Enabling status line
set laststatus=2
set statusline+=%F
let g:editorconfig=v:false

""" File formatting
" Syntax highlighting
syntax on
" Enabling filetype detection
filetype on
filetype plugin on
filetype indent on
"filetype plugin indent on
" Code folding
set foldmethod=indent
set nofoldenable
set foldlevel=99

augroup myautocmds
    autocmd!
    " Configuration for ansible files
    au BufNewFile,BufRead */main.yaml/*
        \ setlocal filetype=yaml.ansible |
        \ setlocal ts=2 |
        \ setlocal sts=2 |
        \ setlocal sw=2 |
        \ setlocal expandtab |
        \ setlocal fileformat=unix |
        \ setlocal indentkeys-=0#

    " Configuration for python files
    au BufNewFile,BufRead *.py
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal textwidth=79 |
        \ setlocal expandtab |
        \ setlocal autoindent |
        \ setlocal fileformat=unix |
        \ setlocal backspace=indent,eol,start |

    " Configuration for markdown files
    au BufNewFile,BufRead *.md
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal textwidth=79 |
        \ setlocal expandtab |
        \ setlocal autoindent |
        \ setlocal fileformat=unix |

    " Configuration for bash files
    au BufNewFile,BufRead *.sh
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal expandtab |
        \ setlocal textwidth=79 |
        \ setlocal autoindent |
        \ setlocal fileformat=unix |

    " Configuration for C files
    au BufNewFile,BufRead *.c
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal expandtab |
        \ setlocal autoindent |
        \ setlocal fileformat=unix |

    " Configuration for javascript files
    au BufNewFile,BufRead *.js
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal expandtab |
        \ setlocal autoindent |
        \ setlocal fileformat=unix |

    " Configuration for terraform files
    au BufNewFile,BufRead *.tf
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal expandtab |
        \ setlocal autoindent |
        \ setlocal textwidth=79 |
        \ setlocal fileformat=unix |
        \ setlocal filetype=terraform |
    "
    " Configuration for terraform files
    au BufNewFile,BufRead *.hcl
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal expandtab |
        \ setlocal autoindent |
        \ setlocal textwidth=79 |
        \ setlocal fileformat=unix |
        \ setlocal filetype=hcl |

    au FileType yaml set tabstop=2 autoindent shiftwidth=2 sts=2 sw=2 expandtab fileformat=unix indentkeys-=0#
    au FileType json setlocal ts=2 sts=2 sw=2 expandtab fileformat=unix
augroup end

" Configuration for YAML files
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab fileformat=unix indentkeys-=0#
"
"" Configuration for JSON files
"autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab fileformat=unix

""" Mappings

" Mapping shortcuts (normal mode)
" M = Alt
" S = Shift
" File Explorer
nnoremap <S-T> :NvimTreeToggle<CR>
nnoremap <S-W> :tabclose<CR>
"nnoremap <S-F12> :lclose<CR>
nnoremap <C-E> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>
" Move tab right
nnoremap <C-H> :tabm -1<CR>
" Move tab left
nnoremap <C-K> :tabm +1<CR>
nnoremap <F3> :noh<CR>
nnoremap <C-T> :terminal<CR>
" Refresh file
nnoremap <F5> :e!<CR>
nnoremap <C-Space> <C-w>
nnoremap <Space> za<CR>


" Mapping shortcuts (insert mode)
inoremap <C-E> <C-o>:tabprevious<CR>
inoremap <C-L> <C-o>:tabnext<CR>
inoremap <C-H> <C-o>:tabm +1<CR>
inoremap <C-K> <C-o>:tabm -1<CR>
inoremap <F3> <C-o>:noh<CR>
"inoremap <C-T> <C-o>:tabnew term://bash<CR>
inoremap <C-T> <C-o>:terminal<CR>
inoremap <F5> <C-o>:e!<CR>

"" Mapping in terminal mode
tnoremap <C-X> <C-\>:q!<CR>
tnoremap <Esc> <C-\><C-N><CR>

" netrw configuration
" let g:netrw_browse_split = 0	   " Replace  netrw with the opened file
" let g:netrw_liststyle = 3	   " Tree style for listing files
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

""" Plugins
call plug#begin('~/.config/nvim/plugz')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'towolf/vim-helm'
Plug 'pearofducks/ansible-vim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
call plug#end()

" ALE config
let g:ale_disable_lsp = 1
let g:ale_linters = {
    \'python': ['pycodestyle'],
    \'terraform': ['terraform'],
    \'hcl': ['terraform-fmt'],
    \'yaml': ['yamllint'],
    \}
" let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_lint_on_text_changed = 'always'

" Coc settings
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <silent><expr> <c-space> coc#refresh()
"if has('nvim-0.4.3')
"    nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"    nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"    inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"    inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"endif


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:term_buf_id = 0
let g:term_win = 0
let g:term_tab_id = 0
function! TermToggle()
    if g:term_buf_id != 0 && getbufinfo(g:term_buf_id)[0].hidden == 0
	    if tabpagenr() == g:term_tab_id
		    execute g:term_win . "close!"
	    else
		    let lasttab = tabpagenr()
		    execute "tabn" . g:term_tab_id
		    execute g:term_win . "close!"
		    execute "tabn" . lasttab
		    execute "botrigh sb " . g:term_buf_id
	            let g:term_tab_id = tabpagenr()
		    exec "resize 25"
		    set nonu
	            set norelativenumber
		    let g:term_buf_id = bufnr("%")
		    let g:term_win = winnr()
		    let g:term_tab_id = tabpagenr()
	    endif
    else
	if g:term_buf_id != 0
	    execute "botrigh sb " . g:term_buf_id
	else
		botright new
		call termopen($SHELL, {"detach": 0})
	endif
        exec "resize 25"
	set nonu
	set norelativenumber
        let g:term_buf_id = bufnr("%")
        let g:term_win = winnr()
	let g:term_tab_id = tabpagenr()
    endif
endfunction

nnoremap <F4> :call TermToggle()<CR>


let g:coc_filetype_map = {
   \ 'yaml.ansible': 'ansible',
   \}

" neoformat config
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END


" nvim-tree settings
lua << EOF
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'o', api.tree.change_root_to_node,        opts('cd'))
end

require('nvim-tree').setup({
        on_attach = my_on_attach,
	view = {
		preserve_window_proportions = true,
		width = 50,
	},
	git = {
		ignore = false
	},
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	},
	actions = {
		open_file = {
			quit_on_open = true
		}
	}
})

require('catppuccin').setup{
	color_overrides = {
		all = {
			text = "#f4dbd6",
		}
	},
	integrations = {
		treesitter = false
		}
}
EOF

" Catppuccin transparent background necessary for XFCE terminal

colorscheme catppuccin-macchiato
" Airline config
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 0
let g:airline_theme='catppuccin'
let g:airline_powerline_fonts = 1
let g:airline#extentions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_c = '%F'
