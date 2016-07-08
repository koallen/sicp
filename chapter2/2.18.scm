;;;; Answer to exercise 2.18

;; reverse a list
(define (reverse a)
  (define (iter a result)
    (if (null? a)
        result
        (iter (cdr a) (cons (car a)
                            result))))
  (iter a '()))
