;;;; Answer to exercise 3.54

;; mul-streams
(define (mul-streams s1 s2)
  (stream-map * s1 s2))

;; stream of factorials
(define factorials (cons-stream 1 (mul-streams factorials
                                               (stream-cdr factorials))))
