highlight conceal ctermbg=NONE ctermfg=darkgreen

syntax match texMathSymbol '\\A\>' contained conceal cchar=𝔸
syntax match texMathSymbol '\\B\>' contained conceal cchar=𝔹
syntax match texMathSymbol '\\C\>' contained conceal cchar=ℂ
syntax match texMathSymbol '\\D\>' contained conceal cchar=𝔻
syntax match texMathSymbol '\\E\>' contained conceal cchar=𝔼
syntax match texMathSymbol '\\F\>' contained conceal cchar=𝔽
syntax match texMathSymbol '\\G\>' contained conceal cchar=𝔾
syntax match texMathSymbol '\\H\>' contained conceal cchar=ℍ
syntax match texMathSymbol '\\I\>' contained conceal cchar=𝕀
syntax match texMathSymbol '\\J\>' contained conceal cchar=𝕁
syntax match texMathSymbol '\\K\>' contained conceal cchar=𝕂
syntax match texMathSymbol '\\L\>' contained conceal cchar=𝕃
syntax match texMathSymbol '\\M\>' contained conceal cchar=𝕄
syntax match texMathSymbol '\\N\>' contained conceal cchar=ℕ
syntax match texMathSymbol '\\O\>' contained conceal cchar=𝕆
syntax match texMathSymbol '\\P\>' contained conceal cchar=ℙ
syntax match texMathSymbol '\\Q\>' contained conceal cchar=ℚ
syntax match texMathSymbol '\\R\>' contained conceal cchar=ℝ
syntax match texMathSymbol '\\S\>' contained conceal cchar=𝕊
syntax match texMathSymbol '\\T\>' contained conceal cchar=𝕋
syntax match texMathSymbol '\\U\>' contained conceal cchar=𝕌
syntax match texMathSymbol '\\V\>' contained conceal cchar=𝕍
syntax match texMathSymbol '\\W\>' contained conceal cchar=𝕎
syntax match texMathSymbol '\\X\>' contained conceal cchar=𝕏
syntax match texMathSymbol '\\Y\>' contained conceal cchar=𝕐
syntax match texMathSymbol '\\Z\>' contained conceal cchar=ℤ


syntax match texMathSymbol '\^a\>' contained conceal cchar=ᵃ
syntax match texMathSymbol '\^b\>' contained conceal cchar=ᵇ
syntax match texMathSymbol '\^c\>' contained conceal cchar=ᶜ
syntax match texMathSymbol '\^d\>' contained conceal cchar=ᵈ
syntax match texMathSymbol '\^e\>' contained conceal cchar=ᵉ
syntax match texMathSymbol '\^f\>' contained conceal cchar=ᶠ
syntax match texMathSymbol '\^g\>' contained conceal cchar=ᵍ
syntax match texMathSymbol '\^h\>' contained conceal cchar=ʰ
syntax match texMathSymbol '\^i\>' contained conceal cchar=ⁱ
syntax match texMathSymbol '\^j\>' contained conceal cchar=ʲ
syntax match texMathSymbol '\^k\>' contained conceal cchar=ᵏ
syntax match texMathSymbol '\^l\>' contained conceal cchar=ˡ
syntax match texMathSymbol '\^m\>' contained conceal cchar=ᵐ
syntax match texMathSymbol '\^n\>' contained conceal cchar=ⁿ
syntax match texMathSymbol '\^o\>' contained conceal cchar=ᵒ
syntax match texMathSymbol '\^p\>' contained conceal cchar=ᵖ
syntax match texMathSymbol '\^r\>' contained conceal cchar=ʳ
syntax match texMathSymbol '\^s\>' contained conceal cchar=ˢ
syntax match texMathSymbol '\^t\>' contained conceal cchar=ᵗ
syntax match texMathSymbol '\^u\>' contained conceal cchar=ᵘ
syntax match texMathSymbol '\^v\>' contained conceal cchar=ᵛ
syntax match texMathSymbol '\^w\>' contained conceal cchar=ʷ
syntax match texMathSymbol '\^x\>' contained conceal cchar=ˣ
syntax match texMathSymbol '\^y\>' contained conceal cchar=ʸ
syntax match texMathSymbol '\^z\>' contained conceal cchar=ᶻ


