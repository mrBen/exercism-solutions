(ns difference-of-squares)

(defn sum-of-squares [n]
  (cond (= n 1) 1
        :else (+ (sum-of-squares (- n 1)) (* n n)))
)

(defn sum-to [n]
  (cond (= n 1) 1
        :else (+ (sum-to (- n 1)) n))  
)

(defn square-of-sum [n]
  (* (sum-to n) (sum-to n))
)

(defn difference [n]
  (- (square-of-sum n) (sum-of-squares n))
)
