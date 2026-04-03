#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

// 章の数字をラベル型に変換する関数
#let id(n) = label(str(n))

// TaPLの話の軸とその色
#let colors = (
  "implement": green,   // ML実装の章
  "fundamental": red,   // 基礎理論の章
  "procedural": orange, // 状態を持つプログラム・手続き型プログラミングの章
  "meta": blue          // メタ理論の章
)

// 章
#let chapter(number, (x, y), color: black) = node(
    (x, y),
    text(fill: color)[$number$],
    name: id(number),
    stroke: 1pt + color.darken(20%),
    shape: rect,

  )
// 依存関係の矢印
#let depending(from, to) = edge(vertices: (id(from), id(to)), marks: "->")
#let weak_depending(from, to) = edge(vertices: (id(from), id(to)), marks: "-->")

#diagram(
  // 各章の位置
  chapter(1, (2, 0)),
  chapter(2, (3, 0), color: colors.at("fundamental")),
  chapter(3, (3, 1), color: colors.at("fundamental")),
  chapter(4, (0, 1), color: colors.at("implement")),
  chapter(5, (3, 2), color: colors.at("fundamental")),
  chapter(6, (1, 2)),
  chapter(7, (0, 2), color: colors.at("implement")),
  chapter(8, (4, 1), color: colors.at("fundamental")),
  chapter(9, (4, 2), color: colors.at("fundamental")),
  chapter(10, (0, 3), color: colors.at("implement")),
  chapter(11, (4, 3), color: colors.at("fundamental")),
  chapter(12, (3.5, 2.5)),
  chapter(13, (1, 3.5), color: colors.at("procedural")),
  chapter(14, (3.5, 3.5)),
  chapter(15, (4, 4), color: colors.at("fundamental")),
  chapter(16, (3, 4), color: colors.at("meta")),
  chapter(17, (0.5, 4.5), color: colors.at("implement")),
  chapter(18, (1, 5), color: colors.at("procedural")),
  chapter(19, (2, 5)),
  chapter(20, (5, 3), color: colors.at("fundamental")),
  chapter(21, (5, 4), color: colors.at("fundamental")),
  chapter(22, (4.5, 5)),
  chapter(23, (5, 5.5), color: colors.at("fundamental")),
  chapter(24, (2, 6)),
  chapter(25, (0, 6), color: colors.at("implement")),
  chapter(26, (2, 7)),
  chapter(27, (1, 7), color: colors.at("procedural")),
  chapter(28, (3, 7), color: colors.at("meta")),
  chapter(29, (5, 8), color: colors.at("fundamental")),
  chapter(30, (3, 8)),
  chapter(31, (2, 8)),
  chapter(32, (1, 8), color: colors.at("procedural")),
  // 各章の依存関係
  depending(3, 2),
  depending(4, 3),
  depending(5, 3),
  depending(6, 5),
  depending(7, 4),
  depending(7, 6),
  depending(8, 3),
  depending(9, 5),
  depending(9, 8),
  depending(10, 7),
  depending(10, 9),
  depending(11, 9),
  depending(12, 9),
  depending(13, 11),
  depending(14, 11),
  depending(15, 11),
  depending(16, 15),
  depending(17, 10),
  depending(17, 16),
  depending(18, 13),
  depending(18, 15),
  depending(19, 15),
  depending(20, 9),
  weak_depending(20, 15),
  depending(21, 15),
  depending(21, 20),
  depending(22, 11),
  depending(23, 9),
  depending(24, 23),
  depending(25, 10),
  depending(25, 24),
  depending(26, 15),
  depending(26, 23),
  weak_depending(26, 24),
  depending(27, 18),
  depending(27, 26),
  depending(28, 16),
  depending(28, 26),
  depending(29, 23),
  depending(30, 29),
  weak_depending(30, 28),
  depending(31, 30),
  depending(31, 26),
  depending(32, 27),
  depending(32, 31),
)

#set text(font: "Noto Sans CJK JP")
== 各章の色による分類
#text(fill: red)[赤]: 基礎理論\
#text(fill: green)[緑]: ML実装\
#text(fill: orange)[オレンジ]: 状態を持つプログラム・手続き型プログラミング\
#text(fill: blue)[青]: メタ理論\
