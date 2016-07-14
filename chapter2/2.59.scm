;;;; Answer to exercise 2.59

;; union-set
(define (union-set set1 set2)
  (cond ((or (null? set1) (null? set2)) set2)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))
