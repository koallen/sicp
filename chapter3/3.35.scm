;;;; Answer to exercise 3.35

;; squarer as a primitive constraint
(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
      (if (< (get-value b) 0)
          (error "square less than 0 -- SQUARER" (get-value b))
          (set-value! a
                      (sqrt (get-value b))
                      me))
      (if (has-value? a)
          (set-value! b
                      (square (get-value a))
                      me))))
  (define (process-forget-value)
    (forgot-value! a me)
    (forgot-value! b me))
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
           (process-new-value))
          ((eq? request 'I-lost-my-value)
           (process-forget-value))
          (else
           (error "Unknown request -- SQUARER" request))))
  (connect a me)
  (connect b me)
  me))
