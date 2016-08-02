;;;; Answer to exercise 2.91

;; div-terms
(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t2) (order t1))
            (list (the-empty-termlist) L1)
            (let ((new-c (div (coeff t1) (coeff t2)))
                  (new-o (- (order t1) (order t2))))
              (let ((rest-of-result (div-terms (sub-terms L1
                                                         (mul-terms (adjoin-terms (the-empty-termlist)
                                                                                  (make-term new-o new-c))
                                                                    L2))
                                               L2)))
                (list (adjoin-terms (make-term new-o new-c)
                                    (car rest-of-result))
                      (cadr rest-of-result))))))))

;; div-poly
(define (div-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (let ((result (div-terms (term-list p1)
                               (term-list p2))))
        (list (make-poly (variable p1)
                         (car result))
              (make-poly (variable p1)
                         (cadr result))))
      (error "Variable is not the same -- DIV-POLY" (list (variable p1) (variable p2)))))
