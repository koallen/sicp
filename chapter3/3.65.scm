;;;; Answer to exercise 3.65

;; series for ln(2)
(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (pi-summands (+ n 1)))))

(define ln2-stream
  (partial-sum (ln2-summands 1)))
