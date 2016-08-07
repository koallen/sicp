;;;; Answer to exercise 3.62

;; div-series
(define (div-series s1 s2)
  (if (= 0 (stream-car s2))
      (error "Division by zero -- DIV-SERIES" (list s1 s2))
      (mul-series s1
                  (scale-stream (invert-unit-series (scale-stream s2
                                                                  (/ 1 (stream-car s2))))
                                (stream-car s2))))

;; series for tangent
(define tangent-series
  (div-series sine-series
              cosine-series))
