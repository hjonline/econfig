;; ���û�����ѡ��
(provide 'set-default)

; ���ô��ڴ�С
;; (setq default-frame-alist
      ;; '((height . 39) (width . 158)))

; ���ô��ļ���ȱʡ·��
(setq default-directory "~/")
(setq user-emacs-directory "E:/slkshare/emacs/.emacs.d")
(delete-directory "~/.emacs.d")

; �� echo-buffer ��Ҫ�ض����
(setq eval-expression-print-length nil)

; �� common lisp ����
(require 'cl)

; scratch blank
(setq initial-scratch-message "")

;;ʱ����ʾ����
;;����ʱ����ʾ���ã���minibuffer������Ǹ����ϣ����˽�ʲô���ţ�
(display-time-mode 1)
;;ʱ��ʹ��24Сʱ��
(setq display-time-24hr-format t)
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
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . saves-dir)) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t) ; use versioned backups

;; ; �ռ��ļ�
;; (setq diary-file "~/diary")

;; ����Ự����
(require 'session)
(setq session-save-file-coding-system 'utf-8-unix)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-save-mode)
(desktop-load-default)
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

(global-linum-mode t)

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
            '(lambda ()
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
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'javascript-mode-hook 'javascript-custom-setup)
(defun javascript-custom-setup ()
  (moz-minor-mode 1))

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

