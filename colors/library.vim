"============================================================================
"  _   _  _____  ___
" | \ | ||  ___|/ _ \
" |  \| || |_  | (_) |
" | |\  ||  _|  \__, |
" |_| \_||_|      /_/
"
" Name:     Library vim colorscheme
" Author:   NoiseFrk900 <NoiseFreak900@gmail.com>
" Modified: 2020-11-26
" ============================================================================

"Setup
set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="library"
let Italic = ""
if exists('g:library_italic')
	let Italic = "italic"
endif
let g:library_italic = get(g:, 'library_italic', 0)

let Bold = ""
if exists('g:library_bold')
	let Bold = "bold"
endif

let g:library_bold = get(g:, 'library_bold', 0)


"Global
hi ColorColumn				guibg=#105058
hi Constant		guifg=#34e28b
hi EndOfBuffer		guifg=#c4a000
hi FoldColumn		guifg=#00bfa5	guibg=NONE
hi Folded 		guifg=#00bfa5	guibg=NONE
hi Function		guifg=#34e2e2
hi LineNr		guifg=#586e75	guibg=NONE
hi NonText		guifg=NONE	guibg=NONE	ctermfg=NONE	ctermbg=NONE
hi Normal		guifg=#209aa9   guibg=NONE	ctermbg=NONE
hi Pmenu 		guifg=#00bfa5	guibg=#143521	gui=bold
hi PmenuSbar		guibg=#002900
hi PmenuSel		guifg=#0d4521	guibg=#00bfa5	gui=bold
hi PmenuThumb		guibg=#009681
hi Special		guifg=#34e2e2	gui=bold
hi Statement 		guifg=#ffb732
hi StatusLine		guifg=#80a0ff	guibg=#330055
hi StatusLineNC		guifg=#666666	guibg=#1d1f21
hi String		guifg=#964fe1	guibg=#NONE
hi number.c		guifg=#34e28b
hi Underlined		guifg=#c4a000

hi @markup.link.markdown	guifg=#7e9dfa
hi @markup.link.markdown_inline	guifg=#34e2e2
hi @markup.link.url.markdown	guifg=#ffa0a0
hi @markup.link.url.markdown_inline	guifg=#ffa0a0
hi @markup.link.label.markdown	guifg=#34e2e2 gui=bold
hi @markup.link.label.markdown_inline	guifg=#34e2e2 gui=bold

hi @markup.heading.1.markdown	guifg=#a169b1 gui=bold
hi @markup.heading.2.markdown	guifg=#a169b1 gui=bold
hi @markup.heading.3.markdown	guifg=#a169b1 gui=bold
hi @markup.heading.4.markdown	guifg=#a169b1 gui=bold
hi @markup.heading.5.markdown	guifg=#a169b1 gui=bold
hi @markup.heading.6.markdown	guifg=#a169b1 gui=bold


hi @markup.quote.markdown	guifg=#34e28b
hi @punctuation.special.markdown guifg=#c4a000
hi @punctuation.delimiter.markdown guifg=#c4a000
hi @markup.raw.block.markdown	guifg=#34e2e2 gui=bold
hi @markup.raw.markdown_inline	guifg=#34e2e2 gui=bold
hi @markup.list.markdown	guifg=#c4a000 gui=bold


"C
hi cBadBlock		guibg=#ff0000
"hi cBlock
hi cCharacter		guifg=#ff00ff
hi cCommentStart	guifg=#839496	gui=NONE
hi cComment		guifg=#839496	gui=NONE
hi cConditional		guifg=#ffb732	gui=bold
hi cConstant		guifg=#ffb732
hi cErrInParen		guibg=#ff0000
hi cFloat		guifg=#34e28b
hi cFormat		guifg=#ea70ea	gui=bold
hi cInclude		guifg=#34e2e2	gui=NONE
hi cIncluded		guifg=#a169b2	gui=NONE
hi cLabel		guifg=#ffb732	gui=bold
hi cNumber		guifg=#34e28b
hi cOperator		guifg=#ffb732
hi cParen		guifg=#ea70ea
hi cParenError		guibg=#ff0000
hi cRepeat		guifg=#ffb732	gui=bold
hi cString		guifg=#964fe1	gui=NONE
hi cSpecial		guifg=#ea70ea	gui=bold
hi cStatement		guifg=#34e2e2	gui=bold
hi cStorageClass	guifg=#ea70ea	gui=bold
hi cStructure		guifg=#fc394f	gui=bold
hi cType		guifg=#34e2e2	gui=bold
hi cUserLabel		guifg=#fce94f	gui=bold


