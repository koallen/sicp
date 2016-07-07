;;;; Answer to exercise 1.41

;; Define helper procedure
(define (inc x)
  (+ x 1))

;; Define double
(define (double f)
  (lambda (x) (f (f x))))

;; The value returned by (((double (double double)) inc) 5) is 21
