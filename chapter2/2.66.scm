;;;; Answer to exercise 2.66

;; lookup for binary tree
(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((< given-key (key (entry set-of-records)))
         (lookup given-key (left-branch set-of-records)))
        ((> given-key (key (entry set-of-records)))
         (lookup given-key (right-branch set-of-records)))
        (else
         (entry (set-of-records)))))
