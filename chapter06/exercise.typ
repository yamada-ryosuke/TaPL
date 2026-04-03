#import "../template.typ": *

#show: config.with()

// 名無し項に対するシフト
#let shift(d, c) = $attach(arrow.t, tr: #text(d), br: #text(c))$

== 演習 6.1.1.
#answer[
  $
    & c_0 = lambda. lambda. 0;\
    &c_2 = lambda. lambda. 1 space(1 space 0);\
    &"plus" = lambda. lambda. lambda. lambda. 3 space 1 space (2 space 1 space 0);\
    &"fix" = lambda. (lambda. 1 space (lambda. (1 space 1) space 0)) space (lambda. 1 space (lambda. (1 space 1) space 0));\
    &"foo" = (lambda. (lambda. 0)) (lambda. 0);
  $
]

== 演習 6.1.4.
=== 定義
#answer[
  集合族$cal(S)_(n, m) (n, m in NN)$を以下のように帰納的に定義する。
  $
        cal(S)_(n, 0) = & emptyset \
    cal(S)_(n, m + 1) = & {0, ... , n - 1} \
                        & union {lambda. t_1 | t_1 in cal(S)_(n + 1, m)} \
                        & union {t_1 space t_2 | t_1, t_2 in cal(S)_(n, m )}
  $
  このとき
  $
    cal(S)_n = union.big_(n in NN) cal(S)_(n, m)
  $
  と定義する。\
]
=== 定義が定義6.1.2.と等しいことの証明
#answer[
  始めに補題として以下を示す。
  #down_level(description: [任意の$n, m in NN$に対して$cal(S)_(n, m) subset cal(S)_(n, m + 1)$が成り立つ。])[
    proof.
    #down_level[
      $m in NN$に関する述語$P(m)$を$forall n in NN, cal(S)_(n, m) subset cal(S)_(n, m + 1)$と定義する。任意の$m in NN$に対して$P(m)$が成り立つことを数学的帰納法により示す。
      #down_level()[
        任意の$n in NN$に対して$cal(S)_(n, 0) = emptyset subset cal(S)_(n, 1)$が成り立つので、$P(0)$が成り立つ。
      ]
      #down_level()[
        $P(m)$が成り立つような$m in NN$を任意に取る。$n in NN, t in S_(n, m + 1)$を任意に取る。\
        #down_level(description: [$t in {0, ... , n - 1}$のとき])[
          $t in {0, ... , n - 1} subset cal(S)_(n, m + 2)$。
        ]
        #down_level(description: [$t = lambda. t_1 (t_1 in cal(S)_(n + 1, m))$のとき])[
          $P(m)$より$t_1 in cal(S)_(n + 1, m) subset cal(S)_(n + 1, m + 1)$なので$t in cal(S)_(n, m + 2)$。
        ]
        #down_level(description: [$t = t_1 space t_2(t_1, t_2 in cal(S)_(n, m))$のとき])[
          $P(m)$より$t_1, t_2 in cal(S)_(n, m) subset cal(S)_(n, m + 1)$なので$t in cal(S)_(n, m + 2)$。
        ]
        よって$t in cal(S)_(n, m + 2)$。
      ]
      よって$P(m + 1)$。
    ]
    よって任意の$m in NN$に対して$P(m)$が成り立つ。
  ]
  任意の$n in NN$に対して$cal(T)_n subset cal(S)_n$を示す。\
  #down_level[
    集合族$cal(S)_n$が定義6.1.2.の(1)～(3)の条件を満たすことを示す。\
    #enum(
      numbering: "(1)",
      [
        ${0, ..., n - 1} subset cal(S)_(n, 0) subset cal(S)_n$より明らか。
      ],
      [
        $n > 0$、$t_1 in cal(S)_n$を任意に取る。\
        $t_1 in cal(S)_(n, m)$となる$m in NN$を一つ取る。このとき、$lambda. t_1 in cal(S)_(n - 1, m + 1)$なので、$lambda. t_1 in cal(S)_(n - 1)$。
      ],
      [
        $t_1, t_2 in cal(S)_n$を任意に取る。\
        $t_1 in cal(S)_(n, m_1), t_2 in cal(S)_(n, m_2)$となる$m_1, m_2 in NN$をそれぞれ一つずつ取る。このとき、$m = max(m_1, m_2)$とすると、$t_1, t_2 in cal(S)_(n, m)$なので、$t_1 space t_2 in cal(S)_(n, m + 1)$なので、$t_1 space t_2 in cal(S)_(n)$。
      ],
    )
    よって、$cal(T)_n$が(1)～(3)を満たす最小の集合族であることから、$cal(T)_n subset cal(S)_n$。
  ]
  任意の$n in NN$に対して$cal(S)_n subset cal(T)_n$を示す。\
  #down_level[
    任意の$m in NN$に対して$forall n in NN, cal(S)_(n, m) subset cal(T)_n$であることを$m$に関する数学的帰納法により示す。
    #down_level[
      明らかに $cal(S)_(n, 0) = emptyset subset cal(T)_n$。
    ]
    #down_level[
      $t in cal(S)_(n, m + 1)$を任意に取る。
      #down_level(description: [$t in {0, ..., n - 1}$のとき])[
        明らかに$t in cal(T)_n$。
      ]
      #down_level(description: [$t = lambda. t_1 (t_1 in cal(S)_(n + 1, m))$のとき])[
        帰納法の仮定より$t_1 in cal(S)_(n + 1, m) subset cal(T)_(n+1)$なので$t = lambda. t_1 in cal(T)_n$。
      ]
      #down_level(description: [$t = t_1 space t_2(t_1, t_2 in cal(S)_(n, m))$のとき])[
        帰納法の仮定より$t_1, t_2 in cal(S)_(n, m) subset cal(T)_(n)$なので$t = t_1 space t_2 in cal(T)_n$。
      ]
      よって$t in cal(T)_n$。
    ]
    よって帰納法により、任意の$m in NN$に対して$forall n in NN, cal(S)_(n, m) subset cal(T)_n$であることが示される。ゆえに、$display(S_n = union.big_(m in NN) S_(n, m) subset cal(T)_n)$。
  ]
  よって、$cal(S)_n = cal(T)_n$。
]
#text[こんにちは]