syntax match texMathSymbol '_a\>' contained conceal cchar=ₐ
syntax match texMathSymbol '_e\>' contained conceal cchar=ₑ
" syntax match texMathSymbol '_h\>' contained conceal cchar=ₕ
syntax match texMathSymbol '_i\>' contained conceal cchar=ᵢ
syntax match texMathSymbol '_j\>' contained conceal cchar=ⱼ
" syntax match texMathSymbol '_k\>' contained conceal cchar=ₖ
" syntax match texMathSymbol '_l\>' contained conceal cchar=ₗ
" syntax match texMathSymbol '_m\>' contained conceal cchar=ₘ
" syntax match texMathSymbol '_n\>' contained conceal cchar=ₙ
syntax match texMathSymbol '_o\>' contained conceal cchar=ₒ
" syntax match texMathSymbol '_p\>' contained conceal cchar=ₚ
syntax match texMathSymbol '_r\>' contained conceal cchar=ᵣ
" syntax match texMathSymbol '_s\>' contained conceal cchar=ₛ
" syntax match texMathSymbol '_t\>' contained conceal cchar=ₜ
syntax match texMathSymbol '_u\>' contained conceal cchar=ᵤ
syntax match texMathSymbol '_v\>' contained conceal cchar=ᵥ
syntax match texMathSymbol '_x\>' contained conceal cchar=ₓ

syntax match compose contained '\\o' conceal cchar=∘
syntax match texMathSymbol '\\o ' contains=compose,composeSpace

syntax cluster texMathSymbol add=compose,composeSpace

