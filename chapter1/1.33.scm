;;;; Answer to exercise 1.33

;; The filtered-accumulate procedure
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (if (filter a)
                           (combiner (term a) result)
                           result))))
  (iter a null-value))

;; The following procedures assume the filter is already defined

;; Sum of square of prime numbers
(define (sum-square-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

;; Product of integers with no GCD with n
(define (product-no-gcd n)
  (define (no-gcd-n? i)
    (= (gcd i n) 1))
  (filtered-accumulate * 1 identity 1 inc n no-gcd-n?))
