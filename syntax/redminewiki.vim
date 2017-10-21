" Vim syntax file for Redmine wiki
"
" Language:     Redmine wiki
" Maintainer:   Petr Zemek <s3rvac@gmail.com>
" Home Page:    https://github.com/s3rvac/vim-syntax-redminewiki
" Last Change:  2017-10-21 16:09:24 +0200
" Version:      0.1.2
"
" Heavily based on the textile.vim syntax file by Kornelius Kalnbach
" <korny@cYcnus.de>, Mar 2006.
"
" The MIT License (MIT)
"
" Copyright (c) 2013 Petr Zemek
" Copyright (c) 2006 Kornelius Kalnbach
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" Quit if the syntax file has already been loaded
if exists("b:current_syntax")
	finish
endif

" Commands like "h1" are case sensitive
syntax case match

" =============================================================================
" Matches/regions
" =============================================================================

syntax match redmineGlyph /\(\s\@<=\([-x]\)\s\@=\|\.\.\.\|(\(TM\|R\|C\))\)/

syntax region redmineAcronym matchgroup=redmineAcronymTag start=/\<\u\{3,}(/ end=/)/

syntax cluster RedmineFormatTags contains=redmineLink,redmineWikiLink,redmineResourceLink,redmineImage,redmineAncronym,redmineEm,redmineStrong,redmineItalic,redmineBold,redmineCode,redmineSubtext,redmineSupertext,redmineCitation,redmineDeleted,redmineInserted,redmineSpan,redmineNoTextile,redmineGlyph,redmineAcronym,redmineHtml

syntax region redmineSpan oneline matchgroup=redmineFormatTagSpan contains=redmineSpanKeyword start=/\w\@<!%\s\@!/ end=/\s\@<!%\w\@!/

syntax region redmineEm oneline matchgroup=redmineFormatTag start=/\w\@<!_\s\@!/ end=/\s\@<!_\w\@!/ contains=@RedmineFormatTags
syntax region redmineStrong oneline matchgroup=redmineFormatTag start=/\w\@<!\*\s\@!/ end=/\s\@<!\*\w\@!/ contains=@RedmineFormatTags
syntax region redmineItalic oneline matchgroup=redmineFormatTag start=/\w\@<!__\s\@!/ end=/\s\@<!__\w\@!/ contains=@RedmineFormatTags
syntax region redmineBold oneline matchgroup=redmineFormatTag start=/\w\@<!\*\*\s\@!/ end=/\s\@<!\*\*\w\@!/ contains=@RedmineFormatTags

syntax region redmineCode oneline matchgroup=redmineFormatTag start=/\w\@<!@\s\@!/ end=/\s\@<!@\w\@!/
syntax region redmineSubtext oneline matchgroup=redmineFormatTag start=/\w\@<!\~\s\@!/ end=/\s\@<!\~\w\@!/
syntax region redmineSupertext oneline matchgroup=redmineFormatTag start=/\w\@<!\^\s\@!/ end=/\s\@<!\^\w\@!/
syntax region redmineCitation oneline matchgroup=redmineFormatTag start=/\w\@<!??\s\@!/ end=/\s\@<!??\w\@!/
syntax region redmineDeleted oneline matchgroup=redmineFormatTag start=/\w\@<!-\s\@!/ end=/\s\@<!-\w\@!/
syntax region redmineInserted oneline matchgroup=redmineFormatTag start=/\w\@<!+\s\@!/ end=/\s\@<!+\w\@!/

syntax match redmineHtml /<\/\=\w[^>]*>/
syntax match redmineHtml /&\w\+;/

syntax region redmineCode matchgroup=redmineTag start="<pre[^>]*>" end="</pre>"
syntax region redmineCode matchgroup=redmineTag start="<code[^>]*>" end="</code>"

syntax region redmineNoTextile matchgroup=redmineTag start=/\w\@<!==\s\@!/ end=/\s\@<!==\w\@!/
syntax region redmineNoTextile matchgroup=redmineTag start="<notextile>" end="</notextile>"

syntax match redmineHR /^-\{3,}/

syntax region redmineMacro matchgroup=redmineTag start="!\?{{" end="}}"

syntax region redmineH start=/^\(h[1-6]\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\.\( \|$\)\)\@=/ skip=/\n\n\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags,redmineKeyword
syntax region redmineP start=/^\(p\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\.\( \|$\)\)\@=/ skip=/\n\n\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags,redmineKeyword
syntax region redmineBQ start=/^\(bq\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\.\( \|$\)\)\@=/ skip=/\n\n\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags,redmineKeyword
syntax region redmineListItem matchgroup=redmineListDot start=/^\*\+\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\( \|$\)/ skip=/\n\(\*\|\n\)\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags
syntax region redmineListItem matchgroup=redmineListDot start=/^#\+\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]\)*\( \|$\)/ skip=/\n\(#\|\n\)\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags
syntax region redmineTable start=/^\(table\(\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[<>=]\)*\.\( \|$\)\)\@=/ skip=/\n\n\@!/ end=/\n/ keepend fold contains=@RedmineFormatTags,redmineKeyword

