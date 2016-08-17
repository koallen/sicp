;;;; Answer to exercise 3.76

(define (smooth input-stream)
  (stream-map (lambda (s1 s2) (/ (+ s1 s2) 2))
              (cons-stream 0 input-stream)
              input-stream))

(define zero-crossings
  (stream-map sign-change-detector (smooth sense-data) (cons-stream 0 (smooth sense-data))))
