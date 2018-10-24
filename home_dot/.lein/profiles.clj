{:user {:dependencies [[cljfmt "0.5.7"]
                       [cider/orchard "0.3.0"]
                       [nrepl "0.4.5"]
                       [iced-nrepl "0.2.2"]
                       [cider/cider-nrepl "0.18.0"]
                       [jonase/eastwood "0.2.9"
                        :exclusions [org.clojure/clojure]]]
        :plugins [[jonase/eastwood "0.2.9"]
                  [refactor-nrepl "2.4.0"]]
        :repl-options {:nrepl-middleware [cider.nrepl/wrap-complete
                                          cider.nrepl/wrap-debug
                                          cider.nrepl/wrap-format
                                          cider.nrepl/wrap-info
                                          cider.nrepl/wrap-macroexpand
                                          cider.nrepl/wrap-ns
                                          cider.nrepl/wrap-out
                                          cider.nrepl/wrap-pprint
                                          cider.nrepl/wrap-pprint-fn
                                          cider.nrepl/wrap-spec
                                          cider.nrepl/wrap-test
                                          cider.nrepl/wrap-trace
                                          cider.nrepl/wrap-undef
                                          iced.nrepl/wrap-iced]}}}
