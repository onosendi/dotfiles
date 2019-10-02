" Author: Daniel Lindegren


" General ---------------------------------------------------------------------

set nocompatible                 " Use Vim settings, rather than Vi.
let mapleader = ","              " Assign map leader.
set encoding=utf8                " Set encoding.
set autoread                     " Auto read when file is changed externally.
set history=200                  " Number of lines of history to save.
set noswapfile                   " Do not create swap file.
set nobackup                     " Do not backup.
set nowritebackup                " Prevent automatic write backup before
                                 " overwriting file.
set lazyredraw                   " Don't redraw while exdecuting macros.
set magic                        " For regular expressions.
set fileformats=unix,mac,dos     " Standard filetypes.


" UI --------------------------------------------------------------------------

syntax on                        " Enable syntax highlighting.
colorscheme gruvbox              " Colorscheme.
set t_md=                        " Disable bold colors
set ruler                        " Always show the cursor's position.
set number relativenumber        " Hybrid line number and relative numbers.
let loaded_matchparen = 1        " Turn off parenthesis match highlighting.
set nofoldenable                 " Do not fold code.
set cmdheight=1                  " Height of the command bar.
highlight NonText ctermbg=none
highlight CursorLineNr ctermbg=none

" macOS specific.
if has("unix")
  if system("echo -n \"$(uname -s)\"") == "Darwin"
    highlight Normal ctermbg=none
  endif
endif


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


" Filetypes -------------------------------------------------------------------

filetype on                      " Enable filetype detection.
filetype plugin on               " Enable filetype plugin.
filetype indent on               " Enable filetype plugin indenting.

autocmd BufNewFile,BufRead *.rasi setf css

" When opening a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif


" Functions -------------------------------------------------------------------

function! g:ToggleNumberMode()
  if &rnu == 1
      set number norelativenumber
  else
     set number relativenumber
  endif
endfunction


" Custom Key Bindings ---------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>
noremap <silent> <leader>c :let @/=""<cr>
noremap <silent><leader>w :w!<cr>
noremap <silent><leader>q :q<cr>
noremap <silent><leader>l :call g:ToggleNumberMode()<cr>
let g:user_emmet_leader_key='<C-e>'

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Load plugins ----------------------------------------------------------------

packadd nerdtree
packadd emmet-vim
packadd vim-flake8
packadd vim-surround


" Emmet settings --------------------------------------------------------------

let g:user_emmet_settings = {
\  'html': {
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<meta charset=\"${charset}\">\n"
\              ."<title></title>\n"
\              ."</html>",
\    }
\  }
\}
