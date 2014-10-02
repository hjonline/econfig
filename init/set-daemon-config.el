(provide 'set-daemon-config)


(defun frame-setting ()
  (interactive)
  ;; Setting English Font
  (if (daemonp)
      (progn
	(load "set-font")

	)))
;; 使用daemon启动的时候,添加字体,启动tabbar和光标闪烁
(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (if window-system
		      (frame-setting))
		  (maximize-frame)
                  ;; (tabbar-mode t)
		  (blink-cursor-mode t))))
  (frame-setting)
 ;; (tabbar-mode t)
)

