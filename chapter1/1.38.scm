;;;; Answer to exercise 1.38

;; The continued fraction procedure
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))))
  (iter k 0.0))

;; The Euler continued fraction
(define (euler-e-approx k)
   (+ 2 (cont-frac (lambda (i) 1)
                   (lambda (i) (if (= (remainder i 3) 2)
                                   (/ (+ i 1) 1.5)
                                   1))
                   k)))
