;; Answer for exercise 4.04

;; and to if
(define (and? exp) (tagged-list? exp 'and))

(define (and-exps exp) (cdr exp))

(define (and->if exp)
  (expand-and (and-exps exp)))

(define (expand-and exps)
  (if (null? exps)
	  'true
	  (let ((first (car exps))
			(rest (cdr exps)))
	  	(if (null? rest)
		    first
			(make-if first
					 (expand-and rest)
					 'false)))))

;; or to if
(define (or? exp) (tagged-list? exp 'or))

(define (or-exps exp) (cdr exp))

(define (or->if exp)
  (expand-or (or-exps exp)))

(define (expand-or exps)
  (if (null? exps)
	  'false
	  (let ((first (car exps))
			(rest (cdr exps)))
		(if (null? rest)
		    first
			(make-if first
					 'true
					 (expand-or rest))))))
