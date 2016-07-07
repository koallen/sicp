;;;; Answer to exercise 1.42

;; The compose procedure
(define (compose f g)
  (lambda (x) (f (g x))))
