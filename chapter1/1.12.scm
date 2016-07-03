;;;; Answer to exercise 1.12

;; The procedure computes a Pascal's triangle element given its row and column
(define (pascal-triangle row col)
  (if (or (= col 1) (= col row))
      1
      (+ (pascal-triangle (- row 1) (- col 1))
         (pascal-triangle (- row 1) col))))
