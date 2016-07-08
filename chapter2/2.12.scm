;;;; Answer to exercise 2.12

;; constructor and selector
(define (make-center-percent c p)
  (let ((w (* c p)))
    (make-interval (- c w) (+ c w))))

(define (percent interval)
  (let ((w (/ (- (upper-bound interval) (lower-bound interval)) 2)))
    (/ w c)))
