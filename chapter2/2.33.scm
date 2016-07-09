;;;; Answer to exercise 2.33

;; the accumulate procedure
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; map
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

;; append
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

;; length
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
