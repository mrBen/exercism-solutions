(ns matching-brackets)

(defn valid? [s]
  (loop [[h & t :as s] s
         stack []]
    (cond (empty? s) (empty? stack)
          (= h \[) (recur t (cons h stack))
          (= h \{) (recur t (cons h stack))
          (= h \() (recur t (cons h stack))
          (= h \]) (and (= (first stack) \[) (recur t (rest stack)))
          (= h \}) (and (= (first stack) \{) (recur t (rest stack)))
          (= h \)) (and (= (first stack) \() (recur t (rest stack)))
          :else (recur t stack)))
)
