;;;; Answer to exercise 3.23

;; implementation of deque
(define (make-deque) (cons '() '()))

(define (front-ptr deque) (car deque))

(define (rear-ptr deque) (cdr deque))

(define (set-front-ptr! deque item) (set-car! deque item))

(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (empty-deque? deque) (null? (front-ptr deque)))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with an empty deque" deque)
      (car (front-ptr deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with an empty deque" deque)
      (car (rear-ptr deque))))

(define (front-insert-deque! deque item)
  (let ((new-pair (cons (cons item '()) '())))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair))
          (else
           (set-cdr! new-pair (front-ptr deque))
           (set-cdr! (car (front-ptr deque)) new-pair)
           (set-front-ptr! deque new-pair)))))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons (cons item '()) '())))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair))
          (else
           (set-cdr! (rear-ptr deque) new-pair)
           (set-cdr! (car new-pair) (rear-ptr deque))
           (set-rear-ptr! deque new-pair)))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        (else
         (set-front-ptr! deque (cdr (front-ptr deque)))
         (if (not (empty-deque? deque))
             (set-cdr! (car (front-ptr deque)) '())
             (set-rear-ptr! '())))))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        (else
         (set-rear-ptr! deque (cdar (reat-ptr deque)))
         (if (null? (rear-ptr deque))
             (set-front-ptr! '())
             (set-cdr! (rear-ptr deque) '())))))

(define (print-deque deque)
  (define (iter queue)
    (if (null? queue)
        0
        (begin (display (caar queue))
               (if (not (null? (cdr queue)))
                   (display " "))
               (iter (cdr queue)))))
  (display "(")
  (iter (front-ptr deque))
  (display ")")
  (newline))
