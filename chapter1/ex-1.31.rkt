#lang planet neil/sicp
;π近似值由英国数学家John Wallis发现
;2.23会用到累积和过滤器去建造更强大的抽象
;写出类似于product过程，返回给定范围中各个函数值的乘积

;递归计算过程

(define (product term a next b)
  (if (> a b) 1
      (* (term a) (product term (next a) next b))))

 ;阶乘的定义
 (define (identity x) x) 
  
 (define (next x) (+ x 1)) 
  
 (define (factorial n) 
 (product identity 1 next n)) 

;π的计算
 (define (pi-term n) 
   (if (even? n) 
       (/ (+ n 2) (+ n 1)) 
       (/ (+ n 1) (+ n 2)))) 
 (* (product pi-term 1 next 6) 4)   ;;= 3.3436734693877552 
 (* (product pi-term 1 next 100) 4) ;;= 3.1570301764551676



;迭代计算过程

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result)
    (iter (next a) (* result (term a)))))











