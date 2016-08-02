;;;; Answer to exercise 3.1

;; accumulator
(define (make-accumulator init-sum)
  (lambda (amount)
    (begin (set! init-sum (+ amount init-sum))
           init-sum)))
