" Vim syntax file
" Language:     CA65 Assembler for 6502 Architectures
" Maintainer:   Max Bane <max.bane@gmail.com>
"               Martin Krischik <krischik@users.sourceforge.net>

" For version 5.x: Clear all syntax items
" For version 6.0 and later: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" Numeric literals
syn match asm_ca65DecNumber "\<\d\+\>"
syn match asm_ca65HexNumber "\$[0-9a-fA-F]\+\>"
syn match asm_ca65HexNumber "\<[0-9a-fA-F]\+h\>"
syn match asm_ca65BinNumber "%[0-1]\+\>"

" labels and identifiers
syn match asm_ca65Identifier    "[a-z_][a-z0-9_]*"
syn match asm_ca65Label         "[a-z_][a-z0-9_]*:"he=e-1
syn match asm_ca65Identifier    "[a-z_][a-z0-9_]*::"he=e-2
" FIXME this doesn't hightlight :-/
syn match asm_ca65Op                "::"

syn match asm_ca65UnknownCommand    "\.\w*\>"

" expression operators
syn match asm_ca65Op "+"
syn match asm_ca65Op "-"
syn match asm_ca65Op "\~"
syn match asm_ca65Op "\.BITNOT\>"
syn match asm_ca65Op "<"
syn match asm_ca65Op "\.LOBYTE\>"
syn match asm_ca65Op ">"
syn match asm_ca65Op "\.HIBYTE\>"
syn match asm_ca65Op "\^"
syn match asm_ca65Op "\.BANKBYTE\>"
syn match asm_ca65Op "*"
syn match asm_ca65Op "/"
syn match asm_ca65Op "\.MOD\>"
syn match asm_ca65Op "&"
syn match asm_ca65Op "\.BITAND\>"
syn match asm_ca65Op "\.BITXOR\>"
syn match asm_ca65Op "<<"
syn match asm_ca65Op "\.SHL\>"
syn match asm_ca65Op ">>"
syn match asm_ca65Op "\.SHR\>"
syn match asm_ca65Op "|"
syn match asm_ca65Op "\.BITOR\>"
syn match asm_ca65Op "="
syn match asm_ca65Op "<>"
syn match asm_ca65Op "<"
syn match asm_ca65Op ">"
syn match asm_ca65Op "<="
syn match asm_ca65Op ">="
syn match asm_ca65Op "&&"
syn match asm_ca65Op "\.AND\>"
syn match asm_ca65Op "\.XOR\>"
syn match asm_ca65Op "||"
syn match asm_ca65Op "\.OR\>"
syn match asm_ca65Op "!"
syn match asm_ca65Op "\.NOT\>"

" 6502 instruction mnemonics
syn keyword asm_ca65Mnemonic 
 \ ADC AND ASL BCC BCS BEQ BIT BMI BNE BPL BRK BVC BVS CLC CLD CLI CLV CMP CPX
 \ CPY DEC DEX DEY EOR INC INX INY JMP JSR LDA LDX LDY LSR NOP ORA PHA PHP PLA
 \ PLP ROL ROR RTI RTS SBC SEC SED SEI STA STX STY TAX TAY TSX TXA TXS TYA

syn keyword asm_ca65WDC
 \ BRA BRL COP DEA INA JML MVN MVP PEA PEI PER PHB PHD PHK PHX PHY PLB PLD PLP
 \ PLX PLY REP RTL SEP STP STZ TCD TCS TDC TRB TSB TSC TXY TYX WAI XBA XCE  

syn keyword asm_ca65Rockwell
 \ BBR BBR0 BBR1 BBR2 BBR3 BBR4 BBR5 BBR6 BBR7
 \ BBS BBS0 BBS1 BBS2 BBS3 BBS4 BBS5 BBS6 BBS7
 \ RMB RMB0 RMB1 RMB2 RMB3 RMB4 RMB5 RMB6 RMB7
 \ SMB SMB0 SMB1 SMB2 SMB3 SMB4 SMB5 SMB6 SMB7

syn keyword asm_ca65MacPack 
 \ ADD SUB BGE BLT BGT BLE BNZ BZE
 \ JEQ JNE JMI JPL JCS JCC JVS JVC

" 6502 illegal instruction mnemonics
syn keyword asm_ca65MnemonicIllegal
 \ ALR ANC ARR AXS DCP ISC LAS LAX RLA RRA SAX SLO SRE

