;;;; Answer to exercise 2.44

;; up-split
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside painter painter)))))