"Grid Music Score
hi barLine		guifg=#34e2e2	gui=bold
hi beatsPerMinute	guifg=#ff0000	gui=bold
hi duration		guifg=#839496	gui=bold
hi Expression		guifg=#34e2e2	gui=bold
hi Instruments		guifg=#34e2e2	gui=bold
hi measureNumber	guifg=#c4a000	gui=bold
hi note_0		guifg=#ff0000	gui=bold
hi note_1		guifg=#FCE94F	gui=bold
hi note_2		guifg=#34d28b	gui=bold
hi note_3		guifg=#0080ff	gui=bold
hi note_4		guifg=#FFFFFF	gui=bold
hi note_5		guifg=#0080ff	gui=bold
hi note_6		guifg=#34d28b	gui=bold
hi note_7		guifg=#FCE94F	gui=bold
hi note_8		guifg=#ff0000	gui=bold
hi octave_0		guifg=#ff0000	gui=bold
hi octave_1		guifg=#FCE94F	gui=bold
hi octave_2		guifg=#34d28b	gui=bold
hi octave_3		guifg=#0080ff	gui=bold
hi octave_4		guifg=#FFFFFF	gui=bold
hi octave_5		guifg=#0080ff	gui=bold
hi octave_6		guifg=#34d28b	gui=bold
hi octave_7		guifg=#FCE94F	gui=bold
hi octave_8		guifg=#ff0000	gui=bold
hi tempo		guifg=#ff0000	gui=bold
hi timeSignature	guifg=#ff0000	gui=bold
hi title		guifg=#80a0ff	gui=bold


"Lua
hi luaStatement        guifg=#34e2e2	gui=bold
hi luaRepeat           guifg=#ffb732	gui=bold
hi luaFor              guifg=#ffb732	gui=bold
hi luaString           guifg=#964fe1	gui=NONE
hi luaString2          guifg=#964fe1	gui=NONE
hi luaStringDelimiter  guifg=#964fe1	gui=NONE
hi luaNumber           guifg=#34e28b
hi luaOperator         guifg=#ffb732
hi luaSymbolOperator   guifg=#ffb732
hi luaConstant         guifg=#ffb732
hi luaCond             guifg=#ffb732	gui=bold
hi luaCondElse         guifg=#ffb732	gui=bold
hi luaFunction         guifg=#fce94f	gui=bold
hi luaMetaMethod       guifg=#fce94f	gui=bold
hi luaComment          guifg=#839496	gui=NONE
hi luaCommentDelimiter guifg=#839496	gui=NONE
"hi luaTodo             Todo
hi luaTable            guifg=#fc394f	gui=bold
hi luaError            guibg=#ff0000
hi luaParenError       guibg=#ff0000
hi luaSpecial          guifg=#ea70ea	gui=bold
hi luaFunc             guifg=#00ff00
hi luaLabel            guifg=#fce94f	gui=bold


"Markdown
hi htmlTag			guifg=#01a69d	gui=NONE
hi htmlTagN			guifg=#34e2e2	gui=bold
hi htmlTagName			guifg=#34e2e2	gui=bold
hi markdownBold					gui=bold
hi markdownBoldDelimiter			gui=bold
hi markdownBoldItalic				gui=bold,italic
hi markdownH1			guifg=#a169b1	gui=bold
hi markdownH2			guifg=#a169b1	gui=bold
hi markdownH3			guifg=#a169b1	gui=bold
hi markdownH4			guifg=#a169b1	gui=bold
hi markdownH5			guifg=#a169b1	gui=bold
hi markdownH6			guifg=#a169b1	gui=bold
hi markdownHeadingDelimiter	guifg=#a169b1	gui=bold
"hi markdownId			guifg=#
"hi markdownIdDeclaration	guifg=#
hi markdownItalic				gui=italic
"hi markdownLinkText		guifg=#
"hi markdownLinkTextDelimiter	guifg=#
hi markdownListMarker		guifg=#c4a000	gui=bold
hi markdownOrderedListMarker	guifg=#c4a000	gui=bold
"hi markdownUrl			guifg=#
"hi markdownUrlDelimiter	guifg=#

