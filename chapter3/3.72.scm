;;;; Answer to exercise 3.71

;; ramanujan numbers

(define (gen-ramanujan-numbers)
  ;; weight procedure
  (define (sum-of-square pair)
    (+ (square (car pair))
       (sqaure (cadr pair))))
  ;; ordered stream
  (define ordered-stream-sum-of-square
    (weighted-pairs integers integers sum-of-square))
  ;; find ramanujan-numers
  (define (iter s)
    (let ((first (stream-ref s 0))
          (second (stream-ref s 1))
          (third (stream-ref s 2)))
      (if (= (sum-of-square first) (sum-of-square second) (sum-of-square third))
          (cons-stream (list (sum-of-square first) first second third)
                       (iter (stream-cdr (stream-cdr (stream-cdr s)))))
          (iter (stream-cdr s)))))
  (iter ordered-stream-sum-of-square))

;; the next five numbers are 4104, 13832, 20683, 32832, and 39312
