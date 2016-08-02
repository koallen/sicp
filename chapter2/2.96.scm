;;;; Answer to exercise 2.96

;; pseudoremainder-terms
(define (pseudoremainder-terms t1 t2)
  (let ((c (coeff (first-term t2)))
        (O1 (order (first-term t1)))
        (O2 (order (first-term t2))))
    (cadr (div-terms (mul-terms t1
                                (make-term 0
                                           (expt c (+ 1 (- O1 O2)))))
                     t2))))

;; modified gcd-terms
(define (gcd-terms a b)
  (define (find-gcd coeff-list current-gcd)
    (if (null? coeff-list)
        current-gcd
        (find-gcd (cdr coeff-list) (greatest-common-divisor current-gcd (car coeff-list)))))
  (if (empty-termlist? b)
      ;; get the list of coefficients and find their gcd
      (let ((coeff-gcd (find-gcd (map (lambda (term) (coeff term))
                                      a)
                                 1)))
        ;; divide all the coefficients with the gcd found
        (map (lambda (term) (make-term (order term)
                                       (/ (coeff term) coeff-gcd)))
             a))
      (gcd-terms b (pseudoremainder-terms a b))))
