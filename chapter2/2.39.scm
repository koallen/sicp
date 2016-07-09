;;;; Answer to exercise 2.39

;; reverse with fold-right
(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

;; reverse with fold-left
(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
