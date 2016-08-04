;;;; Answer to exercise 3.19

;; cycle detection with constant space
(define (tortoise-and-hare x)
  (define (safe-cdr x)
    (if (pair? x)
        (cdr x)
        '()))
  (define (traverse tortoise hare)
    (cond ((null? tortoise) #f)
          ((null? hare) #f)
          ((eq? tortoise hare) #t)
          (else (traverse (safe-cdr tortoise) (safe-cdr (safe-cdr hare))))))
  (traverse (safe-cdr x) (safe-cdr (safe-cdr x))))
