" Vim syntax file
" Language:    Zettel 
" Maintainer:  Angelo Candelario
" Filenames:    *.zettel *.zt
" Last Change:  2025 Sep 6

" Port of Markdown syntax to zettelkasten

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'zettel'
endif

runtime! syntax/html.vim
unlet! b:current_syntax

if !exists('g:zettel_fenced_languages')
  let g:zettel_fenced_languages = []
endif
for s:type in map(copy(g:zettel_fenced_languages),'matchstr(v:val,"[^=]*$")')
  if s:type =~ '\.'
    let b:{matchstr(s:type,'[^.]*')}_subtype = matchstr(s:type,'\.\zs.*')
  endif
  exe 'syn include @zettelHighlight'.substitute(s:type,'\.','','g').' syntax/'.matchstr(s:type,'[^.]*').'.vim'
  unlet! b:current_syntax
endfor
unlet! s:type

syn sync minlines=10
syn case ignore

syn match zettelValid '[<>]\c[a-z/$!]\@!'
syn match zettelValid '&\%(#\=\w*;\)\@!'

syn match zettelLineStart "^[<@]\@!" nextgroup=@zettelBlock,htmlSpecialChar

syn cluster zettelBlock contains=zettelH1,zettelH2,zettelH3,zettelH4,zettelH5,zettelH6,zettelBlockquote,zettelListMarker,zettelOrderedListMarker,zettelCodeBlock,zettelRule
syn cluster zettelInline contains=zettelLineBreak,zettelLinkText,zettelItalic,zettelBold,zettelCode,zettelEscape,@htmlTop,zettelError

syn match zettelH1 "^.\+\n=\+$" contained contains=@zettelInline,zettelHeadingRule,zettelAutomaticLink
syn match zettelH2 "^.\+\n-\+$" contained contains=@zettelInline,zettelHeadingRule,zettelAutomaticLink

syn match zettelHeadingRule "^[=-]\+$" contained

syn region zettelH1 matchgroup=zettelHeadingDelimiter start="##\@!"      end="#*\s*$" keepend oneline contains=@zettelInline,zettelAutomaticLink contained
syn region zettelH2 matchgroup=zettelHeadingDelimiter start="###\@!"     end="#*\s*$" keepend oneline contains=@zettelInline,zettelAutomaticLink contained
syn region zettelH3 matchgroup=zettelHeadingDelimiter start="####\@!"    end="#*\s*$" keepend oneline contains=@zettelInline,zettelAutomaticLink contained
syn region zettelH4 matchgroup=zettelHeadingDelimiter start="#####\@!"   end="#*\s*$" keepend oneline contains=@zettelInline,zettelAutomaticLink contained
syn region zettelH5 matchgroup=zettelHeadingDelimiter start="######\@!"  end="#*\s*$" keepend oneline contains=@zettelInline,zettelAutomaticLink contained
syn region zettelH6 matchgroup=zettelHeadingDelimiter start="#######\@!" end="#*\s*$" keepend oneline contains=@zettelInline,zettelAutomaticLink contained

"I added the next 4 regions for note taking from lectures
syn region zettelPersonalNote start="\t\+\$\S\@!"      end="$" 
syn region zettelLectureNote start="\t\+&\S\@!"      end="$" 
syn region zettelAnnotation start="\t\+%\S\@!"      end="$" 
syn region zettelArgument start="\t\+!\S\@!"      end="$" 
syn region zettelCommentary1 start="\t\+§\S\@!"      end="$" 	
syn region zettelCommentary2 start="\t\+£\S\@!"      end="$" 	
syn region zettelCommentary3 start="\t\+¥\S\@!"      end="$" 	
syn region zettelCommentary4 start="\t\+¢\S\@!"      end="$" 	

syn region  zettelTag                start=+\[[^/]+   end=+\]+ 
"syn match   zettelTagN     contained +\[\s*[-a-zA-Z0-9]\++hs=s+1 
"syn match   zettelTagN     contained +\[\s*[-a-zA-Z0-9]\++hs=s+2 

syn match zettelBlockquote ">\%(\s\|$\)" contained nextgroup=@zettelBlock

