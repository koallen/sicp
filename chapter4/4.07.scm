;;;; Answer to exercise 4.07
(define (let*? exp) (tagged-list? exp 'let*))

(define (let*->nested-lets exps)
  (expand-let* (let-clauses exps) (let-body exps)))

(define (expand-let* clauses body)
  (if (null? clauses)
	  body
	  (list 'let
			(list (car clauses))
			(expand-let* (cdr clauses) body))))

;; we could just add a clause to eval because it will
;; recursively call eval on the expanded let expression
