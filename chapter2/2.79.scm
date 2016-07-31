;;;; Answer to exercise 2.79

;; generic predicate equ?
(define (equ? x y) (apply-generic 'equ? x y))

;; in scheme number package, we define
(put 'equ? '(scheme-number scheme-number) =)

;; in rational number package, we define
(define (equ? x y)
  (and (= (numer x) (numer y))
       (= (denom x) (denom y))))

(put 'equ? '(rational rational) equ?)

;; in complex number package, we define
(define (equ? x y)
  (and (= (real-part x) (real-part y))
       (= (imag-part x) (imag-part y))))

(put 'equ? '(complex complex) equ?)
