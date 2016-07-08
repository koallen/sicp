;;;; Answer to exercise 2.5

;; Helper procedure
(define (divisible-by? a b)
  (= (remainder a b) 0))

;; cons, car, and cdr
(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car z)
  (define (iter z result)
    (if (divisible-by? z 2)
        (iter (/ z 2) (+ result 1))
        result))
  (iter z 0))

(define (cdr z)
  (define (iter z result)
    (if (divisible-by? z 3)
        (iter (/ z 3) (+ result 1))
        result))
  (iter z 0))
