(def target 999)
(defn- sumDivisibleBy [n]
  (let [p (Math/floor (/ target n))]
    (/ (* n (* p (+ 1 p))) 2) ))

(print (- (+ (sumDivisibleBy 3) (sumDivisibleBy 5)) (sumDivisibleBy 15)))
