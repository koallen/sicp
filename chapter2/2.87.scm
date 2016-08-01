;;;; Answer to exercise 2.87

;; =zero? for polynomials
(define (=zero? poly)
  (empty-termlist? (term-list poly)))

(put '=zero? '(polynomial) =zero?)
