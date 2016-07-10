;;;; Answer to exercise 2.47

;; selectors based on definition 1
(define (origin-frame-1 frame)
  (car frame))

(define (edge1-frame-1 frame)
  (cadr frame))

(define (edge2-frame-1 frame)
  (caddr frame))

;; selectors based on definition 2
(define (origin-frame-2 frame)
  (car frame))

(define (edge1-frame-2 frame)
  (cadr frame))

(define (edge2-frame-2 frame)
  (cddr frame))
