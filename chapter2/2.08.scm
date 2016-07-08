;;;; Answer to exercise 2.8

;; sub-interval
(define (sub-interval x y)
  (add-interval x (make-interval (- (lower-bound y))
                                 (- (upper-bound y)))))
