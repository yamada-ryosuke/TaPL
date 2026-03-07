#import "../template.typ": *
#import "@preview/curryst:0.6.0": prooftree, rule

#show: config.with()

// -------------------- ここから本文 --------------------
== 演習 3.2.4.
#answer[
  $|S_(i + 1)| = 3 + |S_i| times 3 + |S_i|^3$なので、
  $
    & |S_0| & = & 0 \
    & |S_1| & = & 3 + 0 times 3 + 0^3 = 3 \
    & |S_2| & = & 3 + 3 times 3 + 3^3 = 39 \
    & |S_3| & = & 3 + 39 times 3 + 39^3 = underline(59439) \
  $
]

== 演習 3.2.5
#answer[
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

== 演習 3.2.6
=== 深さに関する帰納法
#answer[
  任意の$s in cal(T)$に対して$forall r in cal(T), ("depth"(r) < "depth"(s) arrow P(r)) arrow P(s)$が成り立つとする。\
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
=== サイズに関する帰納法
#answer[
  任意の$s in cal(T)$に対して$forall r in cal(T), ("size"(r) < "size"(s) arrow P(r)) arrow P(s)$が成り立つとする。\
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
=== 構造的帰納法
#answer[
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

== 演習 3.5.5.
#answer[
  #text(fill: rgb("#ff0000"))[
    (注) 問題文に「上の証明で使われている帰納法の原理」とあるが、定理3.5.4.の教科書の証明は導出に関する帰納法を正しく用いたものではない。そこで、問題としては不成立ではあるが、一応導出に関する帰納法を答案として記載しておく。\
  ]
  任意の導出$cal(D)$について、\
  #pad(left: 1cm)[
    $cal(D)$の任意の直接の部分導出$cal(C)$に対して$P(cal(C))$が成り立つとき、$P(cal(D))$が証明できる
  ]
  ならば、すべての$cal(D)$に対して$P(cal(D))$が成り立つ。
]

== 演習 3.5.10.
#answer[
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

== 演習 3.5.13.
=== (1)
#answer[
  定理3.5.7.と定理3.5.8.と定理3.5.12.が成り立つ。$"E-FUNNY1"$は異なる結論を出すことができるような推論も可能にするので、定理3.5.4.と定理3.5.11.のような一意性に関する性質は成り立たない。
]
=== (2)
#answer[
  定理3.5.7.と定理3.5.8.と定理3.5.11.と定理3.5.12.が成り立つ。$"E-FUNNY2"$は推論の順番を変更することが可能になるだけの規則なので、定理3.5.4.のような過程の一意性に関する性質だけが成り立たない。
]

