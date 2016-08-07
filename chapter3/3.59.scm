;;;; Answer to exercise 3.59

;; integral of series
(define (integrate-series stream)
  (define (generate-stream stream n)
    (cons-stream (* (stream-car stream)
                    (/ 1 n))
                 (generate-stream (stream-cdr stream) (+ n 1))))
  (generate-stream stream 1))

;; series for sine and cosine
(define cosine-series
  (cons-stream 1 (integrate-series (scale-stream sine-series -1))))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))
