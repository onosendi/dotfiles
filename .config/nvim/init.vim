" General ---------------------------------------------------------------------

set nocompatible                 " Use Vim settings, rather than Vi.
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
if has('mac')
  highlight Normal ctermbg=none
endif


" Searching -------------------------------------------------------------------

set ignorecase                  " Ignore case when searching.
set smartcase                   " When searching, try to be smart about cases.
set hlsearch                    " Highlight search results.
set incsearch                   " Search as you type.

" Clear search results
noremap <silent> <leader>c :let @/=""<cr>


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

noremap <silent><leader>l :call g:ToggleNumberMode()<cr>

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
nnoremap <leader>s <C-W>=


" Nerdtree --------------------------------------------------------------------

let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeWinSize = 35
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
map <silent><C-n> :NERDTreeToggle<CR>


" Emmet settings --------------------------------------------------------------

let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_settings = {
\  'html': {
\    'snippets': {
\      'html:5': "<!doctype html>\n"
\              ."<html lang=\"en\">\n"
\              ."<head>\n"
\              ."  <meta charset=\"utf-8\">\n"
\              ."  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
\              ."  <meta name=\"description\" content=\"\">\n"
\              ."  <title></title>\n"
\              ."</head>\n"
\              ."<body>\n"
\              ."</body>\n"
\              ."</html>",
\    }
\  },
\  'javascriptreact': {
\    'snippets': {
\      'afun': "const ${cursor} = () => {\n};",
\      'cl': "console.log(${cursor});",
\      'ce': "console.error(${cursor});",
\      'edfun': "export default function ${cursor}() {\n}",
\      'expd': "export default ${cursor};",
\      'expnd': "export { default } from './${cursor}';",
\      'rcc': "import React from 'react';\n\nexport default class Component extends React.Component {\n\trender() {\n\t\treturn (\n\t\t);\n\t}\n}",
\      'rfc': "import React from 'react';\n\nconst ${cursor}Component = () => {\n\treturn (\n\t);\n};\n\nexport default Component;",
\      'rfcp': "import PropTypes from 'prop-types';\nimport React from 'react';\n\nconst ${cursor}Component = (props) => {\n\tconst {\n\t} = props;\n\n\treturn (\n\t);\n};\n\nComponent.propTypes = {\n};\n\nexport default Component;",
\      'propd': "${cursor}.defaultProps = {\n};",
\      'propt': "${cursor}.propTypes = {\n};",
\    }
\  },
\  'javascript': {
\    'extends': 'javascriptreact',
\  }
\}


" Fzf -------------------------------------------------------------------------

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :GFiles<cr>
nnoremap <leader>w :Windows<cr>


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

" let g:gruvbox_contrast_dark = 'soft'
set bg=dark


" Ale -------------------------------------------------------------------------

let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 0

nnoremap <silent><leader>af :ALEFix<CR>
nnoremap <silent><leader>al :ALELint<CR>
nnoremap <silent><leader>ar :ALEReset<CR>
nnoremap <silent><leader>an :ALENextWrap<CR>
nnoremap <silent><leader>ap :ALEPreviousWrap<CR>


" indentLine ------------------------------------------------------------------

let g:indentLine_color_term = 237


" coc -------------------------------------------------------------------------

inoremap <silent><expr> <c-space> coc#refresh()


" polyglot --------------------------------------------------------------------

let g:python_highlight_space_errors = 0
let g:python_highlight_operators = 0


" Load plugins ----------------------------------------------------------------

" colors
packadd gruvbox

" plugins
packadd emmet-vim
packadd fzf.vim
packadd nerdtree
packadd vim-airline
packadd ale
packadd indentLine
packadd coc.nvim
packadd vim-polyglot
packadd synstack.vim " https://github.com/dylnmc/synstack.vim.git

" tpope
packadd vim-commentary
packadd vim-surround
packadd vim-eunuch
packadd vim-repeat
packadd vim-fugitive
