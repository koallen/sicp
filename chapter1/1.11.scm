;;;; Answer to exercise 1.11

;; A recursive procedure that computes f
(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
                 (* 2 (f-recursive (- n 2)))
                 (* 3 (f-recursive (- n 3)))))))

;; An iterative procedure that computes f
(define (f-iterative n)
  (f-iter 2 1 0 n))

(define (f-iter a b c n)
  (if (= n 0)
      c
      (f-iter (+ (* 3 c) (* 2 b) a) a b (- n 1))))
