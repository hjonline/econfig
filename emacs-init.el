; This is the main Emacs initialization file - .emacs.
;(if (eq system-type 'gnu/linux)
;(progn
;(setq slkshareemacs-dir "/media/sf_slkshare/emacs")
;))


					;;;;;;; 实机 windows
					; Z68 上的 windows 10
(if (string= system-name "HOME-Z68")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs-setup")
      (add-to-list 'Info-default-directory-list "d:/dev/mingw/msys/1.0/local/info")))

					; B75 上的 windows 10
(if (string= system-name "HOME-B75")
    (progn
      (setq my_dev "d:/dev")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "d:/dev/mingw/msys/1.0/local/info")))

					; 华硕 DOSTYLE 上的 windows 10
(if (string= system-name "DOSTYLE")
    (progn
      (setq my_dev "d:/dev")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "D:/dev/msys64/usr/share/info")))

					; 准备室上的 windows 10
(if (string= system-name "READYROOM")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (add-to-list 'Info-default-directory-list "d:/mingw/msys/1.0/local/info")))

					; 办公室的 windows 10
(if (string= system-name "OFFICE")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "e:/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq dotstardict-dir "/cygdrive/e/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "d:/dev/mingw/msys/1.0/local/info")))

					; hp g3 的 windows 10
(if (string= system-name "HPG3")
    (progn
      (setq my_dev "d:/dev")
      (setq slkshareemacs-dir "g:/slkshare/emacs")
      (setq tramp-win-exe "~/tools/ftp.exe")
      (setq dotstardict-dir "/cygdrive/g/slkshare/emacs")
      (add-to-list 'Info-default-directory-list "c:/MinGw/msys/1.0/local/info")))


					;;;;;;; 实机上的 linux
					; B75 上的实机 slackware 
(if (string= system-name 'b75-slack)
  (progn
    (setq slkshareemacs-dir "/mnt/ntfs_e/slkshare/emacs")
    (setq dotstardict-dir slkshareemacs-dir)
  )
)

					; Z68 上的实机 slackware 
(if (string= system-name 'z68)
  (progn
    (setq slkshareemacs-dir "/mnt/ntfs_e/slkshare/emacs")
    (setq dotstardict-dir slkshareemacs-dir)
  )
)


					; 华硕 dostyle 上的实机 debian
(if (string= system-name 'deb64.net)
    (progn
      (setq slkshareemacs-dir "/media/ntfs_e/slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
      )
    )

					; 华硕 dostyle 上的实机 slackware
(if (string= system-name 'slk64.net)
    (progn
      (setq slkshareemacs-dir "/media/ntfs_e/slkshare/emacs")
      (setq dotstardict-dir slkshareemacs-dir)
      )
    )


					; 虚拟机上的
					; office 虚拟机上的 slackware
(if (string= system-name 'slk_office.net)
    (progn
      (setq slkshareemacs-dir "/mnt/hgfs/slkshare/emacs")
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
(setq doxymacs-dir (concat econfig-dir "/lisp/doxymacs"))
(setq sdcv-cmd (concat "sdcv --data-dir " dotstardict-dir "/.stardict/dic -n %s %s"))

; 加载 elpa 包管理器
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
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
(if (eq system-type 'windows-nt)
    (progn
      (require 'set-mylisp)
))
; 使用 cperl 模式
(defalias 'perl-mode 'cperl-mode)

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
;(require 'php-mode)
;(require 'php-extras)
;(require 'php-auto-yasnippets)

; 使用 newlisp 模式
(require 'mynewlisp)

; 使用 folding
(require 'yoyo-folding)
