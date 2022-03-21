colorscheme monokai_pro
set number
set laststatus=2
set nocompatible
syntax enable
filetype plugin indent on
" status bar always display
"set omnifunc=syntaxcomplete#Complete
if &term =~ '256color'
  set t_ut=
endif
if match($TERM, 'screen.xterm-256color')!=-1
  set mouse=a
endif
" Store .swp files in the following dir
set directory=/home/m0numentum/.config/nvim/swapfiles/
" Move cursor as you type a pattern to search
set incsearch
" Mapping shortcuts (normal mode)
" M = Alt
" S = Shift
" File Explorer
nnoremap <S-T> :NERDTree %<CR>
nnoremap <S-W> :tabclose<CR>
nnoremap <F12> :call Loc()<CR>
"nnoremap <S-F12> :lclose<CR>
nnoremap <C-E> :tabprevious<CR>
nnoremap <C-T> :tabnext<CR>
" Move tab right
nnoremap <C-H> :tabm -1<CR>
" Move tab left
nnoremap <C-L> :tabm +1<CR>
nnoremap <F3> :noh<CR>
nnoremap <C-B> :tabnew term://bash<CR>
" Refresh file
nnoremap <F5> :e!<CR>
nnoremap <C-Space> <C-w>
nnoremap <Space> za<CR>


" Mapping shortcuts (insert mode)
inoremap <F12> <C-o>:call Loc()<CR>
inoremap <C-E> <C-o>:tabprevious<CR>
inoremap <C-T> <C-o>:tabnext<CR>
inoremap <C-H> <C-o>:tabm +1<CR>
inoremap <C-L> <C-o>:tabm -1<CR>
inoremap <F3> <C-o>:noh<CR>
inoremap <C-B> <C-o>:tabnew term://bash<CR>
inoremap <F5> <C-o>:e!<CR>

"" Mapping in terminal mode
" set termwinkey=<C-@>
tnoremap <C-X> <C-@>:q!<CR>
tnoremap <Esc> <C-@><C-N><CR>


" Configuration for python files
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
	\ set backspace=indent,eol,start |

" Configuration for markdown files
au BufNewFile,BufRead *.md
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" Configuration for bash files
au BufNewFile,BufRead *.sh
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" Configuration for C files
au BufNewFile,BufRead *.c
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" Configuration for javascript files
au BufNewFile,BufRead *.js
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" Configuration for YAML files
au Filetype yaml call Do_my_stuff_yaml()
function Do_my_stuff_yaml()
	setlocal tabstop=2
	setlocal softtabstop=2
	setlocal shiftwidth=2
	setlocal expandtab
	setlocal autoindent
	setlocal fileformat=unix
endfunc

au BufNewFile,BufRead *.rasi 
	\ setf css |
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" netrw configuration
let g:netrw_browse_split = 0	   " Replace  netrw with the opened file
let g:netrw_liststyle = 3	   " Tree style for listing files


" NERDTree configuration
let NERDTreeMapOpenInTab='<ENTER>' " Open file in a new tab when hitting ENTER
let NERDTreeQuitOnOpen=1	   " Quit NERDTree when file is opened
let NERDTreeShowHidden=1

call plug#begin('~/.config/nvim/plugz')
	Plug 'preservim/nerdtree'
	Plug 'bling/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'jiangmiao/auto-pairs'
	Plug 'dense-analysis/ale'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
let g:airline_theme='monokai_pro'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
    \'python': ['pycodestyle'],
    \}
" let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_lint_on_text_changed = 'always'

let g:deoplete#enable_at_startup = 1
