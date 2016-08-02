;;;; Answer to exercise 3.6

;; improved rand procedure
(define (rand arg)
  (let ((x random-init))
    (cond ((eq? arg 'generate)
           (set! x (rand-update x))
           x)
          ((eq? arg 'reset)
           (lambda (new-value) (set! x new-value))))))
