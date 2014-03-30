;; This is the main Emacs initialization file - .emacs.

(if (eq system-type 'windows-nt)

( progn  
(setq slkshareemacs-dir "e:/slkshare/emacs")
(setq tramp-win-exe "~/tools/ftp.exe")

;; 设置自己的 info 目录
(add-to-list 'Info-default-directory-list "D:/dev/mingw/msys/1.0/local/info")


)
(if (eq system-type 'gnu/linux)
(progn
(setq slkshareemacs-dir "/media/sf_slkshare/emacs")

)))

(if (string= system-name "WWW-3566B3356BC")
  (setq my_dev "c:"))
(if (string= system-name "CHINA-936728572")
  (setq my_dev "d:/dev"))
(if (string= system-name "HOME-B75")
  (setq my_dev "d:/dev"))
  
(setq dotemacs-dir (concat slkshareemacs-dir "/.emacs.d"))
(setq econfig-dir (concat slkshareemacs-dir "/econfig"))
(setq lisp-dir (concat slkshareemacs-dir "/lisp"))
(add-to-list 'load-path (expand-file-name lisp-dir))
(add-to-list 'load-path (concat econfig-dir "/init"))
(setq blackboard-theme (concat lisp-dir "/themes/color-theme-blackboard.el"))
(setq yas-snippet-dirs (concat econfig-dir "/snippets"))
(setq saves-dir (concat slkshareemacs-dir "/saves"))
;; elpa 包管理器目录 
(setq package-user-dir (concat dotemacs-dir "/elpa"))
(setq doxymacs-dir (concat econfig-dir "/lisp/doxymacs"))


; 加载 elpa 包管理器
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
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
(require 'set-mylisp)

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
(require 'php-mode)
(require 'php-extras)
(require 'php-auto-yasnippets)

; 使用 newlisp 模式
(require 'mynewlisp)
