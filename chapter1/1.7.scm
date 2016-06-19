;;;; Answer to exercise 1.7

;; If we run the sqrt procedure with very small or large numbers, the procedure will terminate with unexpected return value. This is
;; because we didn't consider the scale of the error and used an absolute value.

;; Let's define the sqrt procedure with an alternative good-enough? procedure.
(define (sqrt-iter old-guess guess x)
    (if (good-enough? old-guess guess x)
        guess
        (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? old-guess guess x)
    (< (abs (- old-guess guess))
       (abs (* guess 0.001))))

;; This should work better for small and large numbers
