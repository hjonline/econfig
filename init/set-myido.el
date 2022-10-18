(provide 'set-myido)

(setq ido-auto-merge-delay-time 99999999)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)          
(setq ido-create-new-buffer 'always)

(ido-mode 1)

;(require 'flx-ido)
;(flx-ido-mode 1)
;(require 'ido-vertical-mode)
;(ido-vertical-mode 1)
;(require 'ido-hacks)
;(ido-hacks-mode 1)

;(require 'ido-completing-read+)
;(ido-ubiquitous-mode 1)

(defadvice ido-switch-buffer (around no-confirmation activate)
  (let ((confirm-nonexistent-file-or-buffer nil))
    ad-do-it))
