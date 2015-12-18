;; 这里是有关自动补全的设置
(provide 'set-myautocomplete)

; 使用 autocomplete
(require 'auto-complete-config)
(ac-config-default)

; 使用 yasnippet
(require 'yasnippet) ;; not yasnippet-bundle
(setq my-custom-yas-snippet-dirs (concat econfig-dir "/snippets"))
(setq yas-snippet-dirs '(my-custom-yas-snippet-dirs yas-installed-snippets-dir))
;(yas/load-directory "~/lisp/yasnippet/snippets")
;;(yas/initialize)
(yas-global-mode 1)
(setq yas/indent-line nil)

; 在 org-mode 中使用 yasnippet
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
	  (lambda ()
	    (make-variable-buffer-local 'yas/trigger-key)
	    (setq yas/trigger-key [tab])
	    (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
	    (define-key yas/keymap [tab] 'yas/next-field)))
