;;;; Answer to exercise 2.27

;; deep reverse
(define (deep-reverse a)
  (define (iter a result)
    (cond ((null? a) result)
          ((pair? (car a)) (iter (cdr a) (cons (deep-reverse (car a))
                                 result)))
          (else (iter (cdr a) (cons (car a)
                      result)))))
  (iter a '()))
