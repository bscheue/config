highlight texMath ctermfg=blue
highlight Statement ctermfg=darkblue
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

syntax match compose contained '\\o' conceal cchar=∘
syntax match texMathSymbol '\\o ' contains=compose,composeSpace

syntax cluster texMathSymbol add=compose,composeSpace