" below taken from: https://github.com/lervag/vimtex/blob/master/after/syntax/tex.vim
let s:conceal = (has('conceal') && get(g:, 'tex_conceal', 'b') =~# 'b')
    \ ? 'concealends' : ''

  for [s:style, s:group, s:commands] in [
        \ ['texItalStyle', 'texItalGroup', ['emph', 'textit']],
        \ ['texBoldStyle', 'texBoldGroup', ['textbf']],
        \]
    for s:cmd in s:commands
      execute 'syntax region' s:style 'matchgroup=texTypeStyle'
            \ 'start="\\' . s:cmd . '\s*{" end="}"'
            \ 'contains=@Spell,@' . s:group
            \ s:conceal
    endfor
    execute 'syntax cluster texMatchGroup add=' . s:style
  endfor
" end code from vimtex


" below taken from: https://github.com/KeitaNakamura/tex-conceal.vim
syntax match texMathSymbol '\\pathspace' contained conceal cchar=Ω
" syntax match texMathSymbol '\\surfaces' contained conceal cchar=𝓜

" more reasonably sized symbols that were already defined
syntax match texMathSymbol '\\Rightarrow\>' contained conceal cchar=⇒
syntax match texMathSymbol '\\Leftarrow\>' contained conceal cchar=⇐
syntax match texMathSymbol '\\rightarrow\>' contained conceal cchar=→
syntax match texMathSymbol '\\leftarrow\>' contained conceal cchar=←
syntax match texMathSymbol '\\emptyset\>' contained conceal cchar=Ø
syntax match texMathSymbol '\\varphi\>' contained conceal cchar=φ
syntax match texMathSymbol '\\phi\>' contained conceal cchar=Φ
syntax match texMathSymbol '\\langle\>\s*' contained conceal cchar=⟨
syntax match texMathSymbol '\s*\\rangle\>' contained conceal cchar=⟩
syntax match texMathSymbol '\\\\' contained conceal cchar=⏎

" Simple number super/sub-scripts
syntax match texMathSymbol '\^0' contained conceal cchar=⁰
syntax match texMathSymbol '\^1' contained conceal cchar=¹
syntax match texMathSymbol '\^2' contained conceal cchar=²
syntax match texMathSymbol '\^3' contained conceal cchar=³
syntax match texMathSymbol '\^4' contained conceal cchar=⁴
syntax match texMathSymbol '\^5' contained conceal cchar=⁵
syntax match texMathSymbol '\^6' contained conceal cchar=⁶
syntax match texMathSymbol '\^7' contained conceal cchar=⁷
syntax match texMathSymbol '\^8' contained conceal cchar=⁸
syntax match texMathSymbol '\^9' contained conceal cchar=⁹

syntax match texMathSymbol '\^{-1}' contained conceal contains=texSuperscripts
syntax match texMathSymbol '\^\\mathrm{T}' contained conceal contains=texSuperscripts
syntax match texMathSymbol '\^\\mathrm{-T}' contained conceal contains=texSuperscripts
syntax match texSuperscripts '1' contained conceal cchar=¹
syntax match texSuperscripts '-' contained conceal cchar=⁻
syntax match texSuperscripts 'T' contained conceal cchar=ᵀ

syntax match texMathSymbol '_0' contained conceal cchar=₀
syntax match texMathSymbol '_1' contained conceal cchar=₁
syntax match texMathSymbol '_2' contained conceal cchar=₂
syntax match texMathSymbol '_3' contained conceal cchar=₃
syntax match texMathSymbol '_4' contained conceal cchar=₄
syntax match texMathSymbol '_5' contained conceal cchar=₅
syntax match texMathSymbol '_6' contained conceal cchar=₆
syntax match texMathSymbol '_7' contained conceal cchar=₇
syntax match texMathSymbol '_8' contained conceal cchar=₈
syntax match texMathSymbol '_9' contained conceal cchar=₉
syntax match texMathSymbol '_i' contained conceal cchar=ᵢ
syntax match texMathSymbol '^i' contained conceal cchar=ⁱ
syntax match texMathSymbol '_o' contained conceal cchar=ₒ
syntax match texMathSymbol '^o' contained conceal cchar=ᵒ

" logical symbols
syntax match texMathSymbol '\\lor\>' contained conceal cchar=∨
syntax match texMathSymbol '\\land\>' contained conceal cchar=∧
syntax match texMathSymbol '\\lnot\>' contained conceal cchar=¬
syntax match texMathSymbol '\\implies\>' contained conceal cchar=⇒
syntax match texMathSymbol '\\geqslant\>' contained conceal cchar=⩾
syntax match texMathSymbol '\\leqslant\>' contained conceal cchar=⩽

" \mathbb characters
syntax match texMathSymbol '\\mathbb{A}' contained conceal cchar=𝔸
syntax match texMathSymbol '\\mathbb{B}' contained conceal cchar=𝔹
syntax match texMathSymbol '\\mathbb{C}' contained conceal cchar=ℂ
syntax match texMathSymbol '\\mathbb{D}' contained conceal cchar=𝔻
syntax match texMathSymbol '\\mathbb{E}' contained conceal cchar=𝔼
syntax match texMathSymbol '\\mathbb{F}' contained conceal cchar=𝔽
syntax match texMathSymbol '\\mathbb{G}' contained conceal cchar=𝔾
syntax match texMathSymbol '\\mathbb{H}' contained conceal cchar=ℍ
syntax match texMathSymbol '\\mathbb{I}' contained conceal cchar=𝕀
syntax match texMathSymbol '\\mathbb{J}' contained conceal cchar=𝕁
syntax match texMathSymbol '\\mathbb{K}' contained conceal cchar=𝕂
syntax match texMathSymbol '\\mathbb{L}' contained conceal cchar=𝕃
syntax match texMathSymbol '\\mathbb{M}' contained conceal cchar=𝕄
syntax match texMathSymbol '\\mathbb{N}' contained conceal cchar=ℕ
syntax match texMathSymbol '\\mathbb{O}' contained conceal cchar=𝕆
syntax match texMathSymbol '\\mathbb{P}' contained conceal cchar=ℙ
syntax match texMathSymbol '\\mathbb{Q}' contained conceal cchar=ℚ
syntax match texMathSymbol '\\mathbb{R}' contained conceal cchar=ℝ
syntax match texMathSymbol '\\mathbb{S}' contained conceal cchar=𝕊
syntax match texMathSymbol '\\mathbb{T}' contained conceal cchar=𝕋
syntax match texMathSymbol '\\mathbb{U}' contained conceal cchar=𝕌
syntax match texMathSymbol '\\mathbb{V}' contained conceal cchar=𝕍
syntax match texMathSymbol '\\mathbb{W}' contained conceal cchar=𝕎
syntax match texMathSymbol '\\mathbb{X}' contained conceal cchar=𝕏
syntax match texMathSymbol '\\mathbb{Y}' contained conceal cchar=𝕐
syntax match texMathSymbol '\\mathbb{Z}' contained conceal cchar=ℤ

syntax match texBoldMathText '\\mA\>' contained conceal cchar=A
syntax match texBoldMathText '\\mB\>' contained conceal cchar=B
syntax match texBoldMathText '\\mC\>' contained conceal cchar=C
syntax match texBoldMathText '\\mD\>' contained conceal cchar=D
syntax match texBoldMathText '\\mE\>' contained conceal cchar=E
syntax match texBoldMathText '\\mF\>' contained conceal cchar=F
syntax match texBoldMathText '\\mG\>' contained conceal cchar=G
syntax match texBoldMathText '\\mH\>' contained conceal cchar=H
syntax match texBoldMathText '\\mI\>' contained conceal cchar=I
syntax match texBoldMathText '\\mJ\>' contained conceal cchar=J
syntax match texBoldMathText '\\mK\>' contained conceal cchar=K
syntax match texBoldMathText '\\mL\>' contained conceal cchar=L
syntax match texBoldMathText '\\mM\>' contained conceal cchar=M
syntax match texBoldMathText '\\mN\>' contained conceal cchar=N
syntax match texBoldMathText '\\mO\>' contained conceal cchar=O
syntax match texBoldMathText '\\mP\>' contained conceal cchar=P
syntax match texBoldMathText '\\mQ\>' contained conceal cchar=Q
syntax match texBoldMathText '\\mR\>' contained conceal cchar=R
syntax match texBoldMathText '\\mS\>' contained conceal cchar=S
syntax match texBoldMathText '\\mT\>' contained conceal cchar=T
syntax match texBoldMathText '\\mU\>' contained conceal cchar=U
syntax match texBoldMathText '\\mV\>' contained conceal cchar=V
syntax match texBoldMathText '\\mW\>' contained conceal cchar=W
syntax match texBoldMathText '\\mX\>' contained conceal cchar=X
syntax match texBoldMathText '\\mY\>' contained conceal cchar=Y
syntax match texBoldMathText '\\mZ\>' contained conceal cchar=Z

syntax match texBoldMathText '\\va\>' contained conceal cchar=a
syntax match texBoldMathText '\\vb\>' contained conceal cchar=b
syntax match texBoldMathText '\\vc\>' contained conceal cchar=c
syntax match texBoldMathText '\\vd\>' contained conceal cchar=d
syntax match texBoldMathText '\\ve\>' contained conceal cchar=e
syntax match texBoldMathText '\\vf\>' contained conceal cchar=f
syntax match texBoldMathText '\\vg\>' contained conceal cchar=g
syntax match texBoldMathText '\\vh\>' contained conceal cchar=h
syntax match texBoldMathText '\\vi\>' contained conceal cchar=i
syntax match texBoldMathText '\\vj\>' contained conceal cchar=j
syntax match texBoldMathText '\\vk\>' contained conceal cchar=k
syntax match texBoldMathText '\\vl\>' contained conceal cchar=l
syntax match texBoldMathText '\\vm\>' contained conceal cchar=m
syntax match texBoldMathText '\\vn\>' contained conceal cchar=n
syntax match texBoldMathText '\\vo\>' contained conceal cchar=o
syntax match texBoldMathText '\\vp\>' contained conceal cchar=p
syntax match texBoldMathText '\\vq\>' contained conceal cchar=q
syntax match texBoldMathText '\\vr\>' contained conceal cchar=r
syntax match texBoldMathText '\\vs\>' contained conceal cchar=s
syntax match texBoldMathText '\\vt\>' contained conceal cchar=t
syntax match texBoldMathText '\\vu\>' contained conceal cchar=u
syntax match texBoldMathText '\\vv\>' contained conceal cchar=v
syntax match texBoldMathText '\\vw\>' contained conceal cchar=w
syntax match texBoldMathText '\\vx\>' contained conceal cchar=x
syntax match texBoldMathText '\\vy\>' contained conceal cchar=y
syntax match texBoldMathText '\\vz\>' contained conceal cchar=z
" syntax match texBoldMathText '\\bar\>' contained conceal cchar=‾

" \mathcal characters
syntax match texMathSymbol '\\mathscr{A}' contained conceal cchar=𝓐
syntax match texMathSymbol '\\mathscr{B}' contained conceal cchar=𝓑
syntax match texMathSymbol '\\mathscr{C}' contained conceal cchar=𝓒
syntax match texMathSymbol '\\mathscr{D}' contained conceal cchar=𝓓
syntax match texMathSymbol '\\mathscr{E}' contained conceal cchar=𝓔
syntax match texMathSymbol '\\mathscr{F}' contained conceal cchar=𝓕
syntax match texMathSymbol '\\mathscr{G}' contained conceal cchar=𝓖
syntax match texMathSymbol '\\mathscr{H}' contained conceal cchar=𝓗
syntax match texMathSymbol '\\mathscr{I}' contained conceal cchar=𝓘
syntax match texMathSymbol '\\mathscr{J}' contained conceal cchar=𝓙
syntax match texMathSymbol '\\mathscr{K}' contained conceal cchar=𝓚
syntax match texMathSymbol '\\mathscr{L}' contained conceal cchar=𝓛
syntax match texMathSymbol '\\mathscr{M}' contained conceal cchar=𝓜
syntax match texMathSymbol '\\mathscr{N}' contained conceal cchar=𝓝
syntax match texMathSymbol '\\mathscr{O}' contained conceal cchar=𝓞
syntax match texMathSymbol '\\mathscr{P}' contained conceal cchar=𝓟
syntax match texMathSymbol '\\mathscr{Q}' contained conceal cchar=𝓠
syntax match texMathSymbol '\\mathscr{R}' contained conceal cchar=𝓡
syntax match texMathSymbol '\\mathscr{S}' contained conceal cchar=𝓢
syntax match texMathSymbol '\\mathscr{T}' contained conceal cchar=𝓣
syntax match texMathSymbol '\\mathscr{U}' contained conceal cchar=𝓤
syntax match texMathSymbol '\\mathscr{V}' contained conceal cchar=𝓥
syntax match texMathSymbol '\\mathscr{W}' contained conceal cchar=𝓦
syntax match texMathSymbol '\\mathscr{X}' contained conceal cchar=𝓧
syntax match texMathSymbol '\\mathscr{Y}' contained conceal cchar=𝓨
syntax match texMathSymbol '\\mathscr{Z}' contained conceal cchar=𝓩

syntax match texStatement '``' contained conceal cchar=“
" syntax match texStatement '\'\'' contained conceal cchar=”
syntax match texStatement '\\item\>' contained conceal cchar=•
syntax match texMathSymbol '\\dd' contained conceal cchar=d
syntax match texDelimiter '\\{' contained conceal cchar={
syntax match texDelimiter '\\}' contained conceal cchar=}
syntax match texMathSymbol '\\setminus\>' contained conceal cchar=\
syntax match texMathSymbol '\\coloneqq\>' contained conceal cchar=≔
syntax match texMathSymbol '\\,' contained conceal cchar= " space
syntax match texMathSymbol '\\ ' contained conceal cchar= " space
syntax match texMathSymbol '\\quad' contained conceal cchar= " space
syntax match texMathSymbol '\\sqrt' contained conceal cchar=√
syntax match texMathSymbol '\\where\>' contained conceal cchar=|
syntax match texMathSymbol '\\\!' contained conceal
"syntax match texStatement '\\\[' contained conceal cchar=⟦
"syntax match texStatement '\\\]' contained conceal cchar=⟧

" hide \text delimiter etc inside math mode
if !exists("g:tex_nospell") || !g:tex_nospell
  syntax region texMathText matchgroup=texStatement start='\\\(\(inter\)\=mathrm\)\s*{'     end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
  syntax region texMathText matchgroup=texStatement start='\\\(\(inter\)\=text\|mbox\)\s*{' end='}' concealends keepend contains=@texFoldGroup,@Spell containedin=texMathMatcher
else
  syntax region texMathText matchgroup=texStatement start='\\\(\(inter\)\=text\|mbox\|mathrm\)\s*{' end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
endif

syntax region texBoldMathText matchgroup=texStatement start='\\\(mathbf\|bm\|symbf\){' end='}' concealends contains=@texMathZoneGroup containedin=texMathMatcher
syntax cluster texMathZoneGroup add=texBoldMathText

syntax region texBoldItalStyle     matchgroup=texTypeStyle start="\\emph\s*{" end="}" concealends contains=@texItalGroup
syntax region texItalStyle  matchgroup=texTypeStyle start="\\emph\s*{" end="}" concealends contains=@texItalGroup

set ambiwidth=single
hi texBoldMathText cterm=bold gui=bold

call TexNewMathZone("Al", "align", 1)
call TexNewMathZone("Pf", "prooftree", 1)

syntax clear texSuperscript
syntax clear texSubscript

syntax spell toplevel
