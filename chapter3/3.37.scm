;;;; Answer to exercise 3.37

;; c-
(define (c- x y)
  (let ((z (make-connector)))
    (adder y z x)
    z))

;; c*
(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

;; c/
(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier y z x)
    z))

;; cv
(define (cv value)
  (let ((x (make-connector)))
    (constant value x)
    x))
