;;;; Answer to exercise 3.8

(define f
  (let ((evaluated #f))
    (lambda (x)
      (if evaluated
          0
          (begin (set! evaluated #t)
                 x)))))
