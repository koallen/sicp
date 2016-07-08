;;;; Answer to exercise 2.20

;; helper procedure
(define (reverse a)
  (define (iter a result)
    (if (null? a)
        result
        (iter (cdr a) (cons (car a)
                            result))))
  (iter a '()))

;; same-parity
(define (same-parity x . y)
  (define (iter y result)
    (cond ((null? y) result)
          ((= (remainder (- x (car y)) 2) 0) (iter (cdr y) (cons (car y) result)))
          (else (iter (cdr y) result))))
  (reverse (iter y (list x))))

;; this is an alternative recursive definition of the procedure same-parity
(define (same-parity-r x . y)
  (define (recursive y)
    (cond ((null? y) '())
          ((= (remainder (- x (car y)) 2) 0) (cons (car y) (recursive (cdr y))))
          (else (recursive (cdr y)))))
  (recursive (cons x y)))
