;;;; Answer to exercise 2.30

;; simple definition
(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

;; using map
(define (square-tree-map tree)
  (map (lambda (tree)
         (if (pair? tree)
             (square-tree-map tree)
             (square tree)))
       tree))
