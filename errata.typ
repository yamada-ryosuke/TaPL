// フォントを変える
#set text(font: "Noto Sans CJK JP")

// 句読点
#show "。": "．"
#show "、": "，"

// 演習問題の解答の環境
#let question(title, body) = [
    == #title
    #block(
        fill: rgb("#e0ffff"),
        inset: 8pt,
        outset: 4pt,
        radius: 4pt,
        stroke: 1pt,
    )[
        #body
    ]
]

// 左に線を引いてレベルを一個下げる
#let down_level(body) = block(
  inset: (left: 1em),
  stroke: (left: 1pt + gray),
  radius: 0pt,
)[
  #body
]

// -------------------- ここから本文 --------------------
