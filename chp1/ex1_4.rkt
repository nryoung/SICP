#lang racket

;;;Exercise 1.4. Observe that our model of evaluation allows for combinations
;;;whose operators are compound expressions. Use this observation to describe
;;;the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;;;In English:
;;;Procedure a-plus-abs-b returns the absolute value of b plus a or better said
;;;"If b is greater then 0 return a + b, else return a - b.

(a-plus-abs-b 5 13)
;;;18

(a-plus-abs-b 9 -11)
;;;20
