;;;; Answer to exercise 2.58

;; section a

;; constructor
(define (make-sum a1 a2)
  (list a1 '+ a2))

(define (make-product a1 a2)
  (list a1 '* a2))

;; selectors
(define (addend s)
  (car s))

(define (augend s)
  (caddr s))

(define (multiplier p)
  (car p))

(define (multiplicand p)
  (caddr p))

;; predicates
(define (sum? s)
  (and (pair? s) (eq? '+ (cadr s))))

(define (product? p)
  (and (pair? p) (eq? '* (cadr p))))

;; section b

;; selectors
(define (get-front a b) a)

(define (get-back a b) b)

(define (find-symbol a b c symbol get)
  (if (eq? symbol b)
      (get a c)
      (find-symbol (append a b) (car c) (cdr c) symbol get)))

(define (addend s)
  (find-symbol (car s) (cadr s) (cddr s) '+ get-front))

(define (augend s)
  (find-symbol (car s) (cadr s) (cddr s) '+ get-back))

(define (multiplier p)
  (find-symbol (car p) (cadr p) (cddr p) '* get-front))

(define (multiplicand p)
  (find-symbol (car p) (cadr p) (cddr p) '* get-back))

;; predicates
(define (sum? s)
  (and (pair? s) (eq? '+ (smallest-op s))))

(define (product? p)
  (and (pair? p) (eq? '* (smallest-op p))))

(define (smallest-op e)
  (define (smallest-op-iter current rest)
    (if (null? rest)
        current
        (let ((next (car rest)))
          (if (< (precedence next) (precedence current))
              (smallest-op-iter next (cdr rest))
              (smallest-op-iter current (cdr rest)))))))

(define (precedence symbol)
  (cond ((eq? symbol '+) 0)
        ((eq? symbol '*) 1)
        (else 10000)))
