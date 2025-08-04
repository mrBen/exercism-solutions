(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (def production (float (* speed 221)))
  (cond (= speed 10) (* production 0.77)
        (= speed 9) (* production 0.8)
        (> speed 4) (* production 0.9)
        :else production)
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60))
  )
