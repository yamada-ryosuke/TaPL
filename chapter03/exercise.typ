#import "@preview/curryst:0.6.0": rule, prooftree

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

#let asterarrow = $attach(arrow, tr: *)$

// -------------------- ここから本文 --------------------
#question("演習3.2.4.")[
    $|S_(i + 1)| = 3 + |S_i| times 3 + |S_i|^3$なので、
    $
      &|S_0| &=& 0\
      &|S_1| &=& 3 + 0 times 3 + 0^3 = 3\
      &|S_2| &=& 3 + 3 times 3 + 3^3 = 39\
      &|S_3| &=& 3 + 39 times 3 + 39^3 = underline(59439)\
    $
]

#question("演習3.2.5")[
    帰納法により示す。
    #down_level[
        $S_0 subset S_1$は明らか。
    ]
    #down_level[
        $S_i subset S_(i+1)$を満たす$i in bb(N)$を任意に取る。\
        #down_level[
            $t in S_(i+1)$を任意に取る。\
            #down_level[
                $t in {"true", "false", 0}$のとき、明らかに$t in S_(i+2)$。
            ]
            #down_level[
                $t = "succ" t_1(t_1 in S_i)$のとき、帰納法の仮定より$t_1 in S_(i+1)$なので、$t = "succ" t_1 in S_(i+2)$。
            ]
            #down_level[
                $t = "pred" t_1(t_1 in S_i)$のとき、帰納法の仮定より$t_1 in S_(i+1)$なので、$t = "pred" t_1 in S_(i+2)$。
            ]
            #down_level[
                $t = "iszero" t_1(t_1 in S_i)$のとき、帰納法の仮定より$t_1 in S_(i+1)$なので、$t = "iszero" t_1 in S_(i+2)$。
            ]
            #down_level[
                $t = "if" t_1 "then" t_2 "else" t_3(t_1, t_2, t_3 in S_i)$のとき、帰納法の仮定より$t_1, t_2, t_3 in S_(i+1)$なので、$t = "if" t_1 "then" t_2 "else" t_3 in S_(i+2)$。
            ]
            よって$t in S_(i+2)$。
        ]
        よって$S_(i+1) subset S_(i+2)$。
    ]
    よって、任意の$i in bb(N)$に対して$S_i subset S_(i+1)$となる。
]

#question("演習3.2.6")[
    深さに関する帰納法:
    #down_level[
        任意の$s in cal(T)$に対して$forall r in cal(T), ("depth"(r) < "depth"(s) arrow  P(r)) arrow P(s)$が成り立つとする。\
        $i in bb(N)$に関する述語$Q(i)$を$forall s in cal(T), ("depth"(s) = i arrow P(s))$と定義する。任意の$i in bb(N)$に関して$Q(i)$が成り立つことを示す。
        #down_level[
            $forall j in bb(N), (j < i arrow Q(j))$が成り立つような$i in bb(N)$を任意に取る。\
            #down_level[
                $"depth"(s) = i$を満たす$s in cal(T)$を任意に取る。\
                #down_level[
                    $"depth"(r) < i$となるような$r in cal(T)$を任意に取る。\
                    このとき、仮定より$Q("depth"(s))$が成り立つので、$P(r)$が成り立つ。
                ]
                よって仮定より$P(s)$が成り立つ。
            ]
            よって$Q(i)$が成り立つ。
        ]
        よって完全帰納法により、任意の$i in bb(N)$に対して$Q(i)$が成り立つ。\
        ゆえに、任意の$s in cal(T)$に対して、$Q("depth"(s))$が成り立つため$P(s)$が成り立つ。
    ]
    サイズに関する帰納法:
    #down_level[
        任意の$s in cal(T)$に対して$forall r in cal(T), ("size"(r) < "size"(s) arrow  P(r)) arrow P(s)$が成り立つとする。\
        $i in bb(N)$に関する述語$Q(i)$を$forall s in cal(T), ("size"(s) = i arrow P(s))$と定義する。任意の$i in bb(N)$に関して$Q(i)$が成り立つことを示す。
        #down_level[
            $forall j in bb(N), (j < i arrow Q(j))$が成り立つような$i in bb(N)$を任意に取る。\
            #down_level[
                $"size"(s) = i$を満たす$s in cal(T)$を任意に取る。\
                #down_level[
                    $"size"(r) < i$となるような$r in cal(T)$を任意に取る。\
                    このとき、仮定より$Q("size"(s))$が成り立つので、$P(r)$が成り立つ。
                ]
                よって仮定より$P(s)$が成り立つ。
            ]
            よって$Q(i)$が成り立つ。
        ]
        よって完全帰納法により、任意の$i in bb(N)$に対して$Q(i)$が成り立つ。\
        ゆえに、任意の$s in cal(T)$に対して、$Q("size"(s))$が成り立つため$P(s)$が成り立つ。
    ]
    構造的帰納法:
    #down_level[
        任意の$s in cal(T)$に対して、「$s$の任意の直接の部分項$r in cal(T)$に対して$P(r)$が成り立つとき、$P(s)$が成り立つ」が証明できるとする。\
        任意の$s in cal(T)$に対して$P(s)$が成り立つことを示す。
        #down_level[
            $forall r in cal(T), ("depth"(r) < "depth"(s) arrow P(r))$が成り立つような$s in cal(T)$を任意に取る。
            #down_level[
                $s$の直接の部分項$r in cal(T)$を任意に取る。\
                このとき、$"depth"(r) < "depth"(s)$なので、仮定より$P(r)$が成り立つ。
            ]
            よって仮定より$P(s)$が成り立つ。
        ]
        よって深さに関する帰納法により、任意の$s in cal(T)$に対して$P(s)$が示される。
    ]
]

#question("演習3.5.5.")[
    #text(fill: rgb("#ff0000"))[
        (注) 問題文に「上の証明で使われている帰納法の原理」とあるが、定理3.5.4.の教科書の証明は導出に関する帰納法を正しく用いたものではない。そこで、問題としては不成立ではあるが、一応導出に関する帰納法を答案として記載しておく。\
    ]
    任意の導出$cal(D)$について、\
    #pad(left: 1cm)[
        $cal(D)$の任意の直接の部分導出$cal(C)$に対して$P(cal(C))$が成り立つとき、$P(cal(D))$が証明できる
    ]
    ならば、すべての$cal(D)$に対して$P(cal(D))$が成り立つ。
]

#question("演習3.5.10.")[
    $
        prooftree(
            rule(
                name: (1),
                t arrow t,
                t asterarrow t'
            )
        )
    $
    $
        prooftree(
            rule(
                name: (2),
                t asterarrow t
            )
        )
    $
    $
        prooftree(
            rule(
                name: (3),
                t attach(arrow, tr: *) t',
                t' asterarrow t'',
                t asterarrow t''
            )
        )
    $
]

#question("演習3.5.13.")[
    
]