#let config(body) = {
  // フォント設定
  set text(font: "Noto Sans CJK JP")

  // 句読点
  show "。": "．"
  show "、": "，"

  // 見出し2要素の装飾
  show heading.where(level: 2): it => block(
    inset: (left: 0.8em),
    stroke: (left: 3pt + blue),
    it
  )

  // 本文
  body
}

// 演習問題の解答の環境
#let answer(body) = [
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

// 多ステップ評価関係(矢印にアスタリスクがついたやつ)
#let asterarrow = $attach(arrow, tr: *)$
