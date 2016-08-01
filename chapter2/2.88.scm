;;;; Answer to exercise 2.88

;; generic negation procedure
(define (negate x) (apply-generic 'negation x))

;; in scheme number package, we define
(define (negate x)
  (make-scheme-number (- x)))

(put 'negation '(scheme-number) negate)

;; in rational number package, we define
(define (negate x)
  (make-rat (negate (numer x)) (denom x)))

(put 'negation '(rational) negate)

;; in complex number package, we define
(define (negate x)
  (make-complex-from-real-imag (negate (real-part x))
                               (negate (imag-part x))))

(put 'negation '(complex) negate)

;; in polynomial package, we define
(define (negate-terms term-list)
  (if (empty-termlist? term-list)
      term-list
      (let ((first (first-term term-list)))
        (adjoin-term (make-term (order first)
                                (negate (coeff t)))
                     (negate-terms (rest-terms term-list))))))

(put 'negation '(polynomial)
  (lambda (poly) (make-poly (variable poly)
                            (negate-terms (term-list poly)))))

(put 'sub '(polynomial polynomial)
  (lambda (x y) (add x (negate y))))
