#import "../template.typ": *
#import "@preview/curryst:0.6.0": prooftree, rule

#show: config.with()

== 演習 8.2.3.
#answer[
  項$t$の部分項は$t$の直接の部分項の部分項と$t$自身のみである。ゆえに、構造的帰納法により証明される。
]

== 演習 8.3.4
#answer[
  任意の導出$cal(D)$に対して、その結論$t arrow t'$が$t : T$を満たすなら$t' : T$となることを導出$cal(D)$に関する帰納法により示す。
  #down_level(description: [$cal(D)$の最後で使われた規則がE-IFTRUEのとき])[
    $t = "if" "true" "then" t_2 "else" t_3$かつ$t' = t_2$である。ゆえに、$t : T$より$t_2 : T$なので$t' : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-IFFALSEのとき])[
    $t = "if" "false" "then" t_2 "else" t_3$かつ$t' = t_3$である。ゆえに、$t : T$より$t_3 : T$なので$t' : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-IFのとき])[
    $t = "if" t_1 "then" t_2 "else" t_3$かつ$t' = "if" t'_1 "then" t_2 "else" t_3$かつ$t_1 arrow t'_1$である。ここで、$t : T$より$t_1 : "Bool"$、$t_2 : T$、$t_3 : T$である。ゆえに、帰納法の仮定より$t'_1 : "Bool"$なので、T-IFより$t' : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-SUCCのとき])[
    $t = "succ" t_1$かつ$t' = "succ" t'_1$かつ$t_1 arrow t'_1$である。ここで、$t : T$より$T = "Nat"$かつ$t_1 : "Nat"$。ゆえに、帰納法の仮定より$t'_1 : "Nat"$なので、T-SUCCより$"succ" t'_1 : "Nat"$。すなわち$t' : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-PREDZEROのとき])[
    $t = "pred" 0$かつ$t' = 0$である。ここで、明らかに$T = "Nat"$かつ$t' : "Nat"$なので、$t' : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-PREDSUCCのとき])[
    $t = "pred" ("succ" "nv"_1)$かつ$t' = "nv"_1$である。ここで、$t : T$より$T = "Nat"$かつ$"succ" "nv"_1 : "Nat"$なので$"nv"_1 : "Nat"$。ゆえに$t' : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-PREDのとき])[
    $t = "pred" t_1$かつ$t' = "pred" t'_1$かつ$t_1 arrow t'_1$である。ここで、$t : T$より$T = "Nat"$かつ$t_1 : "Nat"$。ゆえに、帰納法の仮定より$t'_1 : "Nat"$なので、T-PREDより$"pred" t'_1 : "Nat"$。すなわち$t : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-ISZEROZEROのとき])[
    $t = "iszero" 0$かつ$t' = "true"$である。ここで、$t : T$より$T = "Bool"$。よって、$"true" : "Bool"$より$t' : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-ISZEROSUCCのとき])[
    $t = "iszero" ("succ" "nv"_1)$かつ$t' = "false"$である。ここで、$t : T$より$T = "Bool"$。よって、$"false" : "Bool"$より$t' : T$。
  ]
  #down_level(description: [$cal(D)$の最後で使われた規則がE-ISZEROのとき])[
    $t = "iszero" t_1$かつ$t' = "iszero" t'_1$かつ$t_1 arrow t'_1$である。ここで、$t : T$より$T = "Bool"$かつ$t_1 : "Nat"$。ゆえに、帰納法の仮定より$t'_1 : "Bool"$なので、T-ISZEROより$"iszero" t'_1 : "Bool"$。すなわち$t' : T$。
  ]
]

== 演習 8.3.5.
#answer[
  E-PREDZEROを取り除いたとする。このとき$0 : "Nat"$より$"pred" 0 : "Nat"$となり、$"pred" 0 $は正しく型付けされる。しかし$"pred" 0$は値ではなく、評価もされない。これは進行定理が成り立たなくなることを意味する。\
  このように、進行定理を成立させるためにE-PREDZEROが必要である。
]

== 演習 8.3.6.
#answer[
  成り立たない。\
  $t = "if" "true" "then" "true" "else" 0$、$t' = "true"$、$T : "Bool"$とする。このとき$t arrow t'$かつ$t' : T$となるが、$t$は型付けできないので反例となる。\
  なお、「$t$が型付け可能」という条件を付け足すと成り立つ。
]

== 演習 8.3.7.
=== 進行定理
#answer[
  $t : T$ならば、値$v'$が存在して$t arrow.b.double v'$。
]
=== 保存定理
#answer[
  $t : T$かつ$t arrow.b.double t'$のとき、$t' : T$。
]

== 演習 8.3.8.
#answer[
  そのままでよい。
]