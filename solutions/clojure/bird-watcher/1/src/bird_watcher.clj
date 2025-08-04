(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4]
  )

(defn today [birds]
  (peek birds)
  )

(defn inc-bird [birds]
  (assoc birds 6 (+ (today birds) 1))
  )

(defn day-without-birds? [birds]
  (cond (empty? birds) false
        :else (or (= (first birds) 0)
                   (day-without-birds? (rest birds))))              
  )

(defn n-days-count [birds n]
  (cond (= n 0) 0
        :else (+ (first birds) (n-days-count (rest birds) (- n 1))))
  )

(defn busy-days [birds]
  (cond (empty? birds) 0
        :else (+ (busy-days (rest birds))
                 (cond (>= (first birds) 5) 1 
                       :else 0)))
  )

(defn odd-week? [birds]
  (= birds [1 0 1 0 1 0 1])
  )
