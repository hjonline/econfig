; pgp º”√‹
(provide 'set-encrypt)

(require 'epa-file) (epa-file-enable) 

(define-key minibuffer-local-map [f3]
(lambda() (interactive) (insert (buffer-file-name (nth 1 (buffer-list))))))
