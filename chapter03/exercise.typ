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
        t #asterisk_arrow t'
      )
    )
  $
  $
    prooftree(
      rule(
        name: (2),
        t #asterisk_arrow t
      )
    )
  $
  $
    prooftree(
      rule(
        name: (3),
        t attach(arrow, tr: *) t',
        t' #asterisk_arrow t'',
        t #asterisk_arrow t''
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
  $t in cal(T)$に関する述語$P(t)$を「任意の$t', t'' in cal(T)$に対して、$t arrow t'$かつ$t arrow t''$ならば$t' = t''$」と定義する。任意の$t in cal(T)$に対して$P(t)$が成り立つことを構造的帰納法により示す。\
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

== 演習 3.5.16.
#let oarrow = $arrow^o$
#let asterisk_oarrow = $attach(oarrow, tr: *)$
#let double_oarrow = $arrow.double^o$
#let warrow = $arrow^w$
#let asterisk_warrow = $attach(warrow, tr: *)$
#let double_warrow = $arrow.double^w$

=== (1)
#text(fill: red)[
  正規形まで評価しきる評価関係$arrow.double$を定義し、その評価が適切であることを示す。演習3.5.17.で導入される$arrow.double.b$とは異なり、最終的に値には評価されない項も、評価できるところまで評価される。例えば$"if" "pred" "succ" 0 "then" 0 "else" "succ" 0 arrow.double "if" 0 "then" 0 "else" "succ" 0$。
]
#answer[
  新しい構文要素の集合を$cal(T)'$とする。\
  また、元の評価関係における1ステップ評価関係を$oarrow$、新しい評価関係における1ステップ評価関係を$warrow$と表記することとする。\
  評価関係$#double_oarrow$を以下の(i), (ii)を満たす最小の二項関係と定義する。
  #enum(
    numbering: "(i)",
    [$t$が評価関係$oarrow$に関する正規形ならば$t #double_oarrow t$。],
    [$t oarrow t'$かつ$t' #double_oarrow t''$ならば$t #double_oarrow t''$。],
  )
  また、同様に$#double_warrow$も定義する。\
  このとき、$#double_warrow$は以下の1.から5.を満たすことが証明できる。
  #enum(
    [任意の$t, t' in cal(T)$に対して、$t #double_warrow t'$ならば$t'$は値である。],
    [任意の$t, t' in cal(T)$に対して、$t #double_warrow t'$であることと評価の有限列$t warrow t_1 warrow ... warrow t_n warrow t'$が存在することは同値である。],
    [任意の$t in cal(T)$に対して、その$t #double_warrow t'$となる$t' in cal(T)$が存在する。],
    [任意の$t, t', t'' in cal(T)$に対して、その$t #double_warrow t'$かつ$t #double_warrow t''$ならば$t' = t''$。],
    [$v$が$oarrow$に関して値であるような任意の$t, v in cal(T)$について、$t #double_oarrow v$と$t #double_warrow v$は同値。],
    [$t'$が$oarrow$に関して行き詰まり状態であるような任意の$t, t' in cal(T)$について、$t #double_oarrow t'$と$t #double_warrow "wrong"$は同値。],
  )
  以上のうち、「実行時エラーの二つの取り扱いが一致すること」を主張するのは4.および5.である。
]
=== (2)
#answer[
  始めに1ステップ評価に関する補題を示す。
  #down_level(description: [$warrow$に関する補題])[
    #enum(
      numbering: "(a)",
      [任意の$t, t', t'' in cal(T)$について、$t warrow t'$かつ$t warrow t''$ならば$t' = t''$である。],
      [$warrow$に関する正規形は値である。],
    )
    #down_level(description: [proof])[
      #enum(
        numbering: "(a)",
        [
          #down_level[
            // 一意性の証明
            演習 3.5.14.と同様の述語$P$を、以下の点に注意することで演習 3.5.14.と同様の構造的帰納法により示すことができる。
            #down_level(description: [$t$が$"if"$項のとき])[
              $cal(D)$の最後に使う規則が$"E-IF-WRONG"$のとき$t_1$が真理値でない正規形であることから$cal(D)'$の最後に使う規則が$"E-IF-WRONG"$であることが分かる。
            ]
            #down_level(description: [$t$が$"succ"$項のとき])[
              $cal(D)$の最後に使う規則が$"E-IF-WRONG"$のとき$t_1$が正規形であることから$cal(D)'$の最後に使う規則が$"E-IF-WRONG"$であることが分かる。\
              一方で、$cal(D)$の最後に使う規則が$"E-SUCC"$のとき$t_1$が正規形ででないことから$cal(D)'$の最後に使う規則が$"E-SUCC"$であることが分かる。\
            ]
            #down_level(description: [$t$が$"pred"$項のとき])[
              $cal(D)$の最後に使う規則が$"E-PRED-WRONG"$のとき$t_1$が数値でない正規形であることから$cal(D)'$の最後に使う規則が$"E-PRED-WRONG"$であることが分かる。
            ]
            #down_level(description: [$t$が$"iszero"$項のとき])[
              $"iszero"$項のときと同様。
            ]
          ]
        ],
        [
          #down_level[
            // 正規形が値であることの証明
            #down_level[
              任意の部分項について述語が示されているような、値でない項$t in cal(T)$を任意に取る。帰納法の仮定より$t$の任意の部分項は正規形か値のいずれかである。$t$を値、$"if"$項、$"succ"$項、$"pred"$項、$"iszero"$項で場合分けし、さらにその直接の部分項で場合分けすると、矛盾するかいずれかの規則で評価できることが分かる。よって対偶が示される。
            ]
            よって構造的帰納法により示される。
          ]
        ],
      )
    ]
  ]
  #down_level(description: [$oarrow$と$warrow$の対応に関する補題])[
    #enum(
      numbering: "(a)",
      enum.item(
        3,
      )[任意の$t in cal(T)$について、$oarrow$において$cal(T)$の項に評価されること(すなわち正規形でないこと)と$warrow$において$cal(T)$の項に評価されることは同値である。さらに、このような$t$および任意の$t' in cal(T)$について$t oarrow t'$と$t warrow t'$が同値である。],
      [任意の$t in cal(T)$について、$oarrow$において値であることと$warrow$において値であることが同値である。],
      [任意の$t in cal(T)$について、$oarrow$において行き詰まり状態であることと、$t' in cal(T)'\\cal(T)$が存在して$t warrow t'$となることは同値である。],
      // [$t warrow t'$を満たす任意の$t in cal(T)'\\cal(T)$、$t' in cal(T)'$について、$t' in cal(T)'\\cal(T)$が成り立つ。] ←これは成り立たない(if true then true else wrong的なのが反例)
    )
    #down_level(description: [proof])[
      任意の$t in cal(T)$について、$t$は正規形でないか、値であるか、行き詰まり状態であるかのいずれかに一意に分類される。また、任意の$t in cal(T)$について、$t$は値であるか、$cal(T)$の項に評価されるか、$cal(T)' \\ cal(T)$の項に評価されるかの一意に分類される。ゆえに、(c)の前半、(d)、(e)の同値な命題について、$oarrow$に関する命題を仮定して$warrow$に関する命題を証明するだけで十分である。また、$oarrow$および$warrow$の評価先も一意的に存在することから、(c)の後半部分についても、同様に一方の十分性を示すだけで十分である。
      #enum(
        numbering: "(a)",
        enum.item(3)[
          #down_level[$oarrow$の評価規則は$warrow$の評価規則でもあるので明らか。]
        ],
        [#down_level[$oarrow$の値は$warrow$の値でもあるので明らか。]],
        [
          #down_level[
            構造的帰納法により示す。\
            #down_level[
              任意の部分項について述語が成り立つような行き詰まり状態の項$t in cal(T)$を任意に取る。
              #down_level(description: [$t$が値のとき])[
                明らかに矛盾。
              ]
              #down_level(description: [$t$が$"if"$項のとき])[
                $t$は$"if" t_1 "then" t_2 "else" t_3$と表せる。$t_1$は$oarrow$における正規形である。
                #down_level(description: [$t_1$が行き詰まり状態のとき])[
                  帰納法の仮定より$t_1$は$cal(T)' \\ cal(T)$の項に評価されるので、$t$も$"E-IF"$により$cal(T)' \\ cal(T)$の項に評価される。
                ]
                #down_level(description: [$t_1$が真理値のとき])[
                  $t$が行き詰まり状態であることと矛盾する。
                ]
                #down_level(description: [$t_1$が数値のとき])[
                  $"E-IF-WRONG"$により$t$は$"wrong"$に評価される。
                ]
              ]
              #down_level(description: [$t$が$"succ"$項、$"pred"$項、$"iszero"$項のいずれかのとき])[
                $"if"$項のときと同様。ただし、真理値のときと数値のときの証明方法は逆になる。
              ]
              ゆえに$t$は$cal(T)' \\ cal(T)$の項に評価される。
            ]
            よって構造的帰納法により示された。
          ]
        ],
      )
    ]
  ]
  以上を踏まえて1.から6.を示す。
  #down_level(description: [1.の証明])[
    関係$#double_warrow$に関する帰納法により示される。
  ]
  #down_level(description: [2.の証明])[
    $t, t' in cal(T)$を任意に取る。
    #down_level[
      $t #double_warrow t'$であることを仮定すると、評価の有限列$t warrow t_1 warrow ... warrow t_n warrow t'$が存在することは関係$#double_warrow$に関する帰納法により示される。
    ]
    #down_level[
      評価の有限列$t warrow t_1 warrow ... warrow t_n warrow t'$が存在することを仮定すると、$t #double_warrow t'$は明らかに成り立つ。
    ]
  ]
  #down_level(description: [3.の証明])[
    $t$から開始する評価の列を取ると、項のサイズが停止尺度となるので、停止する。ゆえに2.より証明される。
  ]
  #down_level(description: [4.の証明])[
    2.の有限列を取ると、(a)より明らか。
  ]
  5.と6.についても排他的かつ網羅的な場合分けがなされているので、(c)、(d)、(e)の場合と同様に同値の一方向の十分性を示せば十分である。
  #down_level(description: [5.の証明])[
    任意の$t, v in cal(T)$について、$t #double_oarrow v$ならば明らかに$t #double_warrow v$。
  ]
  #down_level(
    description: [6.の証明],
  )[
    #down_level[
      構造的帰納法により任意の行き詰まり状態$t in cal(T)$に対して$t #double_warrow "wrong"$を示す。\
      #down_level[
        $t in cal(T)$を任意に取り、以下を仮定する。
        - $t$は$oarrow$に関して行き詰まり状態である。
        - $t$の任意の部分項$t_1$について、「$t_1$が$oarrow$に関して行き詰まり状態ならば$t_1 #double_warrow "wrong"$。」が成り立つ。
        #down_level(description: [$t$が$"wrong"$でない値のとき])[
          明らかに矛盾。
        ]
        #down_level(description: [$t$が$"wrong"$のとき])[
          明らかに$t #double_warrow "wrong"$。
        ]
        #down_level(description: [$t$が$"if"$項のとき])[
          $t$は$"if" t_1 "then" t_2 "else" t_3$と表せる。$t_1$は$oarrow$における正規形である。
          #down_level(description: [$t_1$が行き詰まり状態のとき])[
            帰納法の仮定より$t_1 #double_warrow "wrong"$なので、評価列$t_1 warrow s_1 warrow ... warrow s_n warrow "wrong"$が存在する。ゆえに評価列$"if" t_1 "then" t_2 "else" t_3 warrow "if" s_1 "then" t_2 "else" t_3 warrow ... warrow "if" s_n "then" t_2 "else" t_3 warrow "wrong"$が存在するため、$t #double_warrow "wrong"$。
          ]
          #down_level(description: [$t_1$が真理値のとき])[
            $t$が行き詰まり状態であることと矛盾する。
          ]
          #down_level(description: [$t_1$が数値のとき])[
            $t warrow "wrong"$より$t #double_warrow "wrong"$。
          ]
        ]
        #down_level(description: [$t$が$"succ"$項、$"pred"$項、$"iszero"$項のいずれかのとき])[
          $"if"$項のときと同様。ただし、真理値のときと数値のときの証明方法は逆になる。
        ]
        ゆえに$t #double_warrow "wrong"$。
      ]
      よって構造的帰納法により任意の行き詰まり状態$t in cal(T)$に対して$t #double_warrow "wrong"$。
      #down_level[
        $t, t' in cal(T)$を任意に取り、以下を仮定する。
        - $t'$は$oarrow$に関して行き詰まり状態である。
        - $t #double_oarrow t'$
        このとき、評価列$t #double_oarrow t #double_warrow "wrong"$が存在するので$t #double_warrow "wrong"$。
      ]
    ]
  ]
]
