#lang racket

;;; The good-enough? test used in computing square roots will not be very
;;; effective for finding the square roots of very small numbers. Also, in real
;;; computers, arithmetic operations are almost always performed with limited
;;; precision. This makes our test inadequate for very large numbers. Explain
;;; these statements, with examples showing how the test fails for small and
;;; large numbers. An alternative strategy for implementing good-enough? is
;;; to watch how guess changes from one iteration to the next and to stop when
;;; the change is a very small fraction of the guess. Design a square-root
;;; procedure that uses this kind of end test. Does this work better for small
;;; and large numbers?

(define (good-enough guess x)
  (< (abs (- (square guess) x)) 0.001))

;;; Answer:
;;; First we will take a look at relatively small numbers to see how
;;; good-enough fails

(sqrt-iter 1 .5123)
;;; .7157521658272334
;;; Which is correct, but now if we add a significant amount of decimal places
;;; we can see it fail:

(sqrt-iter 1 .00000000000000000005123)
;;; .03125
;;; Which is incorrect, the actual answer is some around 2.2634 * 10**-10
;;; On my machine giving Racket 128 MB there is only percision to the 23rd
;;; decimal place. When it tries to go past that underflow occurs.

;;; Now we take a look at it failing with a significantly large number:

(sqrt-iter 1 99999999999999999)
;;; No immediate result
;;; This may eventually produce a result, given that my initial guess is
;;; significantly lower then the actual square root, but who wants to wait
;;; around for that?

;;; TODO: Design a better method for the good-enough procedure. Will have to
;;; do more research on computing square roots.