"Python
"
hi pythonAttribute	guifg=#c4a000
hi pythonBuiltin	guifg=#34e2e2	gui=bold
hi pythonComment	guifg=#00bfa5
hi pythonConditional	guifg=#c4a000	gui=bold
hi pythonException	guifg=#c4a000	gui=bold
hi pythongInclude	guifg=#a169b1	gui=bold
hi pythonNumber		guifg=#34e28b
hi pythonOperator	guifg=#c4a000	gui=bold
hi pythonQuotes		guifg=#ea70ea
hi pythonRepeat		guifg=#c4a000	gui=bold
hi pythonString		guifg=#964fe1


"Ruby
hi rubyComment			guifg=#839496
hi rubyLocalVariableOrMethod	guifg=#34e2e2	gui=bold
hi rubyString			guifg=#964fe1
hi rubyStringDelimiter		guifg=#ea70ea


"Shell
"hi kshSpecialVariables
"hi kshStatement
hi PreProc	 	guifg=#ff00ff
hi shAlias		guifg=#a169b2	gui=NONE
"hi shCase
"hi shCaseEsac
"hi shCaseIn
hi shCaseLabel		guifg=#34e2e2	gui=bold
hi shCaseSingleQuote	guifg=#964fe1
"hi shCmdSubRegion
hi shCommandSub		guifg=#34e2e2
hi shComment		guifg=#839496
hi shConditional	guifg=#ffb732	gui=bold
"hi shDerefOp
hi shDerefSimple	guifg=#ea70ea	gui=bold
"hi shDerefVar
hi shDoubleQuote	guifg=#964fe1
"hi shEscape
hi shExpr		guifg=#34e2e2	gui=bold
"hi shIf
hi shNumber		guifg=#34e28b
hi shOperator		guifg=#ffb732	gui=bold
"hi shOption
hi shQuote		guifg=#964fe1
"hi shRange
hi shSet		guifg=#a169b2	gui=NONE
"hi shSetList
hi shSetOption		guifg=#ff00ff
hi shSingleQuote	guifg=#964fe1
"hi shSnglCase 
hi shStatement		guifg=#34e2e2	gui=bold
"hi shTestOpr
"hi shTestPattern
"hi shVar
"hi shVarAssign
hi shVariable		guifg=#a169b2	gui=NONE


"Vim
"hi vimAugroup
hi vimAugroupKey	guifg=#ffa500	gui=bold
hi vimAutoCmd		guifg=#ffa500	gui=bold
"hi vimAutoCmdSfxList
hi vimAutoEvent		guifg=#34e2e2	gui=bold
"hi vimAutoEventList
hi vimBracket		guifg=#ffa500
hi vimCommand		guifg=#ffa500	gui=bold
"hi vimEcho
"hi vimFilter
"hi vimFuncBody
hi vimFuncKey		guifg=#34e28b	gui=bold
"hi vimFuncName
"hi vimFuncSID
hi vimFunction		guifg=#34e2e2
hi vimGroup		guifg=#34e2e2	gui=bold
hi vimHiAttrib		guifg=#ea70ea
hi vimHiCTerm		guifg=#18737e
hi vimHiCtermFgBg	guifg=#18737e
hi vimHighlight		guifg=#a169b1	gui=bold
hi vimHiGroup		guifg=#34e2e2	gui=bold
hi vimHiGui		guifg=#18737e
hi vimHiGuiFgBg		guifg=#18737e
hi vimHiGuiRgb		guifg=#ea70ea
"hi vimIsCommand
hi vimLineComment	guifg=#839496
hi vimHiNmbr		guifg=#34e2e2
"hi vimLet
hi vimMap		guifg=#34e2e2	gui=bold
hi vimMapLhs		guifg=#ea70ea
"hi vimMapRhs
hi vimMapMod		guifg=#80a0ff
hi vimMapModKey		guifg=#80a0ff
hi vimNotation		guifg=#ffa500
"hi vimNotFunc
"hi vimOper
"hi vimOperParen
hi vimOption		guifg=#a169b1
"hi vimParenSep
"hi vimSep
"hi vimSet
hi vimString		guifg=#a169b1
"hi vimStringEnd
hi vimSynType		guifg=#00bfa5
"hi vimVar


