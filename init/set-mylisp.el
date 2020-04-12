(provide 'set-mylisp)

(setq slime-lisp-implementations
      '((clisp ("D:/dev/clisp-2.48/clisp.exe"))
	(sbcl ("d:/dev/sbcl/sbcl.exe") :coding-system utf-8-unix)
	))

(require 'slime-autoloads)
(slime-setup '(slime-fancy))
