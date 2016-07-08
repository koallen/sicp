;;;; Answer to exercise 2.17

;; find the lest element in list
(define (last a)
  (if (null? (cdr a))
      (car a)
      (last (cdr a))))
