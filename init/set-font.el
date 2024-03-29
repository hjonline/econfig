; 字体设置，来自http://emacser.com/torture-emacs.htm
(provide 'set-font)

(if window-system ( progn

(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defvar font-list '("Microsoft Yahei" "文泉驿等宽正黑" "黑体" "新宋体" "宋体"))
(require 'cl-lib) ;; cl-find-if is in common list package
(cl-find-if #'qiang-font-existsp font-list)

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size) 
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
;  (require 'cl)                         ; for find if
  (let ((en-font (qiang-make-font-string
                  (cl-find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (cl-find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))
    
    ;; Set the default English font
    ;; 
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)
    
    ;; Set Chinese font 
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))
;;看看是控制台还是X窗口
(if (memq (framep (selected-frame)) '(x pc w32 win32))
    (cl-find-if #'qiang-font-existsp font-list))
(if (memq (framep (selected-frame)) '(x pc w32 win32))
    (qiang-set-font
     '("fantasque sans mono" "Monaco" "Consolas" "DejaVu Sans Mono" "Monospace" "Courier New") my_font_size
     '("Microsoft Yahei" "文泉驿等宽正黑" "黑体" "新宋体" "宋体")))
))
