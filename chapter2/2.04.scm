;;;; Answer to exercise 2.4

;; cdr
(define (cdr z)
  (z (lambda (p q) q)))
