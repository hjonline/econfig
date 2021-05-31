;; 这里是有关自动补全的设置
(provide 'set-myautocomplete)

; 使用 autocomplete
(require 'auto-complete-config)
(ac-config-default)

; 使用 yasnippet
(require 'yasnippet) ;; not yasnippet-bundle
(setq my-custom-yas-snippet-dirs (concat econfig-dir "/snippets"))
;(setq yas-snippet-dirs '(my-custom-yas-snippet-dirs yas-installed-snippets-dir))
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

(setenv "PATH"
        (concat
         "D:\\dev\\msys64\\usr\\bin" ";"
         "D:\\dev\\msys64\\mingw64\\bin" ";"
         (getenv "PATH")
         )
	)
(setq exec-path (append '("d:/dev/msys64/usr/bin" "d:/dev/msys64/mingw64/bin")
                        exec-path))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; Windows performance tweaks

(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
;; Set the buffer size to 64K on Windows (from the original 4K)
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))


;; (require 'ycmd)
;; (setq ycmd-startup-timeout 15)
;; (add-hook 'c-mode-hook 'ycmd-mode)
;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; ;;路径就是你自己的ycmd的路径
;; (set-variable 'ycmd-server-command 
;; 	      '("d:/dev/python27/python.exe" "d:/dev/ycmd/ycmd"))
;; (set-variable 'ycmd-global-config "d:/HOME/.ycm_extra_conf.py")

;; (require 'company-ycmd)
;; (company-ycmd-setup)
;; (provide 'init-ycmd)
