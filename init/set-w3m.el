;; 设置 w3m
(provide 'set-w3m)


(add-to-list 'exec-path "D:/cygwin/bin/")
(add-to-list 'load-path  "~/lisp/emacs-w3m")
(require 'w3m-load)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
; 让 w3m 显示在线图片
(setq w3m-default-display-inline-images t)