;;;; Answer to exercise 4.05
(define (cond-actions clause)
  (if (eq? (cadr clause) '=>) ;; check for additional syntax
	  (cons (caddr clause) (cond-predicate clause))
	  (cdr clause)))
