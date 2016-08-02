;;;; Answer to exercise 2.94

;; remainder-terms
(define (remainder-terms t1 t2)
  (cadr (div-terms t1 t2)))

;; gcd-poly
(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (gcd-terms (term-list p1) (term-list p2)))
      (error "Variable is not the same -- GCD-POLY" (list (variable p1) (variable p2)))))

;; in the polynomial package, we define
(put 'gcd '(polynomial polynomial)
  (lambda (p1 p2) (tag (gcd-poly p1 p2))))

;; in scheme number package, we define
(put 'gcd '(scheme-number scheme-number) gcd)

;; generic gcd procedure
(define (greatest-common-divisor a b)
  (apply-generic 'gcd a b))
