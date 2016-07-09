;;;; Answer to exercise 2.37

;; the accumulate procedure
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; accumulate for trees
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

;; matrix * vector
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

;; transpose
(define (transpose mat)
  (accumulate-n cons '() mat))

;; matrix * matrix
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))