" Special prefix characters on literals
"   @foo -- cheap local label
syn match asm_ca65SpecialPrefix "@"
"   #123 -- immediate mode
syn match asm_ca65SpecialPrefix "#"

"
" Control commands
"
"   Fileopts
syn match asm_ca65FileOpt "\.fileopt\s\+.\+" contains=asm_ca65FileOptKeyword,asm_ca65FileOptString
syn keyword asm_ca65FileOptKeyword contained author comment compiler
syn region asm_ca65FileOptString contained start=+"+ skip=+\\"+ end=+"+
"   Segments and address size keywords
syn region asm_ca65Segment       start=/.segment\s\+"/ skip=/\\"/ end=/"/ contains=asm_ca65SpecialSegment
syn keyword asm_ca65AddressSize  DIRECT ZEROPAGE ZP ABS ABSOLUTE NEAR FAR LONG DWORD
syn keyword asm_ca65SpecialSegment  contained ZEROPAGE ZP CODE RODATA BSS DATA
syn match asm_ca65Segment               "\.pushseg\>"
syn match asm_ca65Segment               "\.popseg\>"
syn match asm_ca65SpecialSegmentCommand "\.code\>"
syn match asm_ca65SpecialSegmentCommand "\.bss\>"
syn match asm_ca65SpecialSegmentCommand "\.data\>"
syn match asm_ca65SpecialSegmentCommand "\.rodata\>"
syn match asm_ca65SpecialSegmentCommand "\.zeropage\>"
"   Includes
syn match asm_ca65Include    "\.include\>"
syn match asm_ca65Include    "\.incbin\>"
syn match asm_ca65Include    "\.macpack\>"
"   Imports / Exports
"   Storage types / reservation
syn match asm_ca65Type "\.addr\>"
syn match asm_ca65Type "\.faraddr\>"
syn match asm_ca65Type "\.asciiz\>"
syn match asm_ca65Type "\.byt\>"
syn match asm_ca65Type "\.byte\>"
syn match asm_ca65Type "\.bankbytes\>"
syn match asm_ca65Type "\.dbyt\>"
syn match asm_ca65Type "\.dword\>"
syn match asm_ca65Type "\.hibytes\>"
syn match asm_ca65Type "\.lobytes\>"
syn match asm_ca65Type "\.tag\>"
syn match asm_ca65Type "\.word\>"
syn match asm_ca65Type "\.res\>"
"   Conditionals
syn match asm_ca65Cond        "\.if\>"
syn match asm_ca65Cond        "\.ifp02\>"
syn match asm_ca65Cond        "\.ifpc02\>"
syn match asm_ca65Cond        "\.ifpsc02\>"
syn match asm_ca65Cond        "\.ifp816\>"
syn match asm_ca65Cond        "\.ifblank\>"
syn match asm_ca65Cond        "\.ifconst\>"
syn match asm_ca65Cond        "\.ifnblank\>"
syn match asm_ca65Cond        "\.ifdef\>"
syn match asm_ca65Cond        "\.ifndef\>"
syn match asm_ca65Cond        "\.ifref\>"
syn match asm_ca65Cond        "\.ifnref\>"
syn match asm_ca65Cond        "\.else\>"
syn match asm_ca65Cond        "\.elseif\>"
syn match asm_ca65Cond        "\.endif\>"
syn match asm_ca65Cond        "\.repeat\>"
syn match asm_ca65Cond        "\.endrepeat\>"
"   Macro stuff
syn match asm_ca65Macro         "\.macro\s\+[a-z0-9_]*" contains=asm_ca65MacroName
syn match asm_ca65MacroName     "\s[a-z_][a-z0-9_]*"hs=s+1 contained
syn match asm_ca65Macro         "\.endmacro\>"
syn match asm_ca65Macro         "\.exitmacro\>"
syn match asm_ca65Macro         "\.exitmac\>"
syn match asm_ca65Macro         "\.delmacro\>"
syn match asm_ca65Macro         "\.local\>"
syn match asm_ca65Define        "\.define\>"
syn match asm_ca65Define        "\.undefine\>"
syn match asm_ca65Define        "\.undef\>"
"   Structy stuff
syn match asm_ca65Struct        "\.\(struct\|union\)" contains=asm_ca65StructName
syn match asm_ca65Struct        "\.\(struct\|union\|scope\)\s\+[a-z0-9_]*" contains=asm_ca65StructName
syn match asm_ca65Struct        "\.enum\s\?[a-z0-9_]*" contains=asm_ca65StructName
syn match asm_ca65Struct        "\.end\(struct\|union\|enum\|scope\|proc\)\>"
syn match asm_ca65StructName    "\s[a-z_][a-z0-9_]*"hs=s+1 contained
syn match asm_ca65Struct        "\.proc\s\+[a-z0-9_]*" contains=asm_ca65ProcName
syn match asm_ca65ProcName      "\s[a-z_][a-z0-9_]*"hs=s+1 contained
" FIXME: this doesn't seem to catch the end of the struct (folds all the way to
" EOF)
"syn region asm_ca65StructFold start="\.struct" end="\.endstruct" fold transparent 
"   Pseudo-variables
syn match asm_ca65PseudoVar "\.cpu\>"
syn match asm_ca65PseudoVar "\.paramcount\>"
syn match asm_ca65PseudoVar "\.time\>"
syn match asm_ca65PseudoVar "\.version\>"
"   Psuedo-functions
syn match asm_ca65PseudoFun "\.BANK\>"
syn match asm_ca65PseudoFun "\.BANKBYTE\>"
syn match asm_ca65PseudoFun "\.BLANK\>"
syn match asm_ca65PseudoFun "\.CONCAT\>"
syn match asm_ca65PseudoFun "\.CONST\>"
syn match asm_ca65PseudoFun "\.DEF\>"
syn match asm_ca65PseudoFun "\.DEFINED\>"
syn match asm_ca65PseudoFun "\.HIBYTE\>"
syn match asm_ca65PseudoFun "\.HIWORD\>"
syn match asm_ca65PseudoFun "\.IDENT\>"
syn match asm_ca65PseudoFun "\.LEFT\>"
syn match asm_ca65PseudoFun "\.LOBYTE\>"
syn match asm_ca65PseudoFun "\.LOWORD\>"
syn match asm_ca65PseudoFun "\.MATCH\>"
syn match asm_ca65PseudoFun "\.MAX\>"
syn match asm_ca65PseudoFun "\.MID\>"
syn match asm_ca65PseudoFun "\.MIN\>"
syn match asm_ca65PseudoFun "\.REF\>"
syn match asm_ca65PseudoFun "\.REFERENCED\>"
syn match asm_ca65PseudoFun "\.RIGHT\>"
syn match asm_ca65PseudoFun "\.SIZEOF\>"
syn match asm_ca65PseudoFun "\.STRAT\>"
syn match asm_ca65PseudoFun "\.SPRINTF\>"
syn match asm_ca65PseudoFun "\.STRING\>"
syn match asm_ca65PseudoFun "\.STRLEN\>"
syn match asm_ca65PseudoFun "\.TCOUNT\>"
syn match asm_ca65PseudoFun "\.XMATCH\>"
"   Console output directives
syn match asm_ca65ConsoleOut    "\.out\>"
syn match asm_ca65ConsoleWarn   "\.warning\>"
syn match asm_ca65ConsoleError  "\.error\>"
syn match asm_ca65ConsoleFatal  "\.fatal\>"
"   Linker symbol import/export commands
syn match asm_ca65Linker    "\.export\>"
syn match asm_ca65Linker    "\.exportzp\>"
syn match asm_ca65Linker    "\.import\>"
syn match asm_ca65Linker    "\.importzp\>"
syn match asm_ca65Linker    "\.global\>"
syn match asm_ca65Linker    "\.globalzp\>"
syn match asm_ca65Linker    "\.forceimport\>"
syn match asm_ca65Linker    "\.constructor\>"
syn match asm_ca65Linker    "\.destructor\>"
syn match asm_ca65Linker    "\.condes\>"
syn match asm_ca65Linker    "\.interruptor\>"
syn match asm_ca65Linker    "\.autoimport\>"
syn match asm_ca65Linker    "\.align\>"
syn match asm_ca65Linker    "\.reloc\>"
syn match asm_ca65Linker    "\.org\>"
"   Special flags, switches, etc.
syn match asm_ca65SpecialSwitch "\.a16\>"
syn match asm_ca65SpecialSwitch "\.a8\>"
syn match asm_ca65SpecialSwitch "\.i16\>"
syn match asm_ca65SpecialSwitch "\.i8\>"
syn match asm_ca65SpecialSwitch "\.smart\>"
syn match asm_ca65SpecialSwitch "\.case\>"
syn match asm_ca65SpecialSwitch "\.debuginfo\>"
syn match asm_ca65SpecialSwitch "\.linecont\>"
syn match asm_ca65SpecialSwitch "\.list\>"
syn match asm_ca65SpecialSwitch "\.listbytes\>"
syn match asm_ca65SpecialSwitch "\.localchar\>"
syn match asm_ca65SpecialSwitch "\.p02\>"
syn match asm_ca65SpecialSwitch "\.p816\>"
syn match asm_ca65SpecialSwitch "\.pagelen\>"
syn match asm_ca65SpecialSwitch "\.pagelength\>"
syn match asm_ca65SpecialSwitch "\.pc02\>"
syn match asm_ca65SpecialSwitch "\.popcpu\>"
syn match asm_ca65SpecialSwitch "\.psc02\>"
syn match asm_ca65SpecialSwitch "\.pushcpu\>"
syn match asm_ca65SpecialSwitch "\.setcpu\>"
syn match asm_ca65SpecialSwitch "\.feature\>"
"   Built-in macros and function-likes
syn match asm_ca65Builtin   "\.assert\>"
syn match asm_ca65Builtin   "\.set\>"

