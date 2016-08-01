;;;; Answer to exercise 2.89

;; an alternative representation for term-list

(define (adjoin-term term term-list)
  ;; the list may need padding
  (define (pad new-highest-order term-list)
    (if (= (- new-highest-order 1)
           (- (length term-list) 1))
        term-list
        (pad new-highest-order (cons 0 term-list))))
  (if (=zero? (coeff term))
      term-list
      (cons (coeff term) (pad (order term) term-list))))

(define (the-empty-termlist) '())

;; here we need to calculate the order of the term
(define (first-term term-list)
  (make-term (- (length term-list) 1)
             (car term-list)))

(define (rest-terms term-list)
  (cdr term-list))

(define (empty-termlist? term-list) (null? term-list))
