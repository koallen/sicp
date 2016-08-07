;;;; Answer to exercise 3.60

;; mul-series
(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1)
                  (stream-car s2))
               (add-streams (mul-series (stream-cdr s1)
                                        s2)
                            (scale-stream (stream-cdr s2)
                                          (stream-car s1)))))

;; verification series
(define cos-sin-1
  (add-streams (mul-stream cosine-series
                           cosine-series)
               (mul-stream sine-series
                           sine-series)))
