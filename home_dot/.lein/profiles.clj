{:user {:dependencies [[cljfmt "0.6.6"]
                       [com.clojure-goes-fast/clj-async-profiler "0.4.0"]
                       [criterium "0.4.5"]
                       [jonase/eastwood "0.3.6"
                        :exclusions [org.clojure/clojure]]]
        :plugins [[com.clojure-goes-fast/clj-java-decompiler "0.3.0-SNAPSHOT"]
                  [jonase/eastwood "0.3.7"]
                  [lein-ancient "0.6.15"]
                  [lein-bikeshed "0.5.2"]
                  [lein-cloverage "1.1.2"]
                  [lein-codox "0.10.7"]
                  [lein-kibit "0.1.8"]
                  [lein-pprint "1.2.0"]
                  [lein-typed "0.4.6"]]
        :eastwood {:linters [:all]}}}
