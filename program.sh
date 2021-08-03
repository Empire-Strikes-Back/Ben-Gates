#!/bin/bash

repl(){
  clj \
    -X:repl deps-repl.core/process \
    :main-ns wiki-quest.main \
    :port 7788 \
    :host '"0.0.0.0"' \
    :repl? true \
    :nrepl? false
}

main(){
  clojure \
    -J-Dclojure.core.async.pool-size=1 \
    -J-Dclojure.compiler.direct-linking=false \
    -M -m wiki-quest.main
}

uberjar(){
  clj \
    -X:uberjar genie.core/process \
    :uberjar-name out/wiki-quest.standalone.jar \
    :main-ns wiki-quest.main
  mkdir -p out/jpackage-input
  mv out/wiki-quest.standalone.jar out/jpackage-input/
}

"$@"