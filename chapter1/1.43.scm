;;;; Answer to exercise 1.43

;; The compose procedure
(define (compose f g)
  (lambda (x) (f (g x))))

;; The repeated procedure
(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (- n 1))))
