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

== 演習 5.2.7.
#answer[
  $
    "equal" = lambda m. space lambda n. "and" ("iszro" ("subtract" m n)) ("iszro" ("subtract" n m));
  $
]

== 演習 5.2.8.
#answer[
  リストを表現する際、fold関数(指定した二項演算を繰り返してリストの全要素をまとめ上げる関数)で表現する。例えば、演算として足し算を、初期値として0を渡すと、リストの全ての要素を足した数が戻り値となる。以下の例では$c$に二項演算を、$n$に初期値を入れる。
  $
    & [x, y, z] = lambda c. space lambda n. space c space x space (c space y space (c space z space n)); \
    & "nil" = lambda c. space lambda n. space n; \
    & "cons" = lambda h. space lambda t. space lambda c. space lambda n. space c space h space (t space c space h); \
    & "isnil" = lambda t. space t space (lambda x. space lambda y. "fls") "tru"; \
    & "head" = lambda t. space t space (lambda x. space lambda y. space x) c_0; \
    & "tail" = lambda t. "fst" (t space (lambda x. space lambda y. space "pair" ("snd" y) space ("cons" x space ("snd" y))) space ("pair" "nil" "nil"));
  $
]

== 演習 5.2.9.
#answer[
  値呼び戦略は正格であるため、testを使うと$"fct" ("prd" c_1)$を評価する際に不要な$"fct" ("prd" c_0)$まで評価する必要が出てきてしまい、無限ループに陥るためifが使われている。もしもtestを使うのであれば、$"fct" ("prd" n)$部分を抽象で包んで値として扱われるようにすればよい。すなわち
  $
    g = lambda "fct". "test" ("iszro" n) space (lambda x. c_1) space ("times" n space lambda x. "fct" space ("prd" n)) space c_0
  $
]

== 演習 5.2.10.
#answer[
  $
    & g = lambda f. space lambda n. space "if" "iszero" n \
    & #h(7em) "then" c_0 \
    & #h(7em) "else" "scc" (f space ("pred" n)); \
    & "churchnat" = "fix" g;
  $
]

== 演習 5.2.11.
#answer[
  $
    & g = lambda f. space lambda l. "test" ("isnil" l) space (lambda x. space c_0) space (lambda x. "plus" ("head" l) space (f space ("tail" l))) space c_0;\
    & "sumlist" = "fix" g;
  $
]

== 演習 5.3.3.
