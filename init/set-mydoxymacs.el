; สนำร doxymacs
(provide 'set-mydoxymacs)

(add-to-list 'load-path  doxymacs-dir)

(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
