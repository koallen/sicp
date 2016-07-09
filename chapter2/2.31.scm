;;;; Answer to exercise 2.31

;; tree map
(define (tree-map proc tree)
  (map (lambda (tree)
         (if (pair? tree)
             (tree-map proc tree)
             (proc tree)))
       tree))
