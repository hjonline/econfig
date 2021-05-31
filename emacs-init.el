; This is the main Emacs initialization file - .emacs.
;(if (eq system-type 'gnu/linux)
;(progn
;(setq slkshareemacs-dir "/media/sf_slkshare/emacs")
;))

(setq warning-suppress-log-types '((package reinitialization)))
(setq byte-compile-warnings '(cl-functions))

(if (eq system-type 'windows-nt)
    (progn
	      ; 使用 mingw 的 msys 的工具
      (add-to-list 'exec-path "D:/dev/msys64/usr/bin/")
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
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs-setup")
      (add-to-list 'Info-default-directory-list "C:/mingw/msys/1.0/local/info")))

					; B75 上的 windows 7
(if (string= system-name "HOME-B75")
    (progn
      (setq my_dev "d:/dev")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "C:/mingw/msys/1.0/local/info")))

					; 华硕 DOSTYLE 上的 windows 7
(if (string= system-name "DOSTYLE")
    (progn
      (setq my_dev "d:/dev")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "D:/dev/msys64/usr/share/info")))

					; northlab 上的 windows 7
(if (string= system-name "NORTHLAB")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (add-to-list 'Info-default-directory-list "C:/MinGw/msys/1.0/local/info")))

					; 办公室的 windows 7
(if (string= system-name "OFFICE")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "d:/dev/mingw/msys/1.0/local/info")))

					; hp g3 的 windows 7
(if (string= system-name "HPG3")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "c:/MinGw/msys/1.0/local/info")))


					;;;;;;; 实机上的 linux


					; 虚拟机上的
					; office 虚拟机上的 slackware
(if (string= system-name 'oslk-1.net)
    (progn
      (setq slkshareemacs-dir "/mnt/hgfs/slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
      )
    )

					; dostyle vmware 虚拟机上的 slackware
(if (string= system-name 'doslk.net)
    (progn
      (setq slkshareemacs-dir "/mnt/hgfs/slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
      )
    )

					; dostyle virtualbox 虚拟机上的 slackware
(if (string= system-name 'vdoslk.net)
    (progn
      (setq slkshareemacs-dir "/media/sf_slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
      )
    )

					; b75 虚拟机上的 debian
(if (string= system-name 'deb)
    (progn
      (setq slkshareemacs-dir "/media/sf_slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
      )
    )

					; dostyle 虚拟机上的 debian
(if (string= system-name 'deb-1)
    (progn
      (setq slkshareemacs-dir "/media/sf_slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
      )
    )


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
(setq sdcv-cmd (concat "sdcv --data-dir " dotstardict-dir "/.stardict/dic -n %s %s"))

					; 加载 elpa 包管理器
(require 'package)
(setq package-archives nil)
(require 'gnutls)
(add-to-list 'gnutls-trustfiles
	     (expand-file-name
	      "~/etc/tls/certificates/comodo.rsa.ca.intermediate.crt"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("popkit" . "https://elpa.popkit.org/packages/"))
(add-to-list 'package-archives '("melpa-ch" . "http://elpa.emacs-china.org/melpa/"))
(add-to-list 'package-archives '("gnu-ch"   . "http://elpa.emacs-china.org/gnu/"))

(package-initialize)


					; 加载一些默认的全局选项
(require 'set-default)

					; 加载 bbdb 
					;(require 'bbdb)
					;(bbdb-initialize)

					; Maxmizing the emacs's window
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

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
					;(require 'set-php-mode)

					; 字典查询
;; (require 'set-search-dictionary)

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
(if (eq system-type 'windows-nt)
    (progn
      (require 'set-mylisp)
      ))

(if (eq system-type 'gnu/linux)
    (progn
      ;;daemon时的字体
      (require 'set-daemon-config)
      ))

(if (eq system-type 'windows-nt)
    (progn
					; 使用 msys 作为 shell
     (require 'set-myshell)
					; 使用 server mode
      (require 'set-servermode)
      ))

					; 使用 php 模式
(require 'php-mode)
(require 'php-extras)
(require 'php-auto-yasnippets)

					; 使用 newlisp 模式
;; (require 'mynewlisp)

					; 使用 folding
;; (require 'yoyo-folding)

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

;; (global-set-key "\354" (quote 复制到上一行开头))

;; (global-set-key "\333" (quote 把书名移动到行首))
