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
=== (1)
#answer[
  $
    & [0 arrow.bar 1](0 space (lambda. lambda. 2)) \
    & = [0 arrow.bar 1](0) space [0 arrow.bar 1](lambda. lambda. 2)) \
    & = [0 arrow.bar 1](0) space lambda. lambda. [2 arrow.bar 3](2) \
    & = 1 space lambda. lambda. 3
  $
]
=== (2)
#answer[
  $
    & [0 arrow.bar 1 space (lambda.2)](0 space lambda. 1) \
    & = [0 arrow.bar 1 space (lambda.2)](0) space [0 arrow.bar 1 space (lambda.2)](lambda. 1) \
    & = [0 arrow.bar 1 space (lambda.2)](0) space lambda.[1 arrow.bar 2 space (lambda.3)](1) \
    & = 1 space (lambda.2) space lambda.2 space (lambda.3) \
  $
]
=== (3)
#answer[
  $
    & [0 arrow.bar 1](lambda. 0 space 2) \
    & = lambda. [1 arrow.bar 2](0 space 2) \
    & = lambda. 0 space 2 \
  $
]
=== (4)
#answer[
  $
    & [0 arrow.bar 1](lambda. 1 space 0) \
    & = lambda. [1 arrow.bar 2](1 space 0) \
    & = lambda. 2 space 0
  $
]

== 演習 6.2.6.
#answer[
  $t$に関する構造的帰納法により示す。
  #down_level(description: [$t = k(k in {0, ..., n - 1})$のとき])[
    #down_level(description: [$k = j$のとき])[
      $[j arrow.bar s]t = s$は明らかに$n$項である。
    ]
    #down_level(description: [$k eq.not j$のとき])[
      $[j arrow.bar s]t = k$は明らかに$n$項である。
    ]
  ]
  #down_level(description: [$t = lambda. t_1(t_1 in cal(T)_(n+1))$のとき])[
    帰納法の仮定より$[j + 1 arrow.bar shift(1, "")(s)]t_1 in cal(T)_(n+1)$なので、$[j arrow.bar s]t = lambda. [j + 1 arrow.bar shift(1, "")(s)]t_1 in cal(T)_n$。
  ]
  #down_level(description: [$t = t_1 space t_2(t_1, t_2 in cal(T)_n)$のとき])[
    帰納法の仮定より$[j arrow.bar s]t_1, [j arrow.bar s]t_2 in cal(T)_n$なので、$[j arrow.bar s]t in cal(T)_n$。
  ]
]

== 演習 6.2.7.
やりました。

