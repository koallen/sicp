;;;; Answer to exercise 2.42

;; adjoin-position
;; a queen is represented by her row and column
(define (adjoin-position newrow k rest-of-queens)
  (cons (cons newrow k) rest-of-queens))

;; empty-board
(define empty-board '())

;; safe?
(define (safe? k positions)
  (define (check-attack new-queen other-queens)
    (if (null? other-queens)
        #t
        (let ((queen (car other-queens)))
          (cond ((or (= (car new-queen) (car queen)) ;; check row
                     (= (abs (- (car new-queen) (car queen)))
                        (abs (- (cdr new-queen) (cdr queen))))) ;; check diagonal
                 #f)
                (else (check-attack new-queen (cdr other-queens)))))))
  (check-attack (car positions) (cdr positions)))
