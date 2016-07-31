;;;; Answer to exercise 2.80

;; generic =zero? procedure
(define (=zero? x) (apply-generic '=zero? x))

;; in scheme number package, we define
(define (=zero? x) (= 0 x))

(put '=zero? 'scheme-number =zero?)

;; in rational number package, we define
(define (=zero? x) (= 0 (numer x)))

(put '=zero? 'rational =zero?)

;; in complex number package, we define
(define (=zero? x)
  (and (= 0 (real-part x))
       (= 0 (imag-part x))))

(put '=zero? 'complex =zero?)