" String and char literals
syn region asm_ca65String   start=+"+ skip=+\\"+ end=+"+
syn region asm_ca65Char     start=+'+ skip=+\\'+ end=+'+

" Line comments
syn match asm_ca65Comment   ";.*" contains=asm_ca65Todo,@Spell
syn keyword asm_ca65Todo    contained TODO FIXME XXX HACK

syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asm_ca65_syntax_inits")
  if version < 508
    let did_asm_ca65_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink asm_ca65Comment    Comment
  HiLink asm_ca65Todo       Todo
  HiLink asm_ca65Mnemonic   Keyword
  HiLink asm_ca65Label      Identifier
  HiLink asm_ca65Identifier NONE

  if exists("g:asm_ca65_macpack")
    HiLink asm_ca65MacPack    Statement
  endif
  if exists("g:asm_ca65_wdc")
    HiLink asm_ca65WDC        Keyword
  endif
  if exists("g:asm_ca65_rockwell")
    HiLink asm_ca65Rockwell   Keyword
  endif

  HiLink asm_ca65MnemonicIllegal    Special

  HiLink asm_ca65Include    Include
  HiLink asm_ca65Cond       PreCondit
  HiLink asm_ca65Macro      Macro
  HiLink asm_ca65Define     Define
  HiLink asm_ca65MacroName  Function

  HiLink asm_ca65HexNumber  Number
  HiLink asm_ca65DecNumber  Number
  HiLink asm_ca65BinNumber  Number
  HiLink asm_ca65String     String
  HiLink asm_ca65Char       Character

  HiLink asm_ca65UnknownCommand Error

  HiLink asm_ca65Type                   Type
  HiLink asm_ca65Segment                PreProc
  HiLink asm_ca65AddressSize            StorageClass
  HiLink asm_ca65SpecialSegment         Delimiter
  HiLink asm_ca65SpecialSegmentCommand  Delimiter

  HiLink asm_ca65FileOpt         PreProc
  HiLink asm_ca65FileOptKeyword  Special
  HiLink asm_ca65FileOptString   Underlined

  HiLink asm_ca65SpecialPrefix   SpecialChar
  HiLink asm_ca65Op              Operator

  HiLink asm_ca65Struct     Keyword
  HiLink asm_ca65StructName Structure
  HiLink asm_ca65ProcName   Function

  HiLink asm_ca65PseudoVar  Special
  HiLink asm_ca65PseudoFun  Function

  HiLink asm_ca65ConsoleOut     Function
  HiLink asm_ca65ConsoleWarn    Debug
  HiLink asm_ca65ConsoleError   Special
  HiLink asm_ca65ConsoleFatal   Underlined

  HiLink asm_ca65Linker StorageClass

  HiLink asm_ca65SpecialSwitch  Underlined
  HiLink asm_ca65Builtin        Function

  delcommand HiLink
endif

let b:current_syntax = "asm_ca65"

let &cpo = s:cpo_save
unlet s:cpo_save

