(provide 'set-mylisp)

(setq slime-lisp-implementations
      '((clisp ("D:/dev/clisp-2.48/clisp.exe"))
	(sbcl ("d:/dev/sbcl/1.1.4.0.mswin.1288-90ab477/sbcl.exe") :coding-system utf-8-unix)
	))

(require 'slime-autoloads)
(slime-setup '(slime-fancy))
