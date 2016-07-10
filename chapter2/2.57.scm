;;;; Answer to exercise 2.57

;; augend
(define (augend s)
  (accumulate make-sum
              0
              (cddr s)))

;; multiplicand
(define (multiplicand p)
  (accumulate make-product
              1
              (cddr p)))
