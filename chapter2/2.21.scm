;;;; Answer to exercise 2.21

;; first definition
(define (square-list-1 items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list-1 (cdr items)))))

;; second definition
(define (square-list-2 items)
  (map square items))
