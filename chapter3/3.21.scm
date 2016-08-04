;;;; Answer to exercise 3.21

;; What Lisp printed is the representation of the queue, which is the content of the front pointer 
;; and the rear pointer. That's why the last item appears twice.

;; print-queue
(define (print-queue q)
  (define (iter x)
    (if (null? x)
        (newline)
        (begin (display (car x))
               (iter (cdr x)))))
  (iter (front-ptr q)))
