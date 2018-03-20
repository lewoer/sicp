#lang planet neil/sicp
(define (denom x) (cdr x))
(define (numer x) (car x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (abs (gcd n d)))))
    (cons (/ n g) (/ d g))))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (abs x)
  (if (< x 0)
      (- 0 x)
      x))
(print-rat (make-rat 6 -9)) 