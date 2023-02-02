; This is the main Emacs initialization file - .emacs.
;(if (eq system-type 'gnu/linux)
;(progn
;(setq slkshareemacs-dir "/media/sf_slkshare/emacs")
;))

(setq warning-suppress-log-types '((package reinitialization)))
(setq byte-compile-warnings '(cl-functions))
(setq package-check-signature nil)

(if (eq system-type 'windows-nt)
    (progn
	      ; 使用 mingw 的 msys 的工具
      (add-to-list 'exec-path "D:/dev/msys64/usr/bin/")
      (add-to-list 'exec-path "D:/dev/msys64/mingw64/bin/")
      (add-to-list 'exec-path "E:/soft/media/mpg123/")
      (add-to-list 'exec-path "D:/dev/MinGW/msys/1.0/local/bin")
	  (add-to-list 'exec-path "D:/dev/Git")
;      (add-to-list 'exec-path "C:/MinGw/msys/1.0/bin/")
      (setq my_c_path "C:")
      ))



					;;;;;;; 实机 windows
					; Z68 上的 windows 7
(if (string= system-name "HOME-Z68")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "C:/mingw/msys/1.0/local/info")
	  (setq my_font_size ":pixelsize=22")
	  ))

					; B75 上的 windows 7
(if (string= system-name "HOME-B75")
    (progn
      (setq my_dev "d:/dev")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "C:/mingw/msys/1.0/local/info")
	  (setq my_desktop_path (concat slkshareemacs-dir "/.emacs.d/desktop/b75"))
	  (setq my_session_path (concat slkshareemacs-dir "/.emacs.d/session/b75/b75-session"))
	  (setq my_windows_cfg (concat slkshareemacs-dir "/.emacs.d/session/b75/.windows"))
	  (setq my_font_size ":pixelsize=24")
      ))

					; b660-m 上的 windows 11
(if (string= system-name "HOME-B660-M")
    (progn
      (setq my_dev "d:/dev")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "C:/mingw/msys/1.0/local/info")
	  (setq my_desktop_path (concat slkshareemacs-dir "/.emacs.d/desktop/b660-m"))
	  (setq my_session_path (concat slkshareemacs-dir "/.emacs.d/session/b660-m/b660-m-session"))
	  (setq my_windows_cfg (concat slkshareemacs-dir "/.emacs.d/session/b660-m/.windows"))
	  (setq my_font_size ":pixelsize=24")
      ))
	  
					; 华硕 DOSTYLE 上的 windows 7
(if (string= system-name "DOSTYLE")
    (progn
      (setq my_dev "d:/dev")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "D:/dev/msys64/usr/share/info")
	  (setq my_desktop_path (concat slkshareemacs-dir "/.emacs.d/desktop/dostyle"))
	  (setq my_session_path (concat slkshareemacs-dir "/.emacs.d/session/dostyle/dostyle-session"))
	  (setq my_windows_cfg (concat slkshareemacs-dir "/.emacs.d/session/dostyle/.windows"))
	  (setq my_font_size ":pixelsize=24")
      ))

					; northlab 上的 windows 7
(if (string= system-name "NORTHLAB")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (add-to-list 'Info-default-directory-list "C:/MinGw/msys/1.0/local/info")
	  (setq my_desktop_path (concat slkshareemacs-dir "/.emacs.d/desktop/northlab"))
	  (setq my_session_path (concat slkshareemacs-dir "/.emacs.d/session/northlab/northlab-session"))
	  (setq my_windows_cfg (concat slkshareemacs-dir "/.emacs.d/session/northlab/.windows"))
	  (setq my_font_size ":pixelsize=24")
	  ))

					; 办公室的 windows 7
(if (string= system-name "OFFICE")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs/")
      (add-to-list 'Info-default-directory-list "d:/dev/mingw/msys/1.0/local/info")
	  (setq my_desktop_path (concat slkshareemacs-dir "/.emacs.d/desktop/office"))
	  (setq my_session_path (concat slkshareemacs-dir "/.emacs.d/session/office/office-session"))
	  (setq my_windows_cfg (concat slkshareemacs-dir "/.emacs.d/session/office/.windows"))
	  (setq my_font_size ":pixelsize=18")
	  ))

					; hp g3 的 windows 7
(if (string= system-name "HPG3")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "c:/MinGw/msys/1.0/local/info")
	  (setq my_desktop_path (concat slkshareemacs-dir "/.emacs.d/desktop/hpg3"))
	  (setq my_session_path (concat slkshareemacs-dir "/.emacs.d/session/hpg3/hpg3-session"))
	  (setq my_windows_cfg (concat slkshareemacs-dir "/.emacs.d/session/hpg3/.windows"))
	  (setq my_font_size ":pixelsize=16")
	  ))


					;;;;;;; 实机上的 linux


					; 虚拟机上的
					; office 虚拟机上的 slackware
(if (string= system-name 'slk-1.net)
    (progn
      (setq slkshareemacs-dir "/mnt/hgfs/slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
	  (setq my_desktop_path (concat slkshareemacs-dir "/.emacs.d/desktop/vmware/slk-1"))
	  (setq my_session_path (concat slkshareemacs-dir "/.emacs.d/session/vmware/slk-1/slk-1-session"))
	  (setq my_font_size ":pixelsize=22")
     ))

					; dostyle vmware 虚拟机上的 slackware
(if (string= system-name 'slk-1.net)
    (progn
      (setq slkshareemacs-dir "/mnt/hgfs/slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
	  (setq my_desktop_path (concat slkshareemacs-dir "/.emacs.d/desktop/vmware/slk-1"))
	  (setq my_session_path (concat slkshareemacs-dir "/.emacs.d/session/vmware/slk-1/slk-1-session"))
	  (setq my_font_size ":pixelsize=22")
     ))

					; dostyle virtualbox 虚拟机上的 slackware
(if (string= system-name 'vdoslk.net)
    (progn
      (setq slkshareemacs-dir "/media/sf_slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
	  (setq my_font_size ":pixelsize=22")
     ))

					; b75 虚拟机上的 debian
(if (string= system-name 'deb)
    (progn
      (setq slkshareemacs-dir "/media/sf_slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
	  (setq my_font_size ":pixelsize=22")
     ))

					; dostyle 虚拟机上的 debian
(if (string= system-name 'deb-1)
    (progn
      (setq slkshareemacs-dir "/media/sf_slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
	  (setq my_font_size ":pixelsize=22")
     ))


;;; 等待区分



(setq dotemacs-dir (concat slkshareemacs-dir "/.emacs.d/"))
(setq econfig-dir (concat slkshareemacs-dir "/econfig"))
(setq lisp-dir (concat slkshareemacs-dir "/lisp"))
(add-to-list 'load-path (expand-file-name lisp-dir))
(add-to-list 'load-path (concat econfig-dir "/init"))
(setq blackboard-theme (concat lisp-dir "/themes/color-theme-blackboard.el"))
(setq saves-dir (concat slkshareemacs-dir "/saves"))
					; elpa 包管理器目录 
(setq package-user-dir (concat dotemacs-dir "/elpa"))
(setq package-gnupghome-dir (concat package-user-dir "/gnupg"))
(setq doxymacs-dir (concat econfig-dir "/lisp/doxymacs"))
(setq sdcv-program "sdcv.bat")

					; 加载 elpa 包管理器
(require 'package)
(setq package-archives nil)
(require 'gnutls)
(add-to-list 'gnutls-trustfiles
	     (expand-file-name
	      "~/etc/tls/certificates/comodo.rsa.ca.intermediate.crt"))
;;(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
;;(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives  '("gnu-tuna"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
(add-to-list 'package-archives  '("melpa-tuna" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
;; (add-to-list 'package-archives  '("gnu-ec"   . "http://elpa.emacs-china.org/gnu/"))
;; (add-to-list 'package-archives  '("melpa-ec" . "http://elpa.emacs-china.org/melpa/"))
(add-to-list 'package-archives  '("gnu-163"   . "http://mirrors.163.com/elpa/gnu/"))
(add-to-list 'package-archives  '("melpa-163" . "http://mirrors.163.com/elpa/melpa/"))
;(add-to-list 'package-archives '("gnu-ustc" . "http://mirrors.ustc.edu.cn/elpa/gnu/"))
;(add-to-list 'package-archives '("melpa-ustc" . "http://mirrors.ustc.edu.cn/elpa/melpa/"))
;(add-to-list 'package-archives '("org-ustc" . "http://mirrors.ustc.edu.cn/elpa/org/"))

(package-initialize)


					; 加载一些默认的全局选项
(require 'set-default)

					; 加载 bbdb 
					;(require 'bbdb)
					;(bbdb-initialize)

					; Maxmizing the emacs's window
(defun maximize-frame (&optional the-frame)
  (interactive)
  (w32-send-sys-command 61488))
(if (eq system-type 'windows-nt)
    (add-hook 'window-setup-hook 'maximize-frame t))
(if (eq system-type 'gnu/linux)
    (add-to-list 'default-frame-alist '(fullscreen . maximized)))

					; 字体设置，来自 ZHUO Qiang
					; http://emacser.com/torture-emacs.htm
(require 'set-font)

					; 复制、粘贴、注释的一些变种
					; 来自 ZHUO Qiang
(require 'set-qiang-copy)

					; 颜色配置
(require 'set-mytheme)

					; cedet 配置
					;(require 'set-mycedet)

					; 版本控制的配置
					;(require 'set-svn)

					; pgp 加密
					;(require 'set-encrypt)

					; org 模式
(require 'set-org)

					; php 模式
; (require 'set-php-mode)

					; 字典查询
(require 'set-search-dictionary)

					; dired 模式下的一些个性化设定
(require 'set-mydired)

					; 自动补全
(require 'set-myautocomplete)

					; 使用 doxymacs
					;(require 'set-mydoxymacs)

					; 使用 w3m
					;(require 'set-w3m)

					; 使用 auctex
					;(require 'set-mytex)

					; 使用 lisp
;; (if (eq system-type 'windows-nt)
;;     (progn
;;       (require 'set-mylisp)
;;       ))

(if (eq system-type 'gnu/linux)
    (progn
      ;;daemon时的字体
      (require 'set-daemon-config)
      ))

(if (eq system-type 'windows-nt)
    (progn
					; 使用 msys 作为 shell
                                        ; (require 'set-myshell)
					; 使用 server mode
     (require 'set-servermode)
      ))

					; 使用 newlisp 模式
;; (require 'mynewlisp)

					; 使用 folding
(require 'yoyo-folding)

					; 使用 cperl 模式
(defalias 'perl-mode 'cperl-mode)
(with-eval-after-load 'perl-mode
  (define-key cperl-mode-map (kbd "C") nil))

					;使用 ido-mode
(require 'set-myido)

					;使用 iedit-mode
(require 'set-myiedit)

(require 'set-myregex)

(load "mymacros")

(require 'set-puni)
