;;;; Answer to exercise 4.1

(load "lib/evaluator.scm")

;; left-to-right
(define (list-of-values-lr exps env)
  (if (no-operands? exps)
      '()
      (let* ((left (eval (first-operand exps) env))
             (right (list-of-values (rest-operands exps) env)))
        (cons left right))))

;; right-to-left
(define (list-of-values-rl exps env)
  (if (no-operands? exps)
      '()
      (let* ((right (list-of-values (rest-operands exps) env))
             (left (eval (first-operand exps) env)))
        (cons left right))))
