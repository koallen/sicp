;;;; Answer to exercise 3.2

;; make-monitored
(define (make-monitored f)
  (let ((counter 0))
    (define (mf input)
        (cond ((eq? input 'how-many-calls?)
               counter)
              ((eq? input 'reset-count)
               (set! counter 0))
              (else
               (set! counter (+ counter 1))
               (f input))))
    mf))
