;;;; Answer to exercise 1.36

;; Helper procedure
(define (average x y)
  (/ (+ x y) 2))

;; Fixed point procedure that prints
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; Without average damping
(define (wo-damping)
  (fixed-point (lambda (x) (/ (log 1000) (log x)))
               1.1))

;; With average damping
(define (w-damping)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
               1.1))

;; (wo-damping) takes significantly more steps compared to (w-damping)
