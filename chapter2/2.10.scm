;;;; Answer to exercise 2.10

;; An improved version of div-interval
(define (div-interval x y)
  (if (>= 0 (* (upper-bound y) (lower-bound y)))
      (error "Error: the interval should not span 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
