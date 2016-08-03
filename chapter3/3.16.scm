;;;; Answer to exercise 3.16

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define three (list 1 2 3))

(define a (cons 1 2))
(define b (cons a 2))
(define four (cons a b))

(define m (cons 1 2))
(define n (cons m m))
(define seven (cons n n))

(define infinite (list 1 2 3))
(set-cdr! (cddr infinite) infinite)
