;;;; Answer to exercise 1.16

;; A procedure that computes exponentiation with iterative process
(define (fast-expt-iterative b n)
  ;; An inner procedure
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (* b b)
                                     (/ n 2)
                                     a))
          (else (fast-expt-iter b
                                (- n 1)
                                (* a b)))))
  (fast-expt-iter b n 1))

(define (even? n)
  (= (remainder n 2) 0))
