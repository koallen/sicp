;;;; Answer to exercise 1.45

;; Define helper procedure
(define (damp-time n)
  (floor (/ (log n) (log 2))))

;; Define nth-pow procedure
(define (nth-pow x n)
  (fixed-point ((repeated average-damp (damp-time n)) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))
