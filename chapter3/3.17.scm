;;;; Answer to exercise 3.17

;; corrected version of count-pairs
(define (count-pairs x)
  (let ((traversed '()))
    (define (traverse x)
      (cond ((not (pair? x)) 0)
            ((memq x traversed) 0)
            (else (set! traversed (cons x traversed))
                  (+ (traverse (car x))
                     (traverse (cdr x))
                     1))))
    (traverse x)))
