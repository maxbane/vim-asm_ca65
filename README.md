# vim-asm_ca65
Vim plugin for the `ca65` assembly language.

## Purpose

This repository provides a [Vim](http://www.vim.org/)
syntax-highlighting plugin, auto-indent plugin, and filetype plugin for the
[`ca65`](http://cc65.github.io/doc/ca65.html) assembly language.

`ca65` is a full-featured assembler for the [MOS
6502](https://en.wikipedia.org/wiki/MOS_Technology_6502) family of
microprocessors, which powered such historic platforms as the KIM I, Apple II,
Commodore 64, and Nintendo Entertainment System. It is a part of the popular
[`cc65`](https://github.com/cc65/cc65) suite of development tools for the 6502,
which also includes a C compiler, linker, object dumper, etc. `ca65` is
designed both for direct use by assembly programmers and as the compilation
target of the `cc65` C compiler. `ca65` is especially used by "homebrew"
communities for the [NES](http://nesdev.com), SNES, etc.

The stock Vim runtime distribution includes syntax modules for several dialects
of assembly, as well as a "generic" module (which is really for the GNU
Assembler), none of which works particularly well with 6502 assembly
conventions, and especially not with `ca65`'s many added features.

## Features

* Syntax highlighting
    * Highlights 6502 instruction mnemonics as keywords, with special highlighting
      for "illegal" instructions, and error highlighting for unknown (typo)
      instructions.
    * Highlights all valid `ca65` numeric and string literals, label
      definitions, and comments, with special highlighting for TODOs, FIXMEs, etc.
    * Highlights all valid expression operators and control comands, with special
      treatment for various classes of commands, including `.fileopt`, segment
      names, includes, macro definitions, storage types, conditional assembly,
      linker control commands, structs, unions, procedures, pseudo-functions, some
      built-in macros, console output commands (`.out`, `.warn`, .etc.), and
      assembler behavior switches.
* Auto-indent
    * Auto-indent under labels, `.proc`s, `.if` statements, macro definitions,
      macro call parameters, scopes, unions, and structs.  Automatically
      de-dent when closing these structures.
* Filetype plugin
    * Defines `ca65` comment syntax for Vim's automatic comment formatting features.
    * Recognizes `.include`, `.incbin`, and `.macpack` statements for Vim's
      include-aware features.

### Examples (screenshots)

#### Solarized colorscheme
![](https://raw.githubusercontent.com/maxbane/vim-syntax-asm_ca65/screenshots/sshot0-solarized.png)

![](https://raw.githubusercontent.com/maxbane/vim-syntax-asm_ca65/screenshots/sshot1-solarized.png)

#### Elflord colorscheme
![](https://raw.githubusercontent.com/maxbane/vim-syntax-asm_ca65/screenshots/sshot0-elflord.png)

![](https://raw.githubusercontent.com/maxbane/vim-syntax-asm_ca65/screenshots/sshot1-elflord.png)

## Limitations

* `asm_ca65.vim` currently has no awareness of, or support for, assembler
  options that change the rules of valid labels, identifiers, and literals from
  their defaults, for example the following `.feature` options and related
  command-line switches to `ca65`.
  * `.feature at_in_identifiers`
  * `.feature dollar_in_identifiers`
  * `.feature labels_without_colons`
  * `.feature underline_in_numbers`

## Installation and Usage

Install in the normal way (i.e., place the contents of the `syntax/`, `indent`/
and `ftplugin/` directories in corresonding locations in your vim runtime
path), or, if you use [Pathogen](https://github.com/tpope/vim-pathogen), clone
this repository under `~/.vim/bundle/`.

Everything is enabled by setting a buffer's `filetype` to `asm_ca65`. For
example, if all of your `ca65` assembly source files end with the `.s` and
`.inc` suffixes, the follwing suffices in your `.vimrc`:

```vim
filetype plugin indent on
augroup filetypedetect
    au BufNewFile,BufRead *.s,*.inc set ft=asm_ca65
augroup END
```