syntax region redmineKeyword contained start=/^\(bq\>\|p\>\|h[1-6]\>\|#\+\|\*\+\|table\>\)/ skip=/\[[^\]]*\]\|{[^}]*}\|([^)]*)\|[()]\+\|[<>=]/ end=/\.\=/ contains=redmineArg,redmineLang,redmineClass,redmineIndent,redmineArgError
syntax region redmineSpanKeyword contained start=/\(\w\@<!%\s\@!\)\@<=/ skip=/\[[^\]]*\]\|{[^}]*}\|([^)]*)\|(\+\|)\+\|[<>=]/ end=/./ contains=redmineArg,redmineLang,redmineClass,redmineIndent,redmineArgError
syntax region redmineArg contained matchgroup=redmineBrace start=/{}\@!/ end=/}/
syntax match redmineIndent contained /[()]\+\|[<>=]/
syntax region redmineClass contained matchgroup=redmineBrace start=/()\@!\([^)]\+)\)\@=/ end=/)/
syntax region redmineLang contained matchgroup=redmineBrace start=/\[\]\@!/ end=/\]/
syntax match redmineArgError contained /{}\|\[\]\|()/
syntax match redmineRestOfBlock contained /\_.*/ transparent

syntax match redmineImage /![^!(]*\(([^)]*)\)\=!/ contains=redmineImageURL
syntax region redmineImageURL matchgroup=redmineFormatTag contained contains=redmineImageTitle start=/!/ skip=/([^(])/ end=/!/ nextgroup=redmineLinkColon
syntax region redmineImageTitle matchgroup=redmineFormatTag contained start="(" end=")"

" Link with a name
syntax match redmineLink /"[^"]*":\S*[[:alnum:]_\/]/ keepend contains=redmineLinkName
syntax region redmineLinkName matchgroup=redmineBrace contained start=/"/ end=/"/ contains=@RedmineFormatTags nextgroup=redmineLinkColon
syntax match redmineLinkColon contained /:/ nextgroup=redmineLinkURL
syntax match redmineLinkURL contained /.*/

" Standalone link
syntax match redmineLink "\<\%(\%(\%(https\=\|file\|ftp\|gopher\)://\|\%(mailto\|news\):\)[^[:space:]'\"<>]\+\|www[[:alnum:]_-]*\.[[:alnum:]_-]\+\.[^[:space:]'\"<>]\+\)[[:alnum:]/]" contains=@NoSpell

" Standalone email address
syntax match redmineLink /[[:alnum:]._%+-]\+@[[:alnum:].-]\+\.[[:alnum:]]\+/ contains=@NoSpell

" Wiki links
syntax match redmineWikiLink /\[\[[^\]]\+\]\]/ contains=redmineWikiLinkURL
syntax region redmineWikiLinkURL matchgroup=redmineFormatTag contained contains=redmineWikiLinkTitle start=/\[\[/ end=/\]\]\?/
syntax region redmineWikiLinkTitle matchgroup=redmineFormatTag contained start=/[|:]/ end=/\]/

" Links to other resources
syntax match redmineResourceLink /\<\([[:alnum:]]\+:\)\?\(document\|version\|attachment\|news\|project\|message\|forum\|source\|export\|commit\)\(:"[^"]\+"\|:[[:alnum:]/@#|_.-]\+\|#[1-9][0-9]*\)/
syntax match redmineResourceLink /\<\([[:alnum:]]\+[:|]\)\?r[1-9][0-9]*/ contains=@NoSpell
syntax match redmineResourceLink /#[1-9][0-9]*/

" =============================================================================
" Highlighting
" =============================================================================

highlight default link redmineTag Special
highlight default link redmineFormatTag Special
highlight default link redmineNoTextile Normal

highlight default link redmineEm redmineItalic
highlight default link redmineStrong redmineBold
highlight default link redmineItalic redmineMakeItalic
highlight default link redmineBold redmineMakeBold
highlight default link redmineCode String

highlight default link redmineSubtext String
highlight default link redmineSupertext String
highlight default link redmineCitation String
highlight default link redmineDeleted String
highlight default link redmineInserted redmineUnderline

highlight default link redmineSpan Normal
highlight default link redmineFormatTagSpan redmineTag

highlight default link redmineH Title
highlight default link redmineHTag redmineTag
highlight default link redmineP Normal
highlight default link redminePTag redmineTag
highlight default link redmineBQ Normal
highlight default link redmineBQTag redmineTag
highlight default link redmineListDot Special
highlight default link redmineTable Normal
highlight default link redmineTableTag redmineTag

highlight default link redmineKeyword Special
highlight default link redmineArg Type
highlight default link redmineClass Statement
highlight default link redmineLang String
highlight default link redmineIndent String
highlight default link redmineArgError Error
highlight default link redmineBrace Special
highlight default link redmineRestOfBlock Number

highlight default link redmineLink Underlined
highlight default link redmineLinkName String
highlight default link redmineLinkColon redmineBrace
highlight default link redmineLinkURL Underlined

highlight default link redmineWikiLink Underlined
highlight default link redmineWikiLinkURL Underlined
highlight default link redmineWikiLinkTitle String
highlight default link redmineResourceLink Underlined

highlight default link redmineImage Statement
highlight default link redmineImageURL redmineLink
highlight default link redmineImageTitle String

highlight default link redmineGlyph Special
highlight default link redmineHR Title
highlight default link redmineAcronym String
highlight default link redmineAcronymTag Special

highlight default link redmineHtml Special

highlight default link redmineMacro String

highlight default redmineMakeBold term=bold cterm=bold gui=bold
highlight default redmineBoldUnderline term=bold,underline cterm=bold,underline gui=bold,underline
highlight default redmineBoldItalic term=bold,italic cterm=bold,italic gui=bold,italic
highlight default redmineBoldUnderlineItalic term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
highlight default redmineUnderline term=underline cterm=underline gui=underline
highlight default redmineUnderlineItalic term=italic,underline cterm=italic,underline gui=italic,underline
highlight default redmineMakeItalic term=italic cterm=italic gui=italic
highlight default redmineLink term=underline cterm=underline gui=underline

" =============================================================================

" Make sure that the file is loaded at most once
let b:current_syntax = "redminewiki"
