;;;; Answer to exercise 3.67

;; modified pairs procedure
(define (pairs s t)
  (cons-stream
    (list (stream-car s) (stream-car t))
    (interleave (stream-map (lambda (x) (list (stream-car s) x))
                            (stream-cdr t))
                (interleave (stream-map (lambda (x) (list (stream-car t) x))
                                        (stream-cdr s))
                            (pairs (stream-cdr s) (stream-cdr t))))))
