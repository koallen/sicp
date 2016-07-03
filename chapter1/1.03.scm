;;;; Answer to exercise 1.3

;; Define square procedure
(define (square x)
  (* x x))

;; Define sum of square procedure
(define (sum-of-square x y)
  (+ (square x) (square y)))

;; Define sum of square of larger two numbers procedure
(define (sum-of-square-larger-two x y z)
  (cond ((and (<= x y) (<= x z)) (sum-of-square y z))
        ((and (<= y x) (<= y z)) (sum-of-square x z))
        ((and (<= z x) (<= z y)) (sum-of-square z y))))
