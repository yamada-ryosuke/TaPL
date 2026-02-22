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
#question("演習2.2.6.")[
    #down_level[
        $s in S$を任意に取る。\
        $(s, s) in {(s, s) | s in S} subset R'$より$s R' s$。
    ]
    よって$R'$は反射的関係である。\
    #down_level[
        $R subset R''$を満たす$S$上の二項関係$R''$を任意に取る。\
        #down_level[
            $(s, t) in R'$を任意に取る。\
            #down_level[
                $(s, t) in R$のとき、$R subset R''$より$(s, t) in R''$。
            ]
            #down_level[
                $(s, t) in {(s, s) | s in S}$のとき、$s = t$なので、$R''$の反射性より$(s, t) = (s, t) in R''$。
            ]
            ゆえに$(s, t) in R''$。
        ]
        よって$R' subset R''$。
    ]
    よって$R'$は反射的閉包である。
]

#question("演習2.2.7.")[
    #down_level[
        $(s, t), (t, u) in R^+$を任意に取る。\
        $i_1, i_2 in bb(N)$が存在して、$(s, t) in R_i_1$、$(t, u) in R_i_2$が成り立つ。\
        $i = max(i_1, i_2)$とすると、$(s, t), (t, u) in R_i$。\
        ゆえに$(s, u) in R_(i+1) subset R^+$。
    ]
    よって$R^+$は推移的である。\
    #down_level[
        $R subset R'$となるような推移的関係$R'$を任意に取る。\
        任意の$i in bb(N)$に対して$R_i subset R'$が成り立つことを示す。
        #down_level[
            #down_level[
                明らかに$R_0 = R subset R'$が成り立つ。
            ]
            #down_level[
                $R_i subset R'$を満たす$i in bb(N)$を任意に取る。\
                #down_level[
                    $(s, u) in R_(i + 1)$を任意に取る。\
                    #down_level[
                        $(s, u) in R_i$のとき、仮定より$(s, u) in R'$。
                    ]
                    #down_level[
                        $(s, u) in.not R_i$のとき、$(s, t), (t, u) in R_i$となる$t$が存在する。\
                        仮定より$(s, t), (t, u) in R'$なので、$R'$の推移性より$(s, u) in R'$。
                    ]
                    
                ]
                よって$R_(i + 1) subset R'$が成り立つ。
            ]
            よって任意の$i in bb(N)$に対して$R_i subset R'$が成り立つことが帰納的に示される。
        ]

        よって$display(R^+ = union.big_i R_i subset R')$が成り立つ。
    ]
    よって$R^+$は$R$の推移的閉包である。
]

#question("演習2.2.8.")[
    $R'_i (i in bb(N))$を以下のように帰納的に定義する。
    $
        &R'_0 &=& R union {(s, s) | s in S}\
        &R'_(i + 1) &=& R'_i union {(s, t) | "ある" t in S "に対して" (s, t) in R'_i"かつ" (t, u) in R'_i}
    $
    このとき、演習2.2.7.と同様に$display(R^* = union.big_i R'_i)$が示される。\
    任意の$i in bb(N)$について、$R'_i$が$P$を保存することを示す。
    #down_level[
        #down_level[
            定義より明らかに$R'_0 = R$は$P$を保存する。
        ]
        #down_level[
            $R'_i$が$P$を保存するような$i in bb(N)$を任意に取る。\
            #down_level[
                $P(s)$が真となるような$(s, u) in R'_(i + 1)$を任意に取る。\
                #down_level[
                    $(s, u) in R'_i$のとき、仮定より$P(u)$は真。
                ]
                #down_level[
                    $(s, u) in.not R'_i$のとき、$(s, t), (t, u) in R'_i$となるような$t in S$が存在する。\
                    このとき、$P(s)$が真なので、$P(t)$が真となり、$P(u)$は真となる。
                ]
                よって$P(u)$は真である。
            ]
            よって$R'_(i + 1)$も$P$を保存する。
        ]
        よって、任意の$i in bb(N)$について$R'_i$が$P$を保存することが帰納的に示される。
    ]
    #down_level[
        $P(s)$が真となるような$(s, t) in R^*$を任意に取る。\
        このとき、$i in bb(N)$が存在して$(s, t) in R'_i$が成り立つ。\
        すると、$R'_i$が$P$を保存することから$P(t)$は真となる。
    ]
    よって$R^*$は$P$を保存する。
]