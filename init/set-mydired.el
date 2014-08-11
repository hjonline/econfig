;; �������й��� dired ģʽ�´��ļ�ʱ����������
(provide 'set-mydired)

;; �������������� emacs ��ִ�е�ʱ�䣬���� dired-mode-map �����
(require 'dired-details+)

;; ��ģʽ����ʾ����·��
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

;; ���Զ�ѹ��ģʽ
(auto-compression-mode 1)

;; �� dired ֻ��һ�� buffer
(eval-after-load 
    'dired 
  '(progn 
     (require 'joseph-single-dired)))

;; ʹ�� dired
(require 'dired-x)

;; ��ת����ǰ buffer ����Ӧ���ļ���Ŀ¼
(define-key global-map (kbd "C-x C-j") 'dired-jump)
(define-key global-map (kbd "C-x 4 C-j") 'dired-jump-other-window)

;; ֻ��ʾ�ļ�������С���ſ���
(require 'dired-details)
(dired-details-install)

;; ���� ftp
(require 'tramp)
(setq tramp-default-method "ftp")
(if (eq system-type 'windows-nt) 
    (setq ange-ftp-ftp-program-name tramp-win-exe))

;; ;; ���ļ�����
;; ;; ִ�� moccur-grep
;; ;; ������Ŀ¼��Ȼ����������ҵ��ַ���֧�����ģ��س���OK.
;; ;; ����һ��moccur-grep-find ������֧����Ŀ¼��ѯ��
;; (require 'moccur-edit)

;; ���زݸ�
(require 'multi-scratch)

;; elisp ��ʽ
(require 'elisp-format)

;; �� emacs �� irc ��һ���� tali713 ��������������
;; ��ƥ����ַ���������һ�� buffer �еĺ���
;; ���Ƕ����ĵ�֧�ֲ��ã�Ҫ�ѱ���ת��֮����С�
;; Ҳ����Ҫ�ѱ�����ת����������
(defun matching-strings (regexp) 
  (interactive `(,(read-input "regexp: "))) 
  (mark-whole-buffer) 
  (shell-command-on-region (point-min) 
			   (point-max) 
			   (concat "grep --only-matching \"" regexp "\"") 
			   (get-buffer-create "*matching-strings*")) 
  (pop-global-mark) 
  (switch-to-buffer-other-window "*matching-strings*"))

;;  �������£���emacswiki��������windows��emacs����չ����emacs�µ���windows��context menu�����ԶԻ���Ч��������������˵��һ����ʵ�ã������û����е���˼�����Ժʹ�ҷ���һ�£�
;;  �� http://www.maddogsw.com/cmdutils/ ���� context.exe �� propsfor.exe�������Ƿŵ�PATH��ĳһ·���¡�Ȼ����.emacs�м����������Ϳ��ԣ�
;;  1�� ��dired���Ҽ���ʾexplore��context menu��
;;  2�� �ڵ�ǰbuffer��'C-c c'��ʾexplore��context menu
;;  3)  �ڵ�ǰbuffer��'C-c p'��ʾ���ԶԻ���

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

;; ���¿���ʹ�á�
;; ����������Сë��:
;; 1 �޷���ʾĳЩ·�������������ַ����ļ���
;; 2 ��dired�������win32 shell���ļ��Ļ���path���������⡣����ָ��aviͨ��mplayer�򿪡���dired����ʱ���Ҳ���mplayer exeĿ¼���config�ļ���
