(provide 'set-mylisp)

(setq slime-lisp-implementations
      '((clisp ("D:/dev/clisp-2.48/clisp.exe"))
	(sbcl ("D:/dev/sbcl/sbcl.exe"
	       "--core" "D:/dev/sbcl/sbcl.core")
	      :coding-system utf-8-unix)
	))
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
(setq slime-default-lisp 'sbcl)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
