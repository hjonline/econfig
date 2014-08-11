;; 这里是有关在 dired 模式下打开文件时关联的设置
(provide 'set-mydired)

;; 这句放在这里是让 emacs 有执行的时间，否则 dired-mode-map 会出错
(require 'dired-details+)

;; 在模式行显示完整路径
(add-hook 'dired-mode-hook 
	  (lambda ()
	    ;; TODO: handle (DIRECTORY FILE ...) list value for dired-directory
	    (setq mode-line-buffer-identification
		  ;; emulate "%17b" (see dired-mode):
		  '(:eval (propertized-buffer-identification 
			   (if (< (length default-directory) 17) 
			       (concat default-directory (make-string (- 17 (length
									     default-directory))
								      ?\s))
			     default-directory))))))

;; 打开自动压缩模式
(auto-compression-mode 1)

;; 让 dired 只用一个 buffer
(eval-after-load 
    'dired 
  '(progn 
     (require 'joseph-single-dired)))

;; 使用 dired
(require 'dired-x)

;; 跳转到当前 buffer 所对应的文件的目录
(define-key global-map (kbd "C-x C-j") 'dired-jump)
(define-key global-map (kbd "C-x 4 C-j") 'dired-jump-other-window)

;; 只显示文件名，用小括号控制
(require 'dired-details)
(dired-details-install)

;; 设置 ftp
(require 'tramp)
(setq tramp-default-method "ftp")
(if (eq system-type 'windows-nt) 
    (setq ange-ftp-ftp-program-name tramp-win-exe))

;; ;; 多文件查找
;; ;; 执行 moccur-grep
;; ;; 先输入目录，然后再输入查找的字符（支持中文）回车，OK.
;; ;; 还有一个moccur-grep-find 该命令支持子目录查询。
;; (require 'moccur-edit)

;; 多重草稿
(require 'multi-scratch)

;; elisp 格式
(require 'elisp-format)

;; 从 emacs 的 irc 上一个叫 tali713 的人那里拿来的
;; 把匹配的字符串拷贝在一个 buffer 中的函数
;; 但是对中文的支持不好，要把编码转换之后才行。
;; 也许是要把编码先转换再搜索。
(defun matching-strings (regexp) 
  (interactive `(,(read-input "regexp: "))) 
  (mark-whole-buffer) 
  (shell-command-on-region (point-min) 
			   (point-max) 
			   (concat "grep --only-matching \"" regexp "\"") 
			   (get-buffer-create "*matching-strings*")) 
  (pop-global-mark) 
  (switch-to-buffer-other-window "*matching-strings*"))

;;  闲来无事，在emacswiki看到两个windows下emacs的扩展：在emacs下调用windows的context menu和属性对话框（效果见附件）。虽说不一定很实用，但觉得还是有点意思。所以和大家分享一下：
;;  到 http://www.maddogsw.com/cmdutils/ 下载 context.exe 和 propsfor.exe并将它们放到PATH的某一路径下。然后在.emacs中加入下列语句就可以：
;;  1） 在dired下右键显示explore的context menu。
;;  2） 在当前buffer中'C-c c'显示explore的context menu
;;  3)  在当前buffer中'C-c p'显示属性对话框

;;Get emacs to display Explorer's context menu in dired
(defun w32-context-menu (filename)
  (start-process-shell-command "context" "*context*" "context" filename))

(defun w32-context-menu-dired-get-filename (event)
  (interactive "e")
  ;; moves point to clicked row
  (mouse-set-point event)
  (w32-context-menu (dired-get-filename)))
;; Bind RMB
(defun my-dired-mode-hook ()
  ;;(define-key dired-mode-map "C-cC-g" 'w32-context-menu-dired-get-filename) )
  (define-key dired-mode-map [mouse-3] 'w32-context-menu-dired-get-filename))
(add-hook 'dired-mode-hook 'my-dired-mode-hook)
;;Get emacs to display Explorer's context menu for current buffer
(defun w32-context-menu-current-buffer ()
  (interactive)
  (w32-context-menu  buffer-file-name ))
(global-set-key "\C-cc" 'w32-context-menu-current-buffer)

;;Get emacs to display Explorer's properies-dialog
(defun w32-Properties-dialog (filename)
  (start-process-shell-command "propsfor" "*propsfor*" "propsfor" filename))

(defun w32-Properties-dialog-current-buffer ()
  (interactive)
  (w32-Properties-dialog buffer-file-name))
(global-set-key "\C-cp" 'w32-Properties-dialog-current-buffer)

;; 大致可以使用。
;; 不过有两个小毛病:
;; 1 无法显示某些路径名带有中文字符的文件。
;; 2 从dired里面调用win32 shell打开文件的话，path设置有问题。比如指定avi通过mplayer打开。在dired调用时，找不到mplayer exe目录里的config文件。
