;;;; Answer to exercise 3.18

;; cycle-detection
(define (cycle-in-list? x)
  (let ((traversed '()))
    (define (traverse x)
      (cond ((null? x) #f)
            ((memq x traversed) #t)
            (else (set! traversed (cons x traversed))
                  (traverse (cdr x)))))
    (traverse x)))