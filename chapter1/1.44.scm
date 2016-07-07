;;;; Answer to exercise 1.44

;; Define helper procedure
(define (average-3 a b c)
  (/ (+ a b c) 3))

;; The compose procedure
(define (compose f g)
  (lambda (x) (f (g x))))

;; The repeated procedure
(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (- n 1))))

;; The smooth procedure
(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (average-3 (f (- x dx))
                         (f x)
                         (f (+ x dx)))))

;; To generate the n-th fold smoothed function, just call ((repeated smooth n) f)
