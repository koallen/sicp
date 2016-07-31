;;;; Answer to exercise 2.83

;; general raise procedure
(define (raise x) (apply-generic 'raise x))

;; for integer, we define
(define (raise-to-rational x)
  (make-rat x 1))

(put 'raise 'integer
     (lambda (x) (raise-to-rational x)))

;; for rational number, we define
(define (raise-to-real x)
  (make-real (/ (numer x) (denom x))))

(put 'raise 'rational
     (lambda (x) (raise-to-real x)))

;; for real number, we define
(define (raise-to-complex x)
  (make-complex-from-real-imag x 0))

(put 'raise 'real
     (lambda (x) (raise-to-complex x)))
