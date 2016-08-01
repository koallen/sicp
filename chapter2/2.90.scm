;;;; Answer to exercise 2.90

;; we need to define two packages for the two representations
(define (install-dense-termlist-package)
  ;; internal procedures
  (define (adjoin-term term term-list)
    (define (pad new-highest-order term-list)
      (if (= (- new-highest-order 1)
             (- (length term-list) 1))
          term-list
          (pad new-highest-order (cons 0 term-list))))
    (if (=zero? (coeff term))
        term-list
        (cons (coeff term) (pad (order term) term-list))))

  (define (first-term term-list)
    (make-term (- (length term-list) 1)
               (car term-list)))

  (define (rest-terms term-list)
    (cdr term-list))

  ;; interface to the rest of the system
  (define (tag t) (attach-tag 'dense t))
  (define (tag-term t) (attach-tag 'term t))
  (put 'make 'dense (tag '()))
  (put 'empty-termlist? 'dense
    (lambda (term-list) (null? term-list)))
  (put 'adjoin-term '(term dense)
    (lambda (term term-list) (tag (adjoin-term term term-list))))
  (put 'first-term '(dense)
    (lambda (term-list) (tag-term (first-term term-list))))
  (put 'rest-terms '(dense)
    (lambda (term-list (tag (rest-terms term-list))))))

(define (install-sparse-termlist-package)
  ;; internal procedures
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))

  (define (first-term term-list (car term-list)))

  (define (rest-terms term-list (cdr term-list)))

  ;; interface to the rest of the system
  (define (tag t) (attach-tag 'sparse t))
  (define (tag-term t) (attach-tag 'term t))
  (put 'make 'sparse (tag '()))
  (put 'empty-termlist? 'sparse
    (lambda (term-list) (null? term-list)))
  (put 'adjoin-term '(term sparse)
    (lambda (term term-list) (tag (adjoin-term term term-list))))
  (put 'first-term '(sparse)
    (lambda (term-list) (tag-term (first-term term-list))))
  (put 'rest-terms '(sparse)
    (lambda (term-list) (tag (rest-terms term-list)))))

;; let's also define term as a package
(define (install-term-package)
  ;; internal procedures
  (define (make-term order coeff) (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))

  ;; interface to the rest of the system
  (define (tag t) (attach-tag 'term t))
  (put 'make 'term
    (lambda (order coeff) (tag (make-term order coeff))))
  (put 'order '(term) order)
  (put 'coeff '(term) coeff))

;; now we define the generic procedures for these operations
(define (adjoin-term term term-list)
  (apply-generic 'adjoin-term term term-list))

(define (first-term term-list)
  (apply-generic 'first-term term-list))

(define (rest-terms term-list)
  (apply-generic 'rest-terms term-list))

(define (the-dense-empty-termlist)
  (get 'make 'dense))

(define (the-sparse-empty-termlist)
  (get 'make 'sparse))

(define (empty-termlist? term-list)
  (apply-generic 'empty-termlist? term-list))

(define (make-term order coeff)
  ((get 'make 'term) order coeff))

(define (order term)
  (apply-generic 'order term))

(define (coeff term)
  (apply-generic 'coeff term))

;; notice that now we have to change all the-empty-termlist procedure in
;; the polynomial package to a specific representation of empty termlist
