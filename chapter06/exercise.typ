#import "../template.typ": *

#show: config.with()

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
