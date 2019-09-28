"
" ~/.vimrc
"

" General ---------------------------------------------------------------------
let mapleader = " "              " Assign map leader.
set nocompatible                 " Use Vim settings, rather than Vi.
set encoding=utf8                " Set encoding.
colorscheme gruvbox              " Colorscheme.
set t_md=                        " Disable bold colors
set autoread                     " Auto read when file is changed externally.
set history=200                  " Number of lines of history to save.
set ruler                        " Always show the cursor's position.
set number relativenumber        " Hybrid line number and relative numbers.
set cmdheight=1                  " Height of the command bar.
set noswapfile                   " Do not create swap file.
set nobackup                     " Do not backup.
set nowritebackup                " Prevent automatic write backup before
                                 " overwriting file.
set autoindent                   " Auto indent for any file type.
set backspace=indent,eol,start
set lazyredraw                   " Don't redraw while exdecuting macros.
set magic                        " For regular expressions.
let loaded_matchparen = 1        " Turn off parenthesis match highlighting.
set fileformats=unix,mac,dos     " Standard filetypes.
set nofoldenable                 " Do not fold code.
syntax on                        " Enable syntax highlighting.
highlight NonText ctermbg=none   " Help make other 'nothing exist' region
                                 " transparent. 
filetype on                      " Enable filetype detection.
filetype plugin on               " Enable filetype plugin.
filetype indent on               " Enable filetype plugin indenting.

" Load Pathogen.
execute pathogen#infect()
execute pathogen#helptags()

" When opening a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif


" Status line -----------------------------------------------------------------
set laststatus=2                 " Always show the status line.
set statusline=\
    \ %F%m%r%h\ %w\ \
    \ CWD:\ %{getcwd()}\ \ \
    \ Line:\ %l\ \ \ Column:\ %c


" Searching -------------------------------------------------------------------
set ignorecase                  " Ignore case when searching.
set smartcase                   " When searching, try to be smart about cases.
set hlsearch                    " Highlight search results.
set incsearch                   " Search as you type.

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

" Key bindings ----------------------------------------------------------------
let g:user_emmet_leader_key="<C-Y>,"  " Assign emmet leader key. 

noremap <C-n> :NERDTreeToggle<cr>
noremap <silent> <leader>c :let @/=""<cr>
noremap <silent><leader>w :w!<cr>
noremap <silent><leader>q :q<cr>

" Navigate split view via :sv <filename> or :vs <filename>.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

function! g:ToggleMode()
  if &rnu == 1
      set number norelativenumber
  else
     set number relativenumber
  endif
endfunction
nnoremap <silent><leader>l :call g:ToggleNuMode()<cr>

" Filetypes -------------------------------------------------------------------

" Force CSS syntax.
au BufNewFile,BufRead *.rasi setf css

" Python ----------------------------------------------------------------------

" Make python code look pretty.
let python_hightlight_all = 1

" Decorate these keywords.
au FileType python syn keyword pythonDecorator True None False self
