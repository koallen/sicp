;;;; Answer to exercise 2.3

;; rectangle constructor and selector
;; it's assumed that the rectangle side is parallel to the major axis
(define (make-rectangle bottom-left top-right)
  (cons bottom-left top-right))

(define (width-rectangle rectangle)
  (let ((x1 (x-point (car rectangle)))
        (x2 (x-point (cdr rectangle))))
    (- x2 x1)))

(define (height-rectangle rectangle)
  (let ((y1 (y-point (car rectangle)))
        (y2 (y-point (cdr rectangle))))
    (- y2 y1)))

;; alternative representation
(define (makr-rectangle-2 bottom-left width height)
  (cons bottom-left (cons width height)))

(define (width-rectangle-2 rectangle)
  (car (cdr rectangle)))

(define (height-rectangle-2 rectangle)
  (cdr (cdr rectangle)))

;; perimeter and area
(define (perimeter rectangle)
  (* 2 (+ (width-rectangle rectangle)
          (height-rectangle rectangle))))

(define (area rectangle)
  (* (width-rectangle rectangle)
     (height-rectangle rectangle)))

;; point constructor and selector
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))
