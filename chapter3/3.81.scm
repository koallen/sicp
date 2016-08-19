;;;; Answer to exercise 3.81

(define (generate-random-number command-stream)
  (define (inner command-stream current-value)
    (cond ((stream-null? command-stream)
           the-empty-stream)
          ((and (pair? (stream-car command-stream))
                (eq? (car (stream-car command-stream)) 'reset))
           (cons-stream (cdr (stream-car command-stream))
                        (inner (stream-cdr command-stream) (cdr (stream-car command-stream)))))
          ((eq? (stream-car command-stream) 'generate)
           (let ((new-value (rand-update current-value)))
             (cons-stream new-value
                          (inner (stream-cdr command-stream) new-value))))))
  (inner command-stream random-init))
