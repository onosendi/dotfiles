" Load plugins ----------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

Plug('morhetz/gruvbox')
Plug('mattn/emmet-vim')
Plug('junegunn/fzf')
Plug('junegunn/fzf.vim')
Plug('preservim/nerdtree')
Plug('vim-airline/vim-airline')
Plug('dense-analysis/ale')
Plug('Yggdroot/indentLine')
Plug('sheerun/vim-polyglot')
Plug('dylnmc/synstack.vim')
Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')
Plug('tpope/vim-eunuch')
Plug('tpope/vim-repeat')
Plug('tpope/vim-fugitive')
Plug('neoclide/coc.nvim')

call plug#end()


" General ---------------------------------------------------------------------

set nocompatible                 " Use Vim settings, rather than Vi. This must
                                 " be the set on the first line or it may have
                                 " some unexpected results.
let mapleader = " "              " Assign map leader.
set encoding=utf8                " Set encoding.
set autoread                     " Auto read when file is changed externally.
set history=200                  " Number of lines of history to save.
set noswapfile                   " Do not create swap file.
set nobackup                     " Do not backup.
set nowritebackup                " Prevent automatic write backup before
                                 " overwriting file.
set hidden                       " Send buffer to memory.
set lazyredraw                   " Don't redraw while exdecuting macros.
set magic                        " For regular expressions.
set fileformats=unix,mac,dos     " Standard filetypes.
set wildmenu                     " Show file menu when tabbing.


" UI --------------------------------------------------------------------------

syntax on                        " Enable syntax highlighting.
set bg=dark                      " Use dark background.
set t_md=                        " Disable bold colors
set ruler                        " Always show the cursor's position.
set number relativenumber        " Hybrid line number and relative numbers.
let loaded_matchparen = 1        " Turn off parenthesis match highlighting.
set nofoldenable                 " Do not fold code.
set cmdheight=1                  " Height of the command bar.
set termguicolors
highlight NonText ctermbg=none
highlight CursorLineNr ctermbg=none

" macOS specific.
if has('mac')
  highlight Normal ctermbg=none
endif


" Searching -------------------------------------------------------------------

set ignorecase                  " Ignore case when searching.
set smartcase                   " When searching, try to be smart about cases.
set hlsearch                    " Highlight search results.
set incsearch                   " Search as you type.

" Clear search results
noremap <silent> <leader>dc :let @/=""<cr>


" Default Tabs and wrapping ---------------------------------------------------

set expandtab                   " Use spaces instead of tabs.
set tabstop=2                   " Number of spaces for each tab.
set shiftwidth=2                " How many columns of text is indented with the
                                " reindent operations (<< and >>).
set softtabstop=2               " How many columns vim uses when you hit Tab in
                                " insert mode.
set nowrap                      " Do not wrap lines.
set whichwrap+=<,>,h,l,[,]      " Wrap and beginning and end of lines. (< > are
                                " the cursor keys used in
                                " normal and visual mode, and [ ] are the
                                " cursor keys in insert mode).


" Filetypes -------------------------------------------------------------------

filetype on                      " Enable filetype detection.
filetype plugin on               " Enable filetype plugin.
filetype indent on               " Enable filetype plugin indenting.

" When opening a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif


" ToggleNumberMode ------------------------------------------------------------

noremap <silent><leader>dl :call g:ToggleNumberMode()<cr>

function! g:ToggleNumberMode()
  if &rnu == 1
      set number norelativenumber
  else
     set number relativenumber
  endif
endfunction


" Custom Key Bindings ---------------------------------------------------------

" Switching tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt

" Navigating windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fix split sizing
nnoremap <leader>ds <C-W>=


" Nerdtree --------------------------------------------------------------------

let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeWinSize = 35
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
map <silent><C-n> :NERDTreeToggle<CR>


" Emmet settings --------------------------------------------------------------

let g:user_emmet_leader_key = '<C-e>'


" Fzf -------------------------------------------------------------------------

" nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>f :Files<cr>
" nnoremap <leader>fF :GFiles<cr>
" nnoremap <leader>fw :Windows<cr>


" Airline ---------------------------------------------------------------------

" Don't show charset.
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = ''

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty = ''


" Gruvbox ---------------------------------------------------------------------

" let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


" Ale -------------------------------------------------------------------------

let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_sign_column_always = 0

nnoremap <silent><leader>af :ALEFix<CR>
nnoremap <silent><leader>al :ALELint<CR>
nnoremap <silent><leader>ar :ALEReset<CR>
nnoremap <silent><leader>an :ALENextWrap<CR>
nnoremap <silent><leader>ap :ALEPreviousWrap<CR>

" Always show the sign column.
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

highlight clear SignColumn


" indentLine ------------------------------------------------------------------

let g:indentLine_color_term = 237


" coc -------------------------------------------------------------------------

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-html',
  \ ]

inoremap <silent><expr> <c-space> coc#refresh()

" Go to definition.
nmap <silent>cgd <Plug>(coc-definition)

" Symbol renaming.
nmap <leader>crn <Plug>(coc-rename)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" polyglot --------------------------------------------------------------------

let g:python_highlight_space_errors = 0
let g:python_highlight_operators = 0
