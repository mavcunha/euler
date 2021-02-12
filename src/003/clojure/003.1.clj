(def target 13195)
(def target-sqrt (Math/sqrt target))

;; Turner Sieve with recursion
;; will overflow for the problem
;; target 600851475143
(defn turner-sieve [s]
  (cons (first s)
      (lazy-seq (turner-sieve (filter #(not= 0 (mod % (first s))) (rest s))))))

(print
  (apply max
         (filter #(= 0 (mod target %))
                 (take-while #(< % target-sqrt) (turner-sieve (iterate inc 2))))))
