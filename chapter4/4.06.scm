;;;; Answer to exercise 4.06
(define (let? exp) (tagged-list? exp 'let))

(define (let-clauses exp) (cadr exp))

(define (let-body exp) (caddr exp))

(define (let-vars clauses) (map car clauses))

(define (let-exps clauses) (map cadr clauses))

(define (let->combination exp)
  (expand-let (let-clauses exp) (let-body exp)))

(define (expand-let clauses body)
  (cons (make-lambda (let-vars clauses)
					 body)
		(let-exps clauses)))
