#let config(body) = {
  // フォント設定
  set text(font: "Noto Sans CJK JP")

  // 句読点
  show "。": "．"
  show "、": "，"

  // 見出し1要素の装飾
  show heading.where(level: 1): it => block(
    width: 100%,
    fill: blue,
    inset: (top: 7pt, bottom: 7pt, left: 11pt),
    text(fill: white, it),
  )

  // 見出し2要素の装飾
  show heading.where(level: 2): it => block(
    inset: (left: 10pt),
    stroke: (left: 3pt + blue),
    it,
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
#let down_level(description: none,body) = block(
  inset: (left: 1em),
  stroke: (left: 1pt + gray),
  radius: 0pt,
)[
  #if description != none {
    [*#description*\ ]
  }
  #body
]

// 多ステップ評価関係(矢印にアスタリスクがついたやつ)
#let asterarrow = $attach(arrow, tr: *)$
