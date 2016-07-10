;;;; Answer to exercise 2.49

;; painter a
(define (draw-outline frame)
  (segment->painter (list (make-segment (make-vect 0 0) (make-vect 0 1))
                          (make-segment (make-vect 0 0) (make-vect 1 0))
                          (make-segment (make-vect 0 1) (make-vect 1 1))
                          (make-segment (make-vect 1 0) (make-vect 1 1)))))

;; painter b
(define (draw-x frame)
  (segment->painter (list (make-segment (make-vect 0 0) (make-vect 1 1))
                          (make-segment (make-vect 0 1) (make-vect 1 0)))))

;; painter c
(define (draw-diamond frame)
  (segment->painter (list (make-segment (make-vect 0 0.5) (make-vect 0.5 0))
                          (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
                          (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
                          (make-segment (make-vect 0.5 1) (make-vect 0 0.5)))))

;; painter d is not defined as the shape is too complex
