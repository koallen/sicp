;;;; Answer to exercise 2.19

;; first-denomination
(define (first-denomination coin-values)
  (car coin-values))

;; except-first-denomination
(define (except-first-denomination coin-values)
  (cdr coin-values))

;; no-more?
(define (no-more? coin-values)
  (if (null? coin-values)
      #t
      #f))

;; counting from both end would give the same result as the same combinations
;; are tested
