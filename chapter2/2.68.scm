;;;; Answer to exercise 2.68

;; encode-symbol
(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
      (let ((left-br (left-branch tree))
            (right-br (right-branch tree)))
        (cond ((element-of-set? symbol (symbols left-br))
               (cons 0 (encode-symbol symbol left-br)))
              ((element-of-set? symbol (symbols right-br))
               (cons 1 (encode-symbol symbol right-br)))
              (else (error "bad symbol -- ENCODE-SYMBOL" symbol))))))
