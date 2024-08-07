;; 这里是有关自动补全的设置
(provide 'set-myautocomplete)

; 使用 autocomplete
;(require 'auto-complete-config)
;(ac-config-default)

					; 使用 yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)

; 在 org-mode 中使用 yasnippet
(defun yas-org-very-safe-expand ()
  (let ((yas-fallback-behavior 'return-nil)) (yas-expand)))

(add-hook 'org-mode-hook
	  (lambda ()
	    (make-variable-buffer-local 'yas-trigger-key)
	    (setq yas-trigger-key [tab])
	    (add-to-list 'org-tab-first-hook 'yas-org-very-safe-expand)
	    (define-key yas-keymap [tab] 'yas-next-field)))

					; 使用 eglot 和 clangd
;; (require 'eglot)
;; (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)

;; 设置代码风格
(c-add-style "my-style"
  '("stroustrup"
     (indent-tabs-mode . nil)        ; 使用空格缩进而不是 Tab
     (c-basic-offset . 4)            ; 使用四个空格缩进
     (c-offsets-alist . ((inline-open . 0)
        (brace-list-open . 0)
        (statement-case-open . +)))))
(defun my-c++-mode-hook ()
  (c-set-style "my-style")        ; use my-style defined above
  (auto-fill-mode)
  (c-toggle-auto-hungry-state 1))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)

;; (setenv "PATH"
;;         (concat
;;          "D:\\dev\\msys64\\usr\\bin" ";"
;;          "D:\\dev\\msys64\\mingw64\\bin" ";"
;;          (getenv "PATH")
;;          )
;; 	)
;; (setq exec-path (append '("d:/dev/msys64/usr/bin" "d:/dev/msys64/mingw64/bin")
;;                         exec-path))

;; 启动 company 模式
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'objc-mode-hook 'company-mode)
;; perl 的 company 后端 plsense 不能安装在 windows 
;; 项目地址 https://github.com/CeleritasCelery/company-plsense
;; 讨论帖  https://emacs.stackexchange.com/questions/35514/are-there-any-perl-options-for-company-mode
;; 讨论帖  https://www.reddit.com/r/emacs/comments/71yeao/company_backend_for_perl/
; (add-to-list 'company-backends 'company-plsense)
; (add-hook 'perl-mode-hook 'company-mode)
; (add-hook 'cperl-mode-hook 'company-mode)  ; 如果你使用cperl-mode
; (setq company-idle-delay 0.1)  ; 补全触发前的延迟
; (setq company-minimum-prefix-length 2)  ; 触发补全的最小字符数

;; 使用 cperl 模式
(fset 'perl-mode 'cperl-mode)
;; By default cperl-mode replaces trailing whitespace with underscores.  
;; You can automatically delete this with whitespace-cleanup-mode,
;; or you can use this elisp:  
(setq cperl-invalid-face nil)
;; You probably want multi-line statements wrapped in parens to be indented like a block.
(setq cperl-indent-parens-as-block t)
(setq cperl-indent-level 2)
(setq cperl-close-paren-offset (- cperl-indent-level))

(require 'flycheck)
;;(add-hook 'after-init-hook #'global-flycheck-mode)
;; 让 flycheck 支持 C++11
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++11")))
;; 在 C 和 C++ 模式下打开 flycheck
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)

;; 配置 irony 模式
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(defun my-irony-mode-hook ()
 (define-key irony-mode-map [remap completion-at-point]
   'irony-completion-at-point-async)
 (define-key irony-mode-map [remap complete-symbol]
   'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(require 'company-irony)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))
(require 'company-irony-c-headers)
(eval-after-load 'company
 '(add-to-list
   'company-backends '(company-irony-c-headers company-irony)))
(setq company-idle-delay              t
     company-minimum-prefix-length   2
     company-show-numbers            t
     company-tooltip-limit           20
     company-dabbrev-downcase        nil)
(require 'flycheck-irony)
(eval-after-load 'flycheck
 '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(setq irony-additional-clang-options '("-std=c++11"
                      "-ID:/dev/temp/Cpp-Demo-Project-For-Emacs-master/Cpp-Demo-Project-For-Emacs-master/my_inc"
				   ))
