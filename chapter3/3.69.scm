;;;; Answer to exercise 3.69

;; triples
(define (triples s t u)
  (cons-stream (list (stream-car s)
                     (stream-car t)
                     (stream-car u))
               (interleave (stream-map (lambda (x) (cons (stream-car s) x))
                                       (stream-cdr (pairs t u)))
                           (triples (stream-cdr s)
                                    (stream-cdr t)
                                    (stream-cdr u)))))

;; all pythagorean triples
(define pythagorean-triples
  (stream-filter (lambda (stu) (= (square (caddr stu))
                                  (+ (square (car stu))
                                     (square (cadr stu)))))
                 (triples integers integers integers)))
