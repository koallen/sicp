;;;; Answer to exercise 2.40

;; unique pairs
(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list j i))
           (enumarate-interval 1 (- i 1))))
    (enumarate-interval 1 n)))

;; simplified prime-sum-pairs
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
