;;;; Answer to exercise 2.11

;; mul-interval broken into 9 cases
(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (cond ((and (>= x1 0)
                (>= x2 0)
                (>= y1 0)
                (>= y2 0)) ;; +, + & +, +
           (make-interval (* x1 y1) (* x2 y2)))
          ((and (>= x1 0)
                (>= x2 0)
                (< y1 0)
                (>= y2 0)) ;; +, + & -, +
           (make-interval (* x2 y1) (* x2 y2)))
          ((and (>= x1 0)
                (>= x2 0)
                (< y1 0)
                (< y2 0)) ;; +, + & -, -
           (make-interval (* x2 y1) (* x1 y2)))
          ((and (< x1 0)
                (>= x2 0)
                (>= y1 0)
                (>= y2 0)) ;; -, + & +, +
           (make-interval (* x1 y2) (* x2 y2)))
          ((and (< x1 0)
                (>= x2 0)
                (< y1 0)
                (>= y2 0)) ;; -, + & -, +
           (let ((p1 (* x1 y1))
                 (p2 (* x1 y2))
                 (p3 (* x2 y1))
                 (p4 (* x2 y2)))
             (make-interval (min p1 p2 p3 p4)
                            (max p1 p2 p3 p4))))
          ((and (< x1 0)
                (>= x2 0)
                (< y1 0)
                (< y2 0)) ;; -, + & -, -
           (make-interval (* x2 y1) (* x1 y1)))
          ((and (< x1 0)
                (< x2 0)
                (>= y1 0)
                (>= y2 0)) ;; -, - & +, +
           (make-interval (* x1 y2) (* x2 y1)))
          ((and (< x1 0)
                (< x2 0)
                (< y1 0)
                (>= y2 0)) ;; -, - & -, +
           (make-interval (* x1 y1) (* x1 y2)))
          ((and (< x1 0)
                (< x2 0)
                (< y1 0)
                (< y2 0)) ;; -, - & -, -
           (make-interval (* x1 y1) (* x2 y2))))))
