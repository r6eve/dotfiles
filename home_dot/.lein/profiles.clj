{:user {:dependencies [[cljfmt "0.6.3"]
                       [com.clojure-goes-fast/clj-async-profiler "0.3.0"]
                       [criterium "0.4.4"]
                       [jonase/eastwood "0.3.3"
                        :exclusions [org.clojure/clojure]]]
        :plugins [[jonase/eastwood "0.3.3"]
                  [lein-ancient "0.6.15"]
                  [lein-bikeshed "0.5.1"]
                  [lein-cloverage "1.0.13"]
                  [lein-codox "0.10.6"]
                  [lein-kibit "0.1.6"]
                  [lein-pprint "1.2.0"]
                  [lein-typed "0.4.6"]]}}