"Yaml
hi yamlBlockMappingKey		guifg=#0080ff	gui=bold
hi yamlComment			guifg=#839496
hi yamlInteger			guifg=#a169b1
hi yamlKeyValueDelimiter	guifg=#a169b1
hi yamlPlainScalar		guifg=#a169b1


"Zettel
hi tagH1			guifg=#80a0ff	gui=bold
hi tagH2			guifg=#80a0ff	gui=bold
hi tagH3			guifg=#80a0ff	gui=bold
hi tagH4			guifg=#80a0ff	gui=bold
hi tagH5			guifg=#80a0ff	gui=bold
hi tagH6			guifg=#80a0ff	gui=bold
hi timestamp			guifg=#00bfa5
hi htmlTag			guifg=#00bfa5	gui=NONE
hi htmlTagN			guifg=#34e2e2	gui=bold
hi htmlTagName			guifg=#34e2e2	gui=bold
hi zettelBold					gui=bold
hi zettelBoldDelimiter				gui=bold
hi zettelBoldItalic				gui=bold,italic
hi zettelH1			guifg=#a169b1	gui=bold
hi zettelH2			guifg=#a169b1	gui=bold
hi zettelH3			guifg=#a169b1	gui=bold
hi zettelH4			guifg=#a169b1	gui=bold
hi zettelH5			guifg=#a169b1	gui=bold
hi zettelH6			guifg=#a169b1	gui=bold
hi zettelHeadingDelimiter	guifg=#a169b1	gui=bold
hi zettelId			guifg=#00ff00
hi zettelIdDeclaration		guifg=#00ff00
"hi zettelIdDelimiter		guifg=#00bfa5
hi zettelItalic					gui=italic
"hi zettelLinkDelimiter		guifg=#00bfa5
hi zettelLinkText		guifg=#80a0ff	gui=underline
"hi zettelLinkTextDelimiter	guifg=#00bfa5
hi zettelListMarker		guifg=#c4a000	gui=bold
hi zettelOrderedListMarker	guifg=#c4a000	gui=bold
hi zettelUrl			guifg=#ffa0a0
"hi zettelUrlDelimiter		guifg=#00bfa5
hi zettelOutline		guifg=#80a0ff	gui=bold
hi zettelArgument		guifg=#cc0000	gui=bold
hi zettelPersonalNote		guifg=#00ff00	gui=bold
hi zettelLectureNote		guifg=#34e2e2	gui=bold
hi zettelAnnotation		guifg=#ffb732	gui=bold
hi zettelCode			guifg=#0080ff	
hi zettelCommentary1		guifg=#ff7f50	gui=bold 
hi zettelCommentary2		guifg=#18be66	gui=bold 
hi zettelCommentary3		guifg=#4e9a06	gui=bold 
hi zettelCommentary4		guifg=#aa00aa	gui=bold 
hi zettelTodo			guifg=#000000	guibg=#ffff00	gui=bold
hi zettelFootnote		guifg=#ff7f50
hi zettelFootnoteDefinition	guifg=#ff7f50


"EXAMPLE and Color Pool
"hi htmlTagN			guifg=#34e2e2 ctermfg=256 guibg=NONE ctermbg=NONE gui=NONE gui=NONE
"old grey normal #586e75 then #839496
"old background #002b36
"terminal green #00bfa5
"other green #34d28b
"purple #a169b1
"red or magenta #ff00ff
"vibrant pink #ff00cc
"#ff9999 is about hte URL tag color
"#ff7f50 coral

