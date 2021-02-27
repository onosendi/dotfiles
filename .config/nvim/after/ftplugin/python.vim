setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
" setlocal textwidth=88
setlocal autoindent
setlocal smarttab
let b:ale_linters = ['flake8']
let b:ale_fixers = ['black', 'isort']
let b:ale_fix_on_save = 1
