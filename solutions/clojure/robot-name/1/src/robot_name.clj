(ns robot-name
  (:require clojure.set
            clojure.string))

(def names (atom #{}))

(defn new-name []
  (clojure.string/join "" [(char (+ (rand-int 26) 65))
                           (char (+ (rand-int 26) 65))
                           (format "%03d" (rand-int 1000))]))

(defn robot []
  (let [name
        (loop [n (new-name)]
          (if (= n (some #{n} @names))
            (recur (new-name))
            n))]
    (swap! names (clojure.set/union #{name}))
    (atom name)))

(defn robot-name [robot]
  @robot)

(defn reset-name [robot]
  (swap! robot (fn [_] (new-name))))
