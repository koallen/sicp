;;;; Answer to exercise 1.17

;; Define double and halve
(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

;; Define the recursive multiplication procedure
(define (mult n m)
  (cond ((= m 0) 0)
        ((even? m) (double (mult n
                                 (halve m))))
        (else (+ n (mult n
                         (- m 1))))))

(define (even? n)
  (= (remainder n 2) 0))