"syn region zettelCodeBlock start="    \|\t" end="$" contained

" TODO: real nesting
syn match zettelListMarker "\%(\t\| \{0,4\}\)[-*+]\%(\s\+\S\)\@=" contained
syn match zettelOrderedListMarker "\%(\t\| \{0,4}\)\<\d\+\.\%(\s\+\S\)\@=" contained

syn match zettelRule "\* *\* *\*[ *]*$" contained
syn match zettelRule "- *- *-[ -]*$" contained

syn match zettelLineBreak " \{2,\}$"

syn region zettelIdDeclaration matchgroup=zettelLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=zettelUrl skipwhite
syn match zettelUrl "\S\+" nextgroup=zettelUrlTitle skipwhite contained
syn region zettelUrl matchgroup=zettelUrlDelimiter start="<" end=">" oneline keepend nextgroup=zettelUrlTitle skipwhite contained
syn region zettelUrlTitle matchgroup=zettelUrlTitleDelimiter start=+"+ end=+"+ keepend contained
syn region zettelUrlTitle matchgroup=zettelUrlTitleDelimiter start=+'+ end=+'+ keepend contained
syn region zettelUrlTitle matchgroup=zettelUrlTitleDelimiter start=+(+ end=+)+ keepend contained

syn region zettelLinkText matchgroup=zettelLinkTextDelimiter start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=zettelLink,zettelId skipwhite contains=@zettelInline,zettelLineStart
syn region zettelLink matchgroup=zettelLinkDelimiter start="(" end=")" contains=zettelUrl keepend contained
syn region zettelId matchgroup=zettelIdDelimiter start="\[" end="\]" keepend contained
syn region zettelAutomaticLink matchgroup=zettelUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline

let s:concealends = has('conceal') ? ' concealends' : ''
exe 'syn region zettelItalic matchgroup=zettelItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=zettelLineStart' . s:concealends
exe 'syn region zettelItalic matchgroup=zettelItalicDelimiter start="\S\@<=_\|_\S\@=" end="\S\@<=_\|_\S\@=" keepend contains=zettelLineStart' . s:concealends
exe 'syn region zettelBold matchgroup=zettelBoldDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=zettelLineStart,zettelItalic' . s:concealends
exe 'syn region zettelBold matchgroup=zettelBoldDelimiter start="\S\@<=__\|__\S\@=" end="\S\@<=__\|__\S\@=" keepend contains=zettelLineStart,zettelItalic' . s:concealends
exe 'syn region zettelBoldItalic matchgroup=zettelBoldItalicDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" keepend contains=zettelLineStart' . s:concealends
exe 'syn region zettelBoldItalic matchgroup=zettelBoldItalicDelimiter start="\S\@<=___\|___\S\@=" end="\S\@<=___\|___\S\@=" keepend contains=zettelLineStart' . s:concealends

syn region zettelCode matchgroup=zettelCodeDelimiter start="`" end="`" keepend contains=zettelLineStart
syn region zettelCode matchgroup=zettelCodeDelimiter start="`` \=" end=" \=``" keepend contains=zettelLineStart
syn region zettelCode matchgroup=zettelCodeDelimiter start="^\s*```.*$" end="^\s*```\ze\s*$" keepend

syn match zettelFootnote "\[^[^\]]\+\]"
syn match zettelFootnoteDefinition "^\[^[^\]]\+\]:"

if main_syntax ==# 'zettel'
  for s:type in g:zettel_fenced_languages
    exe 'syn region zettelHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\..*','','').' matchgroup=zettelCodeDelimiter start="^\s*```\s*'.matchstr(s:type,'[^=]*').'\>.*$" end="^\s*```\ze\s*$" keepend contains=@zettelHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\.','','g')
  endfor
  unlet! s:type
endif

syn match zettelEscape "\\[][\\`*_{}()<>#+.!-]"
syn match zettelError "\w\@<=_\w\@="

"my edit
"syn match timestamp "[ABCE]\d\{12}"