== 演習 3.5.14.
#answer[
  項の集合を$cal(T)$とする。\
  $t in cal(T)$に関する命題$P(t)$を「任意の$t', t'' in cal(T)$に対して、$t arrow t'$かつ$t arrow t''$ならば$t' = t''$」と定義する。任意の$t in cal(T)$に対して$P(t)$が成り立つことを構造的帰納法により示す。\
  #down_level[
    任意の部分項$t_1$に対して$P(t_1)$が成り立つような$t in cal(T)$を任意に取る。\
    #down_level[
      $t arrow t'$、$t arrow t''$となるような$t', t'' in cal(T)$をそれぞれ任意に取る。
      $t arrow t'$の導出$cal(D)$、$t arrow t''$の導出$D''$をそれぞれ一つずつ取る。\
      評価規則により、$t$は$"if"$項か$"succ"$項か$"pred"$項か$"iszero"$項のいずれかであることが分かる。\
      // tがif項の場合の証明
      #down_level(description: [$t$が$"if"$項のとき])[
        $t$は$"if" t_1 "then" t_2 "else" t_3$と表せる。また、$cal(D)$および$cal(D)'$の最後に使う規則は$"E-IFTRUE"$か$"E-IFFALSE"$か$"E-IF"$のいずれかである。
        // E-IFTRUEのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-IFTRUE"$のとき])[
          $t_1$が$"true"$なので$cal(D)'$の最後に使う規則も$"E-IFTRUE"$である。よって$t' = t_2 = t''$。
        ]
        // E-IFFALSEのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-IFFALSE"$のとき])[
          $t_1$が$"false"$なので$cal(D)'$の最後に使う規則も$"E-IFFALSE"$である。よって$t' = t_3 = t''$。
        ]
        // E-IFのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-IF"$のとき])[
          $t_1$が正規形でないことから$cal(D)'$で最後に使う規則は$"E-IF"$であることが分かる。$cal(D)$の最後は
          $
            prooftree(
              rule(
                name: "E-IF",
                t_1 arrow t'_1,
                "if" t_1 "then" t_2 "else" t_3 arrow "if" t'_1 "then" t_2 "else" t_3
              )
            )
          $
          という形をしており、$cal(D)'$の最後は
          $
            prooftree(
              rule(
                name: "E-IF",
                t_1 arrow t''_1,
                "if" t_1 "then" t_2 "else" t_3 arrow "if" t''_1 "then" t_2 "else" t_3
              )
            )
          $
          という形をしてる。ここで、帰納法の仮定より$P(t_1)$を満たすので、$t'_1 = t''_1$。よって$t' = t''$。
        ]
      ]
      // tがsucc項の場合の証明
      #down_level(description: [$t$が$"succ"$項のとき])[
        $cal(D)$および$cal(D)'$の最後に使う規則は$"E-SUCC"$である。よって$"E-IFTRUE"$のときと同様に帰納法の仮定を用いることにより$t' = t''$が示せる。
      ]
      // tがpred項の場合の証明
      #down_level(description: [$t$が$"pred"$項のとき])[
        $t$は$"pred" t_1$と表せる。また、$cal(D)$および$cal(D)'$の最後に使う規則は$"E-PREDZERO"$か$"E-PREDSUCC"$か$"E-PRED"$のいずれかである。
        // E-PREDZEROのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-PREDZERO"$のとき])[
          $t_1$が正規形であることから$cal(D)'$の最後に使われる規則は$"E-PREDZERO"$か$"E-PREDSUCC"$のいずれかであることが分かり、さらに$t_1 = 0$であることから$"E-PREDZERO"$であることが分かる。よって$"E-IFTRUE"$のときと同様に帰納法の仮定を用いることにより$t' = t''$が示せる。
        ]
        // E-PREDSUCCのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-PREDSUCC"$のとき])[
          $t_1$が正規形であることから$cal(D)'$の最後に使われる規則は$"E-PREDZERO"$か$"E-PREDSUCC"$のいずれかであることが分かり、さらに$t_1 = "succ" "nv"_1$の形であることから$"E-PREDSUCC"$であることが分かる。よって$"E-IFTRUE"$のときと同様に帰納法の仮定を用いることにより$t' = t''$が示せる。
        ]
        // E-PREDのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-PRED"$のとき])[
          $t_1$が正規形でないことから$cal(D)'$で最後に使う規則は$"E-PRED"$であることが分かる。よって$"E-IFTRUE"$のときと同様に帰納法の仮定を用いることにより$t' = t''$が示せる。
        ]
      ]
      // tがiszero項の場合の証明
      #down_level(description: [$t$が$"iszero"$項のとき])[
        $cal(D)$および$cal(D)'$の最後に使う規則は$"E-ISZEROZERO"$か$"E-ISZEROSUCC"$か$"E-ISZERO"$のいずれかである。
        // E-ISZEROZEROのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-ISZEROZERO"$のとき])[
          $"E-PREDZERO"$のときと同様にして$cal(D)$の最後に使う規則が$"E-ISZEROZERO"$であることが分かり、$t' = t''$が示される。
        ]
        // E-ISZEROSUCCのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-ISZEROSUCC"$のとき])[
          $"E-PREDSUCC"$のときと同様にして$cal(D)$の最後に使う規則が$"E-ISZEROSUCC"$であることが分かり、$t' = t''$が示される。
        ]
        // E-ISZEROのときの証明
        #down_level(description: [$cal(D)$の最後に使う規則が$"E-ISZERO"$のとき])[
          $"E-PRED"$のときと同様にして$cal(D)$の最後に使う規則が$"E-ISZERO"$であることが分かり、$t' = t''$が示される。
        ]
      ]
      よって$t' = t''$が成り立つ。
    ]
    よって$P(t)$が成り立つ。
  ]
  よって構造的帰納法により任意の$t in cal(T)$に対して$P(t)$が成り立つ。
]
