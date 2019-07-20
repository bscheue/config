highlight conceal ctermbg=NONE ctermfg=darkgreen

syntax match texMathSymbol '\\A' contained conceal cchar=𝔸
syntax match texMathSymbol '\\B' contained conceal cchar=𝔹
syntax match texMathSymbol '\\C' contained conceal cchar=ℂ
syntax match texMathSymbol '\\D' contained conceal cchar=𝔻
syntax match texMathSymbol '\\E' contained conceal cchar=𝔼
syntax match texMathSymbol '\\F' contained conceal cchar=𝔽
syntax match texMathSymbol '\\G' contained conceal cchar=𝔾
syntax match texMathSymbol '\\H' contained conceal cchar=ℍ
syntax match texMathSymbol '\\I' contained conceal cchar=𝕀
syntax match texMathSymbol '\\J' contained conceal cchar=𝕁
syntax match texMathSymbol '\\K' contained conceal cchar=𝕂
syntax match texMathSymbol '\\L' contained conceal cchar=𝕃
syntax match texMathSymbol '\\M' contained conceal cchar=𝕄
syntax match texMathSymbol '\\N' contained conceal cchar=ℕ
syntax match texMathSymbol '\\O' contained conceal cchar=𝕆
syntax match texMathSymbol '\\P' contained conceal cchar=ℙ
syntax match texMathSymbol '\\Q' contained conceal cchar=ℚ
syntax match texMathSymbol '\\R' contained conceal cchar=ℝ
syntax match texMathSymbol '\\S' contained conceal cchar=𝕊
syntax match texMathSymbol '\\T' contained conceal cchar=𝕋
syntax match texMathSymbol '\\U' contained conceal cchar=𝕌
syntax match texMathSymbol '\\V' contained conceal cchar=𝕍
syntax match texMathSymbol '\\W' contained conceal cchar=𝕎
syntax match texMathSymbol '\\X' contained conceal cchar=𝕏
syntax match texMathSymbol '\\Y' contained conceal cchar=𝕐
syntax match texMathSymbol '\\Z' contained conceal cchar=ℤ


syntax match texMathSymbol '\^a' contained conceal cchar=ᵃ
syntax match texMathSymbol '\^b' contained conceal cchar=ᵇ
syntax match texMathSymbol '\^c' contained conceal cchar=ᶜ
syntax match texMathSymbol '\^d' contained conceal cchar=ᵈ
syntax match texMathSymbol '\^e' contained conceal cchar=ᵉ
syntax match texMathSymbol '\^f' contained conceal cchar=ᶠ
syntax match texMathSymbol '\^g' contained conceal cchar=ᵍ
syntax match texMathSymbol '\^h' contained conceal cchar=ʰ
syntax match texMathSymbol '\^i' contained conceal cchar=ⁱ
syntax match texMathSymbol '\^j' contained conceal cchar=ʲ
syntax match texMathSymbol '\^k' contained conceal cchar=ᵏ
syntax match texMathSymbol '\^l' contained conceal cchar=ˡ
syntax match texMathSymbol '\^m' contained conceal cchar=ᵐ
syntax match texMathSymbol '\^n' contained conceal cchar=ⁿ
syntax match texMathSymbol '\^o' contained conceal cchar=ᵒ
syntax match texMathSymbol '\^p' contained conceal cchar=ᵖ
syntax match texMathSymbol '\^r' contained conceal cchar=ʳ
syntax match texMathSymbol '\^s' contained conceal cchar=ˢ
syntax match texMathSymbol '\^t' contained conceal cchar=ᵗ
syntax match texMathSymbol '\^u' contained conceal cchar=ᵘ
syntax match texMathSymbol '\^v' contained conceal cchar=ᵛ
syntax match texMathSymbol '\^w' contained conceal cchar=ʷ
syntax match texMathSymbol '\^x' contained conceal cchar=ˣ
syntax match texMathSymbol '\^y' contained conceal cchar=ʸ
syntax match texMathSymbol '\^z' contained conceal cchar=ᶻ


syn match texMathSymbol '_a' contained conceal cchar=ₐ
syn match texMathSymbol '_e' contained conceal cchar=ₑ
syn match texMathSymbol '_h' contained conceal cchar=ₕ
syn match texMathSymbol '_i' contained conceal cchar=ᵢ
syn match texMathSymbol '_j' contained conceal cchar=ⱼ
syn match texMathSymbol '_k' contained conceal cchar=ₖ
syn match texMathSymbol '_l' contained conceal cchar=ₗ
syn match texMathSymbol '_m' contained conceal cchar=ₘ
syn match texMathSymbol '_n' contained conceal cchar=ₙ
syn match texMathSymbol '_o' contained conceal cchar=ₒ
syn match texMathSymbol '_p' contained conceal cchar=ₚ
syn match texMathSymbol '_r' contained conceal cchar=ᵣ
syn match texMathSymbol '_s' contained conceal cchar=ₛ
syn match texMathSymbol '_t' contained conceal cchar=ₜ
syn match texMathSymbol '_u' contained conceal cchar=ᵤ
syn match texMathSymbol '_v' contained conceal cchar=ᵥ
syn match texMathSymbol '_x' contained conceal cchar=ₓ

syntax match compose contained '\\o' conceal cchar=∘
syntax match texMathSymbol '\\o ' contains=compose,composeSpace

syntax cluster texMathSymbol add=compose,composeSpace
