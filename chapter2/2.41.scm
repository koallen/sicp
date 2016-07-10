;;;; Answer to exercise 2.41

;; find i, j, k
(define (ijk n s)
  (filter sum-to-s?
          (flatmap permutations
                   (flatmap
                     (lambda (jk)
                       (map (lambda (i) (cons i jk))
                            (enumarate-interval 1 (- (car jk) 1))))
                     (unique-pairs n)))))

;; sum-to-s?
(define (sum-to-s? ijk)
  (= (accumulate + 0 ijk) s))
