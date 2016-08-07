;;;; Answer to exercise 3.70

;; merge-weighted
(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2)))
           (if (< (weight s1car) (weight s2car))
               (cons-stream s1car
                            (merge-weighted (stream-cdr s1) s2 weight))
               (cons-stream s2car
                            (merge-weighted s1 (stream-cdr s2) weight)))))))

;; weighted-pairs
(define (weighted-pairs s1 s2 weight)
    (cons-stream (list (stream-car s1)
                       (stream-car s2))
                 (merge-weighted (stream-map (lambda (x) (list (stream-car s1) x))
                                             (stream-cdr s2))
                                 (weighted-pairs (stream-cdr s1)
                                                 (stream-cdr s2)
                                                 weight)
                                 weight)))

;; a
(define (sum-of-pair pair)
  (+ (car pair) (cadr pair)))

(define a
  (weighted-pairs integers integers sum-of-pair))

;; b
(define (divisible-2-3-5? pair)
  (let ((x (car pair))
        (y (cadr pair)))
    (not (or (divisible? 2 x)
             (divisible? 3 x)
             (divisible? 5 x)
             (divisible? 2 y)
             (divisible? 3 y)
             (divisible? 5 y)))))

(define (sum-i-j-ij pair)
  (let ((x (car pair))
        (y (cadr pair)))
    (+ (* 2 x)
       (* 3 y)
       (* 5 x y))))

(define b
  (stream-filter divisible-2-3-5?
                 (weighted-pairs integers integers sum-i-j-ij)))
