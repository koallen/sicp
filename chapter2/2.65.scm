;;;; Answer to exercise 2.65

;; union-set
(define (union-set set1 set2)
  (let ((set1-list (tree->list-2 set1))
        (set2-list (tree->list-2 set2)))
    (list->tree (union-set-ordered-list set1 set2))))

;; intersection-set
(define (intersection-set set1 set2)
  (let ((set1-list (tree->list-2 set1))
        (set2-list (tree->list-2 set2)))
    (list->tree (intersection-set-ordered-list set1 set2))))
