;; waratuman.el

;; Erlang
(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.6.5/emacs")
(setq erlang-root-dir "/usr/local/lib/erlang/lib")
(add-to-list 'exec-path "/usr/local/lib/erlang/bin")
(require 'erlang-start)

;; Swank clojure
(custom-set-variables
 '(swank-clojure-extra-vm-args '("-server" "-Xmx1024M" "-XX:+UseCompressedOops" "-XX:+UseConcMarkSweepGC")))
