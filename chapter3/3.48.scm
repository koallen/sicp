;;;; Answer to exercise 3.48

;; The reason deadlock happens in such a exchange problem is that two procedures try to acquire
;; the serializers in opposite ways. If we let them acquire serializers in a ordered fashion, then
;; two procedures won't have a conflict in acquiring serializers. Thus, deadlock is avoided.

;; serialized-exchange with deadlock-avoidance
(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer))
        (id1 (account1 'id))
        (id2 (account2 'id)))
    (if (< id1 id2)
        ((serializer2 (serializer1 exchange)) account1 account2)
        ((serializer1 (serializer2 exchange)) account1 account2))))

;; for make-account, we just need to create an id and assign a message for returning the id.
