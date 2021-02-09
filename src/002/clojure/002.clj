(defn fib [n]
  (condp = n
    0 1
    1 1
    (+ (fib (- n 1)) (fib (- n 2)))))

(def MAXFIB 4000000)
(print
  (reduce +
     (filter even?
         (take-while #(< % MAXFIB)
            (map fib (iterate inc 1))))))
