;;;; Answer to exercise 2.97

;; reduce-terms
(define (reduce-terms n d)
  (define (find-gcd coeff-list current-gcd)
    (if (null? coeff-list)
        current-gcd
        (find-gcd (cdr coeff-list) (greatest-common-divisor current-gcd (car coeff-list)))))
  (define (div-by-gcd termlist)
    (let ((coeff-gcd (find-gcd (map (lambda (term) (coeff term)) termlist) 1)))
      (map (lambda (term) (make-term (order term)
                             (/ (coeff term)
                                coeff-gcd)))
           termlist)))
  (let* ((gcd-nd (gcd-terms n d))
         (O2 (order (first-term gcd-nd)))
         (O1 (max (order (first-term n))
                  (order (first-term d))))
         (c (coeff (first-term gcd-nd)))
         (factor (expt c (+ 1 (- O1 O2)))))
    (list (div-by-gcd (car (div-terms (mul-terms n
                                                 (make-term 0 factor))
                                      gcd-nd)))
          (div-by-gcd (car (div-terms (mul-terms d
                                                 (make-term 0 factor))
                                      gcd-nd))))))

;; reduce-poly
(define (reduce-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (reduce-terms (termlist p1) (termlist p2))
      (error "Variable is not the same -- REDUCE-POLY" (list (variable p1) (variable p2)))))

;; section b is skipped, it's quite obvious
