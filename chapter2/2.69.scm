;;;; Answer to exercise 2.69

;; successive-merge
(define (successive-merge set)
  (if (= 1 (length set))
      (car set)
      (let ((first (car set))
            (second (cadr set))
            (rest-in-set (cddr set)))
        (successive-merge (adjoin-set (make-code-tree first second)
                                      rest-in-set)))))
