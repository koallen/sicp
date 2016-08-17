;;;; Answer to exercise 3.80

(define (RLC R L C dt)
  (lambda (vC0 iL0)
    (define vC (integral (delay dvC) vC0 dt))
    (define iL (integral (delay diL) iL0 dt))
    (define diL (add-streams (scale-stream vC (/ 1 L))
                             (scale-stream iL (/ (- R) L))))
    (define dvC (scale-stream iL (/ -1 C)))
    (cons vC iL)))
