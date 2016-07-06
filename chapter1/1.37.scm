;;;; Answer to exercise 1.37

;; k-term finite continued fraction

;; A recursive procedure
(define (cont-frac n d k)
  (if (= k 0)
      0.0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

;; An iterative procedure
(define (cont-frac-iterative n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))))
  (iter k 0.0))

;; To be accurate to 4 decimal places, k must be greater than 10
