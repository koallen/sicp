;;;; Answer to exercise 2.51

;; below
(define (below-1 painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-below
            (transform-painter painter1
                               (make-vect 0.0 0.0)
                               split-point
                               (make-vect 1.0 0.0)))
          (paint-above
            (transform-painter painter2
                               split-point
                               (make-vect 0.0 1.0)
                               (make-vect 1.0 0.0))))
      (lambda (frame)
        (paint-above frame)
        (paint-below frame)))))

;; alternative definition
(define (below-2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))
