;;;; Answer to exercise 1.31

;; Helper procedure
(define (inc x)
  (+ x 1))

(define (identity x)
  x)

(define (wallis-term x)
  (if (even? x)
      (/ (+ x 2) (+ x 1))
      (/ (+ x 1) (+ x 2))))

;; A recursive version of the product procedure
(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))

;; An iterative version of the product procedure
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* result (term a)))))
  (iter a 1))

;; Factorial procedure
(define (factorial n)
  (product-iterative identity 1 inc n))

;; Pi approximation procedure
(define (pi-wallis n)
  (* 4.0 (product-iterative wallis-term 1 inc n)))
