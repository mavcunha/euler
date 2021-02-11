(defn fib [n]
  (condp = n
    0 1
    1 1
    (+ (fib (- n 1)) (fib (- n 2)))))

(print
  (reduce +
     (filter even?
         (take-while #(< % 4000000)
            (map fib (iterate inc 1))))))
