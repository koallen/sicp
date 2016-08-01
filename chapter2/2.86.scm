;;;; Answer to exercise 2.86

;; generic sine and cosine procedures
(define (sine x) (apply-generic 'sine x))

(define (cosine x) (apply-generic 'cosine x))

;; in scheme number package, we define
(put 'sine 'scheme-number sin)

(put 'cosine 'scheme-number cos)

;; in rational number package, we define
(define (sine x)
  (sin (/ (numer x) (denom x))))

(define (cosine x)
  (cos (/ (numer x) (denom x))))

(put 'sine 'rational sine)

(put 'cosine 'rational cosine)

;; we also need to define other procedure that are used in complex package such as arctan,
;; these definitions are omitted here.

;; notice that we also need to modify the complex package so that generic arithmetic procedures
;; are used instead of +, -, etc. which can only be used on ordinary number.
