#lang planet neil/sicp
;求出函数f在范围a和b之间的定积分
;具体公式不会打原书P39
;integral 积分

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a )
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
       dx))

;(integral cube 0 1 0.001)

;辛普森规则是更精确的数值积分方法

(define (inc n) (+ n 1))
(define (fa x) (+ (* x x 3) (* 2 x x x)))
(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (simpson-term k)
    (* (cond ((or (= k 0) (= k n)) 1)
              ((odd? k) 4)
              (else 2))
       (yk k)))
  (* (/ h 3) (sum simpson-term 0 inc n)))

(simpson-integral fa 0 1 100)
(simpson-integral fa 0 1 1000)

