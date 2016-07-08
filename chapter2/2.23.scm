;;;; Answer to exercise 2.23

;; implementation of for-each
(define (for-each proc items)
  (cond ((null? items) #t)
        (else (proc (car items))
              (for-each proc (cdr items)))))
