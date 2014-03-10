;; …Ë÷√ php ±‡º≠ƒ£ Ω
(provide 'set-php-mode)

(add-to-list 'load-path (expand-file-name "D:/dev/Emacs/EmacsW32/nxhtml/related/"))
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))