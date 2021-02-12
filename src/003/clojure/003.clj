(def target 600851475143)
(def target-sqrt (Math/sqrt target))

(def certainty 5)
(defn prime? [n]
      (.isProbablePrime (BigInteger/valueOf n) certainty))

(def primes
  (concat [2]
          (filter prime?
                  (take-nth 2 (range 1 Integer/MAX_VALUE)))))

(print
  (apply max
         (filter #(= 0 (mod target %))
                 (take-while #(< % target-sqrt) primes))))
