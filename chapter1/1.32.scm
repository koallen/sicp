;;;; Answer to exercise 1.32

;; A recursive version of accumulate procedure
(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner
                                      null-value
                                      term
                                      (next a)
                                      next
                                      b))))

;; An iterative version of the accumulate procedure
(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

;; Sum procedure
(define (sum term a next b)
  (accumulate-iterative + 0 term a next b))

;; Product procedure
(define (product term a next b)
  (accumulate-iterative * 1 term a next b))
