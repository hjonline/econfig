;; ���� w3m
(provide 'set-w3m)


(add-to-list 'exec-path "D:/cygwin/bin/")
(add-to-list 'load-path  "~/lisp/emacs-w3m")
(require 'w3m-load)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
; �� w3m ��ʾ����ͼƬ
(setq w3m-default-display-inline-images t)