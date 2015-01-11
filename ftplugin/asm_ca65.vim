" Vim filetype plugin file
" Language:     CA65 Assembler for 6502 Architectures
" Maintainer:   Max Bane <max.bane@gmail.com>

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1
let s:keepcpo= &cpo
set cpo&vim

setlocal include=^\\s*\\.\\(include\\\|incbin\\\\|macpack\\)
setlocal comments=b:;
setlocal commentstring=;\ %s
setlocal formatoptions+=ro
set wildignore+=*.o

let &cpo = s:keepcpo
unlet s:keepcpo
