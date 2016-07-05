;;;; Answer to exercise 1.29

;; Define helper procedures
(define (cube x)
  (* x x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (inc x)
  (+ x 1))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (+ (term a) result))))
  (iter a 0))

;; Define procedure that uses Simpson's Rule to approximate integral
(define (simpson-integral f a b n)
  ;; Compute h
  (define h (/ (- b a) n))
  ;; Compute term
  (define (s-term k)
    (define coeff (cond ((or (= k 0) (= k n)) 1)
                        ((even? k) 2)
                        (else 4)))
    (define y (f (+ a (* k h))))
    ;; Compute a single term
    (* coeff y))
  (/ (* h (sum s-term 0 inc n)) 3))

;; The results are closer to 0.25 compared to the method given in the book
;; (simpson-integral cube 0 1.0 100) => .24999999999999992
;; (simpson-integral cube 0 1.0 1000) => .2500000000000003
