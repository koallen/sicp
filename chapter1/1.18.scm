;;;; Answer to exercise 1.18

;; Define double and halve
(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

;; Define the iterative multiplication procedure
(define (mult n m)
  (define (mult-iter n m a)
    (cond ((= m 0) a)
          ((even? m) (mult-iter (double n)
                                (halve m)
                                a))
          (else (mult-iter n
                           (- m 1)
                           (+ a n)))))
  (mult-iter n m 0))

(define (even? n)
  (= (remainder n 2) 0))
