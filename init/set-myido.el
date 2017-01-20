(provide 'set-myido)

(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)          
(setq ido-create-new-buffer 'always)

(ido-mode 1)

(defadvice ido-switch-buffer (around no-confirmation activate)
  (let ((confirm-nonexistent-file-or-buffer nil))
    ad-do-it))
