;;;; Answer to exercise 2.73

;; number? and same-variable? cannot be assimilated into data-directed dispatch because the argument they operate on doesn't have a tag.

;; the package definition
(define (install-deriv-package)
  ;; internal procedures
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (define (deriv-product exp var)
    (make-sum (make-product (multiplier exp)
                            (deriv (multiplicand exp) var))
              (make-product (deriv (multiplier exp) var)
                            (multiplicand exp))))

  ;; interface to the rest of the system
  (put 'deriv '(+) deriv-sum)
  (put 'deriv '(*) deriv-product)

  ;; additional differentiation rule
  (define (deriv-exponentiation exp var)
    (make-product (exponent exp)
                  (make-product (make-exponentiation (base exp)
                                                     (- (exponent exp) 1))
                                (deriv (base exp)
                                       var))))

  (put 'deriv '(**) deriv-exponentiation)
  'done)

;; in this situation, deriv becomes the type tag and operators are the operations.
;; we only need to change the call to put
