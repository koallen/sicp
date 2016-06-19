;;;; Answer to exercise 1.8

(define (cube-root old-guess guess x)
    (if (good-enough? old-guess guess x)
        guess
        (cube-root guess (improve guess x) x)))

(define (improve guess x)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))

(define (good-enough? old-guess guess x)
    (< (abs (- old-guess guess))
       (abs (* guess 0.001))))
