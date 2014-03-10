;; 这里是有关 bbdb 的设置
(provide 'set-mybbdb)

; 设置要加载的路径
(setq load-path (cons "~/lisp/bbdb/lisp" load-path))

; BBDB
(require 'bbdb)
(bbdb-initialize)
