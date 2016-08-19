;;;; Answer to exercise 3.82

;; stream version of Monte Carlo integral
(define (estimate-integral P x1 x2 y1 y2)
  ;; generate a stream of random number pairs in range
  (define (generate-rand-in-range)
    (cons-stream (cons (random-in-range x1 x2) (random-in-range y1 y2))
                 (generate-rand-in-range)))
  ;; test the predicate
  (define experiment-stream
    (stream-map P (generate-rand-in-range)))
  (stream-map (lambda (p) (* p (* (- x2 x1)
                                  (- y2 y1))))
              (monte-carlo experiment-stream 0 0)))
