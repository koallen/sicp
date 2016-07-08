;;;; Answer to exercise 2.2

;; segment constructor and selector
(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

;; point constructor and selector
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

;; mid-segment
(define (mid-segment segment)
  (define (average x y)
    (/ (+ x y) 2.0))
  (let ((a (start-segment segment))
        (b (end-segment segment)))
    (cons (average (x-point a)
                   (x-point b))
          (average (y-point a)
                   (y-point b)))))