== 演習 6.2.8.
=== (1)
#answer[
  $"removenames"_Gamma ([x arrow.bar s]t) = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t)$
]
=== (2)
#answer[
  $t$に関する構造的帰納法により示す。
  #down_level(description: [$t = y$($y$は変数)のとき])[
    #down_level(description: [$y = x$のとき])[
      $
        & "removenames"_Gamma ([x arrow.bar s]t) = "removenames"_Gamma (s) \
        & ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t) \
        & = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (x) \
        & = "removenames"_Gamma (s) \
      $
      より
      $
        "removenames"_Gamma ([x arrow.bar s]t) = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t)
      $
    ]
    #down_level(description: [$y eq.not x$のとき])[
      $
        & "removenames"_Gamma ([x arrow.bar s]t) = "removenames"_Gamma (y) \
        & ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t) \
        & = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (y) \
        & = "removenames"_Gamma (y)
      $
    ]
  ]
  #down_level(description: [$t = lambda x. t_1(t_1 in cal(T))$かつ$y eq.not x$かつ$y in.not "FV"(s)$のとき])[
    補題として以下を示す。
    #down_level(
      description: $"removenames"_(Gamma, y, z_(k-1), ..., z_0) (s) = shift(1, k)("removenames"_(Gamma, z_(l-1), ..., z_0) (s))$,
    )[
      proof.
      #down_level()[
        $s$に関する構造的帰納法により示す。
        #down_level(description: [$s = z_i$のとき])[
          よって、
          $
            & "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s) \
            & = "removenames"_(Gamma, y, z_(k-1), ..., z_0) (z_i) \
            & = i \
            & shift(1, k)("removenames"_Gamma (s)) \
            & = shift(1, k)("removenames"_Gamma (z_i)) \
            & = shift(1, k)(i) \
            & = i
          $
          より
          $
            "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s) = shift(1, k)("removenames"_(Gamma, z_(l-1), ..., z_0) (s))
          $
        ]
        #down_level(description: [$s = z$($z$は$z_0, ..., z_(k-1)$に含まれない変数)のとき])[
          $y in.not "FV"(s)$より$z eq.not y$。ゆえに、
          $
            & "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s) = "removenames"_Gamma (z) + k + 1 \
            & shift(1, k)("removenames"_(Gamma, z_(k-1), ..., z_0) (s))= "removenames"_Gamma (z) + k + 1
          $
          より
          $
            "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s) = shift(1, k)("removenames"_(Gamma, z_(k-1), ..., z_0) (s))
          $
        ]
        #down_level(description: [$s = lambda z. s_1(s_1 in cal(T))$)のとき])[
          $z = y$のときは適切に$alpha$変換すればよいので、$z eq.not y$を仮定する。\
          // Gamma, yではなくGamma, y, z_(k-1), ..., z_0に関する補題を証明しているのは、証明を行う際にここで帰納法の仮定を変数文脈の末尾にzが来る場合にも適用する必要があるから。
          帰納法の仮定より
          $
            "removenames"_(Gamma, y, z_(k-1), ..., z_0, z) (s_1) = shift(1, k + 1)("removenames"_(Gamma, z_(k-1), ..., z_0, z) (s_1))
          $
          よって
          $
            & "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s) \
            & = lambda. "removenames"_(Gamma, z_(k-1), ..., z_0, z) (s_1) \
            & = lambda. shift(1, k + 1)("removenames"_(Gamma, z_(k-1), ..., z_0, z) (s_1)) \
            & = shift(1, k)("removenames"_(Gamma, z_(k-1), ..., z_0) (s))
          $
        ]
        #down_level(description: [$s = s_1 space s_2(s_1, s_2 in cal(T))$)のとき])[
          帰納法の仮定より
          $
            "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s_1) = shift(1, k)("removenames"_(Gamma, z_(l-1), ..., z_0) (s_1))\
            "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s_2) = shift(1, k)("removenames"_(Gamma, z_(l-1), ..., z_0) (s_2))\
          $
          なので、
          $
            & "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s) \
            & = "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s_1) space "removenames"_(Gamma, y, z_(k-1), ..., z_0) (s_2)\
            & = shift(1, k)("removenames"_(Gamma, z_(l-1), ..., z_0) (s_1)) space shift(1, k)("removenames"_(Gamma, z_(l-1), ..., z_0) (s_2))\
            & = shift(1, k)("removenames"_(Gamma, z_(l-1), ..., z_0) (s))
          $
        ]
        よって構造的帰納法により示される。
      ]
    ]
    帰納法の仮定より
    $
      & "removenames"_(Gamma, y) ([x arrow.bar s]t_1) \
      & = ["removenames"_(Gamma, y) (x) arrow.bar "removenames"_(Gamma, y) (s)]"removenames"_(Gamma, y) (t_1)
    $
    よって
    $
      & "removenames"_Gamma ([x arrow.bar s]t) \
      & = "removenames"_Gamma (lambda y. [x arrow.bar s]t_1) \
      & = lambda. "removenames"_(Gamma, y)([x arrow.bar s]t_1) \
      & = lambda. ["removenames"_(Gamma, y) (x) arrow.bar "removenames"_(Gamma, y) (s)]"removenames"_(Gamma, y) (t_1) \
      & = lambda. ["removenames"_Gamma (x) + 1 arrow.bar shift(1, "")("removenames"_Gamma (s))]"removenames"_(Gamma, y) (t_1) \
      & = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]lambda. "removenames"_(Gamma, y) (t_1) \
      & = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (lambda y. t_1) \
      & = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t) \
    $
  ]
  #down_level(description: [$t = t_1 space t_2(t_1, t_2 in cal(T))$のとき])[
    帰納法の仮定より
    $
      "removenames"_Gamma ([x arrow.bar s]t_1) = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t_1)\
      "removenames"_Gamma ([x arrow.bar s]t_2) = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t_2)
    $
    なので
    $
      & "removenames"_Gamma ([x arrow.bar s]t) \
      & = "removenames"_Gamma ([x arrow.bar s]t_1) space "removenames"_Gamma ([x arrow.bar s]t_2) \
      & = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t_1) \
      & #h(3em) space ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t_2) \
      & = ["removenames"_Gamma (x) arrow.bar "removenames"_Gamma (s)]"removenames"_Gamma (t)
    $
  ]
]

== 演習 6.3.1.
#answer[
  $t_(1 2)$に含まれる自由変数は0以上なので、$[0 arrow.bar shift(1, "")(v_2)]t_(1 2)$に含まれる自由変数は1以上。よって、$shift(-1, "")([0 arrow.bar shift(1, "")(v_2)]t_(1 2))$に含まれる自由変数は0以上なので、正しくない形の項は作られない。
]

== 演習 6.3.2.
=== de bruijnレベルの定義
#answer[
  集合族$(S_n) (n = 0, 1, ...)$を次の条件を満たす最小の集合の族とする。
  #enum(
    [
      $n$未満の整数$k$に対して$k in S_n$。
    ],
    [
      任意の$n > 0$、$s_1 in S_n$に対して$lambda. s_1 in S_(n - 1)$。
    ],
    [
      任意の$s_1, s_2 in S_n$に対して$s_1 space s_2 in S_n$。
    ]
  )
  このとき、$S = S_0$をde Bruijnレベルを用いた項の集合とする。
]
=== インデックスとレベルの変換
#answer[
  関数族$"indexToLevel"_n (n = 0, 1, ...)$を以下のように帰納的に定義する。
  $
    & "indexToLevel"_n (k) = n - k - 1\
    & "indexToLevel"_n (lambda. t_1) = lambda. "indexToLevel"_(n+1) (t_1)\
    & "indexToLevel"_n (t_1 space t_2) = "indexToLevel"_n (t_1) space "indexToLevel"_n (t_2)
  $
  このとき、インデックスからレベルに変換する関数を$"indexToLevel" = "indexToLevel"_0$とする。\
  関数族$"levelToIndex"_n (n = 0, 1, ...)$を以下のように帰納的に定義する。
  $
    & "levelToIndex"_n (k) = n - k - 1\
    & "levelToIndex"_n (lambda. s_1) = lambda. "levelToIndex"_(n+1) (s_1)\
    & "levelToIndex"_n (s_1 space s_2) = "levelToIndex"_n (s_1) space "levelToIndex"_n (s_2)
  $
  このとき、レベルからインデックスに変換する関数を$"levelToIndex" = "levelToIndex"_0$をとする。
]