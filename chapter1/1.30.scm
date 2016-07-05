;;;; Answer to exercise 1.30

;; An iterative procedure that computes sum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (+ (term a) result))))
  (iter a 0))