"I added the outlining syntax
syn cluster zettelOutline contains=zettelOutlineH1,zettelOutlineH2,zettelOutlineH3,zettelOutlineH4,zettelOutlineH5,zettelOutlineH6,zettelOutlineH7,zettelOutlineH8

"I added the outlining syntax
syn region zettelOutlineH1 start="\_^[IVXLC]\{1}[IVXLC]\{0,1}[IVXLC]\{0,1}[IVXLC]\{0,1}[IVXLC]\{0,1}\.\s" end="$"
syn region zettelOutlineH2 start="\(\t\)\{1}\W\@!\u\{1}\.\s\W\@!" end="$"
syn region zettelOutlineH3 start="\(\t\)\{2}\W\@!\d\{1,2}\.\s\W\@!" end="$"
syn region zettelOutlineH4 start="\(\t\)\{3}\W\@!\U\{1}\.\s\W\@!" end="$"
syn region zettelOutlineH5 start="\(\t\)\{4}[ivxlc]\{1}[ivxlc]\{0,1}[ivxlc]\{0,1}[ivxlc]\{0,1}[ivxlc]\{0,1}\.\s" end="$"
syn region zettelOutlineH6 start="\(\t\)\{5}(\d\{1,2})" end="$"
syn region zettelOutlineH7 start="\(\t\)\{6}(\U\{1})" end="$"
syn region zettelOutlineH8 start="\(\t\)\{7}([ivxlc]\{1}[ivxlc]\{0,1}[ivxlc]\{0,1}[ivxlc]\{0,1}[ivxlc]\{0,1})\s" end="$"

syn keyword zettelTodo TODO

hi def link zettelH1                    htmlH1
hi def link zettelH2                    htmlH2
hi def link zettelH3                    htmlH3
hi def link zettelH4                    htmlH4
hi def link zettelH5                    htmlH5
hi def link zettelH6                    htmlH6
hi def link zettelHeadingRule           zettelRule
hi def link zettelHeadingDelimiter      Delimiter
hi def link zettelOrderedListMarker     zettelListMarker
hi def link zettelListMarker            htmlTagName
hi def link zettelBlockquote		zettelAnnotation	
hi def link zettelRule                  PreProc

hi def link zettelFootnote              Typedef
hi def link zettelFootnoteDefinition    Typedef

hi def link zettelLinkText              htmlLink
hi def link zettelIdDeclaration         Typedef
hi def link zettelId                    Type
hi def link zettelAutomaticLink         zettelUrl
hi def link zettelUrl                   Float
hi def link zettelUrlTitle              String
hi def link zettelIdDelimiter           zettelLinkDelimiter
hi def link zettelUrlDelimiter          htmlTag
hi def link zettelUrlTitleDelimiter     Delimiter
hi def link zettelTag			htmlTag

hi def link zettelItalic                htmlItalic
hi def link zettelItalicDelimiter       zettelItalic
hi def link zettelBold                  htmlBold
hi def link zettelBoldDelimiter         zettelBold
hi def link zettelBoldItalic            htmlBoldItalic
hi def link zettelBoldItalicDelimiter   zettelBoldItalic
hi def link zettelCodeDelimiter         Delimiter
hi def link zettelCode			Function

hi def link zettelEscape                Special
hi def link zettelError                 Error

hi def link zettelPersonalNote 		Question
hi def link zettelLectureNote		htmlTag
hi def link zettelAnnotation		Special
hi def link zettelArgument		WarningMsg
hi def link zettelCommentary		htmlTagN
hi def link zettelCommentary2		string

hi def link zettelOutlineH1		zettelOutline
hi def link zettelOutlineH2		zettelOutline
hi def link zettelOutlineH3		zettelOutline
hi def link zettelOutlineH4		zettelOutline
hi def link zettelOutlineH5		zettelOutline
hi def link zettelOutlineH6		zettelOutline
hi def link zettelOutlineH7		zettelOutline
hi def link zettelOutlineH8		zettelOutline
hi def link zettelOutline		PreProc

hi def link zettelTodo			Todo

let b:current_syntax = "zettel"
if main_syntax ==# 'zettel'
  unlet main_syntax
endif

" vim:set sw=2:
