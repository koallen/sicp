;;;; Answer to exercise 2.6

;; one and two
(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

;; addition
(define (add n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))
