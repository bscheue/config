highlight Delimiter ctermfg=gray
highlight texMath ctermfg=blue
highlight Statement ctermfg=gray
highlight conceal ctermbg=NONE ctermfg=green

syn match texMathSymbol '\\A' contained conceal cchar=𝔸
syn match texMathSymbol '\\B' contained conceal cchar=𝔹
syn match texMathSymbol '\\C' contained conceal cchar=ℂ
syn match texMathSymbol '\\D' contained conceal cchar=𝔻
syn match texMathSymbol '\\E' contained conceal cchar=𝔼
syn match texMathSymbol '\\F' contained conceal cchar=𝔽
syn match texMathSymbol '\\G' contained conceal cchar=𝔾
syn match texMathSymbol '\\H' contained conceal cchar=ℍ
syn match texMathSymbol '\\I' contained conceal cchar=𝕀
syn match texMathSymbol '\\J' contained conceal cchar=𝕁
syn match texMathSymbol '\\K' contained conceal cchar=𝕂
syn match texMathSymbol '\\L' contained conceal cchar=𝕃
syn match texMathSymbol '\\M' contained conceal cchar=𝕄
syn match texMathSymbol '\\N' contained conceal cchar=ℕ
syn match texMathSymbol '\\O' contained conceal cchar=𝕆
syn match texMathSymbol '\\P' contained conceal cchar=ℙ
syn match texMathSymbol '\\Q' contained conceal cchar=ℚ
syn match texMathSymbol '\\R' contained conceal cchar=ℝ
syn match texMathSymbol '\\S' contained conceal cchar=𝕊
syn match texMathSymbol '\\T' contained conceal cchar=𝕋
syn match texMathSymbol '\\U' contained conceal cchar=𝕌
syn match texMathSymbol '\\V' contained conceal cchar=𝕍
syn match texMathSymbol '\\W' contained conceal cchar=𝕎
syn match texMathSymbol '\\X' contained conceal cchar=𝕏
syn match texMathSymbol '\\Y' contained conceal cchar=𝕐
syn match texMathSymbol '\\Z' contained conceal cchar=ℤ

syn match compose contained '\\o' conceal cchar=∘
syn match texMathSymbol '\\o ' contains=compose,composeSpace

syn cluster texMathSymbol add=compose,composeSpace
