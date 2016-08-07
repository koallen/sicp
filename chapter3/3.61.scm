;;;; Answer to exercise 3.61

;; invert-unit-series
(define (invert-unit-series s)
  (cons-stream 1
               (mul-series (invert-unit-series s)
                           (scale-stream (stream-cdr s)
                                         -1))))
