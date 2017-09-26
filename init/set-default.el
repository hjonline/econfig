;; 设置基本的选项
(provide 'set-default)

; 设置窗口大小
;; (setq default-frame-alist
      ;; '((height . 39) (width . 158)))

; 设置语言环境
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)  
(setq ansi-color-for-comint-mode t)
(modify-coding-system-alist 'process "*" 'utf-8)  
(setq-default pathname-coding-system 'utf-8)  
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq file-name-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)  
(setq slime-net-coding-system 'utf-8-unix)

; 设置打开文件的缺省路径
(setq default-directory "~/")
(setq user-emacs-directory dotemacs-dir)
(delete-directory "~/.emacs.d")

; 让 echo-buffer 不要截断输出
(setq eval-expression-print-length nil)

; 与 common lisp 兼容
(require 'cl)

; scratch blank
(setq initial-scratch-message "")

;;时间显示设置
;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）
(display-time-mode 1)
;;时间使用24小时制
;(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)

;;显示默认的文档的宽度，看起来比较舒服？
(setq default-fill-column 60)
;;指针不要闪，我的眼睛花了
(blink-cursor-mode -1)
(transient-mark-mode 1)
;;当指针到一个括号时，自动显示所匹配的另一个括号
(show-paren-mode 1)
;;去掉Emacs和gnus启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

; 不产生备份文件
(setq make-backup-files nil)

; 禁止开机画面
(setq inhibit-splash-screen t)

; 一打开就启用text模式
(setq default-major-mode 'text-mode)
(setq initial-major-mode 'text-mode)

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no
(fset 'yes-or-no-p 'y-or-n-p)

; 可以递归地删除目录
(setq dired-recursive-deletes t)

; 可以递归地进行目录拷贝
(setq dired-recursive-copies t)

;;backup setting
(setq make-backup-files nil)
(setq
 backup-by-copying t ; don't clobber symlinks
 auto-save-list-file-prefix (concat dotemacs-dir "auto-save-list/.saves-")
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t) ; use versioned backups
 
(add-to-list 'backup-directory-alist
 (cons "." (concat dotemacs-dir "auto-save-list")))   ; don't litter my fs tree


;; ; 日记文件
;; (setq diary-file "~/diary")

;; 加入会话功能
(require 'session)
(setq session-save-file-coding-system 'utf-8-unix)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-save-mode)
(desktop-load-default)
;(desktop-read)

(tool-bar-mode 0) ; 去掉工具栏

;设置地理位置
(setq calendar-latitude 31.01)
(setq calendar-longitude 121.42)
(setq calendar-location-name "Shanghai")

; 重新绑定标记键
(global-set-key (kbd "M-m") 'set-mark-command)

; Linux 下 让 emacs 与 X-Window系统共享剪贴板
(setq x-select-enable-clipboard t) 

(global-linum-mode t)

(set-scroll-bar-mode nil)

; 各窗口间切换 pnbf
(define-key global-map "\C-cp" 'windmove-up)
(define-key global-map "\C-cn" 'windmove-down)
(define-key global-map "\C-cb" 'windmove-left)
(define-key global-map "\C-cf" 'windmove-right)

(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)

; 跳转到指定行，按住 Ctrl 不要放，然后连按 c 和 g 键，再按空格键，最后输入要去的行号。
(define-key global-map "\C-c\C-g " 'goto-line)

; 使用 ibuffer
;(require 'ibuffer)
;(global-set-key (kbd "C-x C-b") 'ibuffer) 

; 使用 ido
;(require 'ido)
;(ido-mode t) 

; 强制 eshell 执行
;(setq eshell-force-execution t)

;; ; 让在 .emacs 中的设置被后面加载的设置继承
;; (setq inhibit-default-init t)

;; ; 不要自动加新行
(add-hook 'text-mode-hook
            '(lambda ()
                (set (make-local-variable 'require-final-newline) nil)))

;; 把 lisp 下面的第一级目录加入 load-path
(let ((base lisp-dir))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; 使用 mozrepl
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'javascript-mode-hook 'javascript-custom-setup)
(defun javascript-custom-setup ()
  (moz-minor-mode 1))

;; 在保存文件时自动创建目录，要用 c-x c-w 才行
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;; 成对的括号自动补全
(electric-pair-mode 1)


; 不要保存字体，以免出现
; Error (frameset): Font ‘tty’ is not defined

(setq desktop-restore-frames nil)
