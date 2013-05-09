#lang racket
;;; Alyssa P. Hacker doesn't see why if needs to be provided as a special
;;; form. ``Why can't I just define it as an ordinary procedure in terms of
;;; cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be 
;;; done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

;;; Eva demonstrates the program for Alyssa

(new-if (= 2 3) 0 5)
;;; 5

(new-if (= 1 1) 0 5)
;;; 0

;;; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (sqr-iter (improve guess x)
                      x)))
;;; What happens when Alyssa attempts to use this to compute square roots?
;;; Explain.

;;; Answer:
;;; When the sqrt-iter procedure is called like the following:

(sqrt-iter 3 36)

;;; An infinite loop occurs. This is because of how the interpreter evaluates
;;; the parameters in the new-if procedure. Since LISP/Racket uses applicative
;;; order evaluation all parameters are evaluated when encountered. So
;;; unlike the special case with an if procedure, which, evaluetes to #true
;;; if the predicate is met, the new-if procedure is never able to since it is
;;; using a user defined predicate.
