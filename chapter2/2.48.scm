;;;; Answer to exercise 2.48

;; constructor
(define (make-segment start-vect end-vect)
  (cons start-vect end-vect))

;; selectors
(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))
