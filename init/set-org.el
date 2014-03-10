; org ģʽ
(provide 'set-org)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; turn on soft wrapping mode for org mode
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))

(setq org-agenda-files (list "~/org/midterm.org"))