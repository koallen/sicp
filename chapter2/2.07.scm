;;;; Answer to exercise 2.7

;; selectors
(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))
