(provide 'set-daemon-config)


(defun frame-setting ()
  (interactive)
  ;; Setting English Font
  (if (daemonp)
      (progn
  (set-face-attribute
   'default nil :font "Dejavu Sans 14")
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "文泉驿等宽正黑" :size 18))))
))
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

