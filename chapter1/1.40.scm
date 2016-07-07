;;;; Answer to exercise 1.40

;; Define helper procedure
(define (cube x)
  (* x x x))

;; The cubic procedure
(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))
