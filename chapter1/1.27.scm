;;;; Answer to exercise 1.27

(define (carmichael-number n)
  (define (test-number a)
    (cond ((= a 0) #t)
          ((not (= a (remainder (expt a n) n))) #f)
          (else (test-number (- a 1)))))
  (test-number (- n 1)))
