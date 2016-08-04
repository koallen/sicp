;;;; Answer to exercise 3.29

;; or built from nand
(define (or-gate a1 a2 output)
  (define b1 (make-wire))
  (define b2 (make-wire))
  (define c1 (make-wire))
  (inverter a1 b1)
  (inverter a2 b2)
  (and-gate b1 b2 c1)
  (inverter c1 output))

;; the delay of the or gate is and-gate-delay + 2 * inverter-delay
