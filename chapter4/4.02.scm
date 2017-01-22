;;;; Answer to exercise 4.02

;; a. if he changes the order, the evaluator will ignore any assignment
;;    and treat them as procedure applications

;; b.
(define (application? exp)
  (tagged-list? exp 'call))

(define (operator exp) (cadr exp))

(define (operands exp) (cddr exp))
