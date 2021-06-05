; 颜色配置
(provide 'set-mytheme)

;(require 'color-theme)
;(eval-after-load "color-theme"
;  '(progn
;     (color-theme-initialize)
;     (load-file blackboard-theme)
;     (color-theme-blackboard)))

(load-theme 'monokai t)

(global-set-key (kbd "<f10>") 'loop-alpha)
;当前窗口和非当前窗口时透明度
(setq alpha-list '((85 75) (100 100)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
     (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))))
;启动窗口时时自动开启窗口半透明效果
(loop-alpha)
