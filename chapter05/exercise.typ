#import "../template.typ": *

#show: config.with()

== 演習 5.2.1.
#answer[
  $
    & "or" = lambda b. space lambda c. space b space "tru" c; \
    & "not" = lambda b. space b "fls" "tru";
  $
]

== 演習 5.2.2.
#answer[
  $
    "scc" = lambda n. space lambda f. space lambda x. space n space f space (f space x);
  $
]

== 演習 5.2.3.
#answer[
  $
    "times2" = lambda m. space lambda n. space lambda f. space m space (n space f);
  $
]

== 演習 5.2.4.
#answer[
  $m^n$を以下のように定義できる。
  $
    "power" = lambda m. space lambda n. space n space m;
  $
]

== 演習 5.2.5.
#answer[
  $
    "subtract" = lambda m. space lambda n. space n "prd" m;
  $
]

== 演習 5.2.6.
#answer[
  おおよそ$O(n)$回。とはいえ、もしも値呼びをするのであれば、そもそも$s$や$z$に具体的な値が代入されるまで評価されないので、$"prd" c_n$と書いただけでは最後まで評価が進まない。
]