== 演習 6.1.5.
=== (1)
#answer[
  $
    & "removenames"_Gamma (x) = Gamma#ja("に含まれる最も右の")x#ja("のインデックス") \
    & "removenames"_Gamma (lambda x. t_1) = lambda. "removenames"_(Gamma, x) (t_1) \
    & "removenames"_Gamma (t_1 t_2) = "removenames"_Gamma (t_1) "removenames"_Gamma (t_2)
  $
]
=== (2)
#answer[
  $
    & "restorenames"_Gamma (n) = Gamma#ja("の中で右から")n#ja("番目にある変数")\
    & "restorenames"_Gamma (lambda. t_1) = lambda x. "restorenames"_(Gamma, x) (t_1) (#ja("ただし")x#ja("は")"dom"(Gamma)#ja("に含まれない変数。"))\
    & "restorenames"_Gamma (t_1 t_2) = "restorenames"_Gamma (t_1) "restorenames"_Gamma (t_2)
  $
]

== 演習 6.2.2.
=== (1)
#answer[
  $
    & shift(2, "") (lambda. lambda. space 1 space (0 space 2)) \
    & = shift(2, 0) (lambda. lambda. space 1 space (0 space 2)) \
    & = lambda. lambda. shift(2, 2)(1 space (0 space 2)) \
    & = lambda. lambda. shift(2, 2)(1) space (shift(2, 2)(0) space shift(2, 2)(2)) \
    & = lambda. lambda. space 1 space (0 space 4) \
  $
]
=== (2)
#answer[
  $
    & shift(2, "") (lambda. space 0 space 1 space (lambda. space 0 space 1 space 2)) \
    & = shift(2, 0) (lambda. space 0 space 1 space (lambda. space 0 space 1 space 2)) \
    & = lambda. space shift(2, 1)(0) space shift(2, 1)(1) space (lambda. space shift(2, 2)(0) space shift(2, 2)(1) space shift(2, 2)(2)) \
    & = lambda. space 0 space 3 space (lambda. space 0 space 1 space 4)
  $
]

== 演習 6.2.3.
#answer[
  $t$に関する構造的帰納法により示す。
  #down_level(description: [$t = k(k in {0, ..., n - 1})$のとき])[
    このとき$n >= 1$である。また、$d >= -k >= -(n - 1)$なので、$max(n + d, 0) >= max(n - (n - 1), 0) = max(1, 0) = 1$\
    よって$shift(d, c)(t)$は変数であり、1項なので$max(n + d, 0)$項である。
  ]
  #down_level(description: [$t = lambda. t_1(cal(T)_(n+1))$のとき])[
    帰納法の仮定より$shift(d, c + 1)(t_1)$は$max(n + 1 + d, 0)$項なので、$shift(d, c)(t) = lambda. shift(d, c)(t_1)$は$max(max(n + 1 + d, 0) - 1, 0) = max(max(n + d, -1), 0) = max(n + d, 0)$項である。
  ]
  #down_level(description: [$t = t_1 space t_2(t_1, t_2 in cal(T)_n)$のとき])[
    帰納法の仮定より$shift(d, c)(t_1), shift(d, c)(t_1)$は$max(n + d, 0)$項なので、$shift(d, c)(t) = shift(d, c)(t_1) space shift(d, c)(t_1)$は$max(n + d, 0)$項である。
  ]
  よって構造的帰納法により定理は証明された。
]

== 演習 6.2.5