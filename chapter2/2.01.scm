;;;; Answer to exercise 2.1

;; Helper procedure
(define (print-rat x)
  (newline)
  (display (car x))
  (display "/")
  (display (cdr x)))

;; make-rat
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< (* n d) 0)
        (cons (- (abs (/ n g))) (abs (/ d g)))
        (cons (abs (/ n g)) (abs (/ d g))))))