"TERMINAL
"		Text	Background
"Default	#19757f	#031a1a
"Bold		#00bcd4
"Cursor		#8c9eff #303f9f
"Highlight	#8c9eff #303f9f
"
"		MINE	LINUX	XTERM	RXVT	TANGO	SLRIZED	ICEBERG
"
"00 black	#073642	#000000	#000000	#000000	#2e3436	#073642	#1e2132
"01 red		#dc322f	#aa0000	#cd0000	#cd0000	#cc0000	#dc322f	#e27878
"02 green	#9fac22	#00aa00	#00cd00	#00cd00	#4e9a06	#859900	#b4be82
"03 yellow	#b58900	#aa5500	#cdcd00	#cdcd00	#c4a000	#b58900	#e2a478
"04 blue	#268bd2	#0000aa	#0000ee	#0000cd	#3465a4	#268bd2	#84a0c6
"05 magenta	#d33682	#aa00aa	#cd00cd	#cd00cd	#75507b	#d33682	#a093c7
"06 cyan	#2aa198	#00aaaa	#00cdcd	#00cdcd	#06989a	#2aa198	#89b8c2
"07 white	#eee8d5	#aaaaaa	#e5e5e5	#faebd7	#d3d7cf	#eee8d5	#c6c8d1
"
"		Bright
"08 black	#002b36	#555555	#7f7f7f	#404040	#555753	#002b36	#6b7089
"09 red		#cb4b16	#ff5555	#ff0000	#ff0000	#ef2929	#cb4b16	#e98989
"10 green	#00bfa5	#55ff55	#00ff00	#00ff00	#8ae234	#586e75	#c0ca8e
"11 yellow	#50d0fe	#ffff55	#ffff00	#ffff00	#fce94f	#657b83	#e9b189
"12 blue	#4dd0e1	#5555ff	#5c5cff	#0000ff	#729fcf	#839496	#91acd1
"13 magenta	#6c71c4	#ff55ff	#ff00ff	#ff00ff	#ad7fa8	#6c71c4	#ada0d3
"14 cyan	#59d4d4	#55ffff	#00ffff	#00ffff	#34e2e2	#93a1a1	#95c4ce
"15 white	#fdf6e3	#ffffff	#ffffff	#ffffff	#eeeeec	#fdf6e3	#d2d4de
"
"No Dim Colors Set
"
"Others
"black		#839496
"red		#ff0000	#fc394f
"green		#01a69d	#8ae234
"yllw(orge)	#c4a000	#ffb732	#fce94f
"blue		#0080ff	#00bfa5
"magnt(prp)	#a169b1	#ea70ea	#a758fb	#964fe1
"cyan		#18737e	#34e2e2
"white		d	#964fe1

"#18737e
"Shades #156771 #135c64 #105058 #0e454b #0c393f #092e32 #072225 #041719 #020b0c
"Tints  #2f818a #468f97 #5d9daf #74abb1 #8bb9be #a2c7cb #b9d5d8 #d0e3e5 #e7f1f2
"Monochromatic #0c383e #104c53 #145f69 #18737e #1c8793 #209aa9 #24aebe
"triadic colors #7e1873	#737e18
"analogous colors #18407e #187e56
"Complementary #7e2318
"
"NOISE COLORS
"		LINUX	WHITE	PINK	BROWN	BLUE	VIOLET	GREY
"
"00 black	#000000	######
"01 red		#aa0000	######
"02 green	#00aa00	######
"03 yellow	#aa5500	######
"04 blue	#0000aa	######
"05 magenta	#aa00aa	######
"06 cyan	#00aaaa	######
"07 white	#aaaaaa	######
"
"		Bright
"08 black	#555555	######
"09 red		#ff5555	######
"10 green	#55ff55	######
"11 yellow	#ffff55	######
"12 blue	#5555ff	######
"13 magenta	#ff55ff	######
"14 cyan	#55ffff	######
"15 white	#ffffff	
