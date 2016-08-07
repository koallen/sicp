;;;; Answer to exercise 3.64

;; stream-limit
(define (stream-limit s limit)
  (let ((s1 (stream-ref s 0))
        (s2 (stream-ref s 1)))
    (if (< (abs (- scar scadr)) limit)
        s2
        (stream-limit (stream-cdr s) limit))))
