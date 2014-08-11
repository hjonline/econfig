(provide 'mynewlisp)

;;newlisp  
(require 'newlisp-mode)  
(add-to-list 'auto-mode-alist '("\\.lsp$" . newlisp-mode))  

    ;;;; Things that might make life easier:  

;; Make Emacs' "speedbar" recognize newlisp files  
(eval-after-load "speedbar" '(speedbar-add-supported-extension ".lsp"))  

;; Another way to use C-x C-e to eval stuff and doesn't jump to next function  
(define-key newlisp-mode-map [(control x) (control e)] 'newlisp-evaluate-prev-sexp)  

;; I think I got tired of typing 'newlisp-show-interpreter' all the time.  
(defun start-newlisp ()  
  "Starts newlisp interpreter/or shows if already running.  Requires newlisp-mode to be loaded."  
  (interactive)  
  (newlisp-show-interpreter))  
