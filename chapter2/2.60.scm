;;;; Answer to exercise 2.60

;; element-of-set?
;; this is the same for both representations, thus grows O(n)
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

;; adjoin-set
;; this is reduced to O(1)
(define (adjoin-set x set)
  (cons x set))

;; union-set
;; this is reduced to O(n) because it uses append
(define (union-set set1 set2)
  (append set1 set2))

;; intersection-set
;; this is the same for both representations, thus grows O(n^2)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
