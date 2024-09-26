;; ���û�����ѡ��
(provide 'set-default)

; ���ô��ڴ�С
;; (setq default-frame-alist
      ;; '((height . 39) (width . 158)))

; �������Ի���
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;; (set-clipboard-coding-system 'utf-8)  
(setq ansi-color-for-comint-mode t)
(modify-coding-system-alist 'process "*" 'utf-8)  
(setq-default pathname-coding-system 'utf-8)  
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq file-name-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8)  
(setq slime-net-coding-system 'utf-8-unix)

(when (eq system-type 'windows-nt)
  (setq locale-coding-system 'gb18030)  ;�˾䱣֤��������������Ч
  (setq w32-unicode-filenames 'nil)       ; ȷ��file-name-coding-system���������ò�����Ч
  (setq file-name-coding-system 'gb18030) ; �����ļ����ı���Ϊgb18030
  )

; ���ô��ļ���ȱʡ·��
(setq default-directory "~/")
(setq user-emacs-directory dotemacs-dir)
;(delete-directory "~/.emacs.d")

; �� echo-buffer ��Ҫ�ض����
(setq eval-expression-print-length nil)

; �� common lisp ����
(require 'cl-lib)

; scratch blank
(setq initial-scratch-message "")

;;ʱ����ʾ����
;;����ʱ����ʾ���ã���minibuffer������Ǹ����ϣ����˽�ʲô���ţ�
(display-time-mode 1)
;;ʱ��ʹ��24Сʱ��
;(setq display-time-24hr-format t)
;;ʱ����ʾ�������ں;���ʱ��
(setq display-time-day-and-date t)

;;��ʾĬ�ϵ��ĵ��Ŀ�ȣ��������Ƚ������
(setq default-fill-column 60)
;;ָ�벻Ҫ�����ҵ��۾�����
(blink-cursor-mode -1)
(transient-mark-mode 1)
;;��ָ�뵽һ������ʱ���Զ���ʾ��ƥ�����һ������
(show-paren-mode 1)
;;ȥ��Emacs��gnus����ʱ����������
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

; �����������ļ�
(setq make-backup-files nil)

; ��ֹ��������
(setq inhibit-splash-screen t)

; һ�򿪾�����textģʽ
(setq default-major-mode 'text-mode)
(setq initial-major-mode 'text-mode)

;; �ı� Emacs ��ִ��Ҫ��ش� yes ����Ϊ���� y ��ո����ʾ yes��n ��ʾ no
(fset 'yes-or-no-p 'y-or-n-p)

; ���Եݹ��ɾ��Ŀ¼
(setq dired-recursive-deletes t)

; ���Եݹ�ؽ���Ŀ¼����
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


;; ; �ռ��ļ�
;; (setq diary-file "~/diary")

;; ����Ự����
(require 'session)
(setq session-save-file-coding-system 'utf-8-unix)
(setq session-save-file my_session_path)
(add-hook 'after-init-hook 'session-initialize)
;(load "desktop")
;(add-to-list 'desktop-path my_desktop_path)
;(desktop-save-mode)
;(desktop-load-default)
;; �ڿ���ʱ���� desktop ������ daemon ģʽ���ƺ������������� https://www.emacswiki.org/emacs/Desktop
;(defun my-desktop-save ()
;  (interactive)
;  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
;  (if (eq (desktop-owner) (emacs-pid))
;      (desktop-save desktop-dirname)))
;(add-hook 'auto-save-hook 'my-desktop-save)

;; ��� desktop ����û�������Ƴ�������ݽ��̺��Ƴ���
;(defun sylvain/desktop-owner-advice (original &rest args)
;  (let ((owner (apply original args)))
;    (if (and owner (/= owner (emacs-pid)))
;        (and (car (member owner (list-system-processes)))
;             (let (cmd (attrlist (process-attributes owner)))
;               (if (not attrlist) owner
;                 (dolist (attr attrlist)
;                   (and (string= "comm" (car attr))
;                        (setq cmd (car attr))))
;                 (and cmd (string-match-p "[Ee]macs" cmd) owner))))
;      owner)))
;; Ensure that dead system processes don't own it.
;(advice-add #'desktop-owner :around #'sylvain/desktop-owner-advice)

;(desktop-read)

(tool-bar-mode 0) ; ȥ��������

;���õ���λ��
(setq calendar-latitude 31.01)
(setq calendar-longitude 121.42)
(setq calendar-location-name "Shanghai")

; ���°󶨱�Ǽ�
(global-set-key (kbd "M-m") 'set-mark-command)

; Linux �� �� emacs �� X-Windowϵͳ���������
(setq x-select-enable-clipboard t) 

; (global-linum-mode t)

(set-scroll-bar-mode nil)

; �����ڼ��л� pnbf
(define-key global-map "\C-cp" 'windmove-up)
(define-key global-map "\C-cn" 'windmove-down)
(define-key global-map "\C-cb" 'windmove-left)
(define-key global-map "\C-cf" 'windmove-right)

(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)

; ��ת��ָ���У���ס Ctrl ��Ҫ�ţ�Ȼ������ c �� g �����ٰ��ո�����������Ҫȥ���кš�
(define-key global-map "\C-c\C-g " 'goto-line)

; ʹ�� ibuffer
;(require 'ibuffer)
;(global-set-key (kbd "C-x C-b") 'ibuffer) 

; ʹ�� ido
;(require 'ido)
;(ido-mode t) 

; ǿ�� eshell ִ��
;(setq eshell-force-execution t)

;; ; ���� .emacs �е����ñ�������ص����ü̳�
;; (setq inhibit-default-init t)

;; ; ��Ҫ�Զ�������
(add-hook 'text-mode-hook
            (lambda ()
                (set (make-local-variable 'require-final-newline) nil)))

;; �� lisp ����ĵ�һ��Ŀ¼���� load-path
(let ((base lisp-dir))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name) 
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; ʹ�� mozrepl
;; (autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

;; (add-hook 'javascript-mode-hook 'javascript-custom-setup)
;; (defun javascript-custom-setup ()
;;   (moz-minor-mode 1))

;; �ڱ����ļ�ʱ�Զ�����Ŀ¼��Ҫ�� c-x c-w ����
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;; �ɶԵ������Զ���ȫ
(electric-pair-mode 1)


; ��Ҫ�������壬�������
; Error (frameset): Font ��tty�� is not defined

(setq desktop-restore-frames nil)

; ��������ͳ��
(load "ch-count-words")

; �Զ������޸ĺ���ļ�
(global-auto-revert-mode t)

; ���� emacs ��Ҫ��ʾɾ����Щ��
(add-hook 'after-init-hook
  (lambda()
    (progn
      (add-to-list 'package-selected-packages 'monokai-theme)
      (add-to-list 'package-selected-packages 'posframe)
      (add-to-list 'package-selected-packages 'yasnippet)
      (add-to-list 'package-selected-packages 'use-package)
      (add-to-list 'package-selected-packages 's)
      (add-to-list 'package-selected-packages 'minibuffer-modifier-keys)
      (add-to-list 'package-selected-packages 'bind-key)
      (add-to-list 'package-selected-packages 'iedit)
      (add-to-list 'package-selected-packages 'session)
      (add-to-list 'package-selected-packages 'yasnippet-snippets)
      (add-to-list 'package-selected-packages 'with-editor)
      (add-to-list 'package-selected-packages 'transient)
      (add-to-list 'package-selected-packages 'pkg-info)
      (add-to-list 'package-selected-packages 'magit-section)
      (add-to-list 'package-selected-packages 'magit)
      (add-to-list 'package-selected-packages 'irony)
      (add-to-list 'package-selected-packages 'git-commit)
      (add-to-list 'package-selected-packages 'flycheck)
      (add-to-list 'package-selected-packages 'epl)
      (add-to-list 'package-selected-packages 'dash)
      (add-to-list 'package-selected-packages 'compat)
      (add-to-list 'package-selected-packages 'company-irony-c-headers)
      (add-to-list 'package-selected-packages 'company-irony)
      (add-to-list 'package-selected-packages 'company)
      (add-to-list 'package-selected-packages 'flycheck-irony)
      (add-to-list 'package-selected-packages 'markdown-mode)
      (add-to-list 'package-selected-packages 'levenshtein)
      (add-to-list 'package-selected-packages 'company-c-headers)
      (add-to-list 'package-selected-packages 'cmake-ide)
      (add-to-list 'package-selected-packages 'clang-format)
      (add-to-list 'package-selected-packages 'folding)
      ;(add-to-list 'package-selected-packages ')
      )))

;; �� msys ��·������
(setenv "PATH"
    (concat
     "D:\\dev\\msys64\\usr\\bin;D:\\dev\\msys64\\mingw64\\bin;E:\\slkshare\\emacs\\.emacs.d\\irony\\bin\\;"
     (getenv "PATH")
    )
)

