;;;; Answer to exercise 3.55

;; partial-sums stream
(define (partial-sums s)
  (cons-stream (stream-car s)
               (add-streams (partial-sums s)
                            (stream-cdr s))))
