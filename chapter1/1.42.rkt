#lang planet neil/sicp
(define (compose f g)
  (lambda (x)
    (f (g x))))