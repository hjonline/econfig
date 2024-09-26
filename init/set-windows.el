;; 设置基本的选项
(provide 'set-windows)

;; 保存窗口设置
(require 'windows)
(require 'recentf)

;; -- Load the saved windows automatically on boot
(add-hook 'window-setup-hook 'resume-windows)

;; --  Use this command to quit and save your setup
(define-key ctl-x-map "C" 'see-you-again)

;; -- Set up window saving!! Place at end of .emacs file
(win:startup-with-window)

(save-place-mode 1) 