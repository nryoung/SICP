#lang racket

;;;Ben Bitdiddle has invented a test to determine whether the interpreter he
;;;is faced with is using applicative-order evaluation or normal-order
;;;evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;;; Then he evaluates the expression

(test 0 (p))

;;;What behavior will Ben observe with an interpreter that uses applicative-
;;;order evaluation? What behavior will he observe with an interpreter that
;;;uses normal-order evaluation? Explain your answer. (Assume that the
;;;evaluation rule for the special form if is the same whether the 
;;;interpreter is using normal or applicative-order: The predicate expression
;;;is evaluated first, and the result determines whether to evaluate the
;;;consequent or the alternative expression.)

;;;Answer:
;;;With applicative-order evaluation you will see no output as this puts you 
;;;in an infinite loop. Since the arguments are evaluated when the procedure
;;;is applied (p) is continously just defining itself and thus the program
;;;never stops.
;;;
;;;With normal-order evaluation we would actually see the procedure "test"
;;;produce the value of 0. This is because normal-order evaluation uses
;;;lazy evaluation, i.e. the arguments are never evaluated unless needed,
;;;which in this example, procedure (p) is not needed thus never evaluated.
