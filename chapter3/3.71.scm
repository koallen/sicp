;;;; Answer to exercise 3.71

;; ramanujan numbers

(define (gen-ramanujan-numbers)
  ;; weight procedure
  (define (sum-of-cube pair)
    (define (cube x) (* x x x))
    (+ (cube (car pair))
       (cube (cadr pair))))
  ;; ordered stream
  (define ordered-stream-sum-of-cube
    (weighted-pairs integers integers sum-of-cube))
  ;; find ramanujan-numers
  (define (iter s)
    (let ((first (stream-ref s 0))
          (second (stream-ref s 1)))
      (if (= (sum-of-cube first) (sum-of-cube second))
          (cons-stream (sum-of-cube first)
                       (iter (stream-cdr (stream-cdr s))))
          (iter (stream-cdr s)))))
  (iter ordered-stream-sum-of-cube))

;; the next five numbers are 4104, 13832, 20683, 32832, and 39312
