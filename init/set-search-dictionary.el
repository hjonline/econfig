;; 设置字典查询功能
(provide 'set-search-dictionary)

;; ;;在需要的时候加载所需的elisp
;; (autoload 'dictionary-search "dictionary" "Ask for a word and search it in all dictionaries" t)
;; (autoload 'dictionary-match-words "dictionary" "Ask for a word and search all matching words in the dictionaries" t)
;; (autoload 'dictionary-lookup-definition "dictionary" "Unconditionally lookup the word at point." t)
;; (autoload 'dictionary "dictionary" "Create a new dictionary buffer" t)
;; (autoload 'dictionary-mouse-popup-matching-words "dictionary" "Display entries matching the word at the cursor" t)
;; (autoload 'dictionary-popup-matching-words "dictionary" "Display entries matching the word at the point" t)
;; (autoload 'dictionary-tooltip-mode "dictionary" "Display tooltips for the current word" t)
;; (autoload 'global-dictionary-tooltip-mode "dictionary" "Enable/disable dictionary-tooltip-mode for all buffers" t) 

;; (setq dictionary-server "http://www.dict.org")
;; (setq dictionary-tooltip-dictionary "wn") 
;; (setq dictionary-coding-systems-for-dictionaries '(("cdict" . gb2312)
;; 						   ("xdict" . gbk2312)
;; 						   ("stardic" . gb2312))) 

;;(require 'init-sdcv)

(global-set-key (kbd "C-c d") 'kid-sdcv-to-buffer)
(defun kid-sdcv-to-buffer ()
  (interactive)
  (let ((word (if mark-active
                  (buffer-substring-no-properties (region-beginning) (region-end))
                (current-word nil t))))
    (setq word (read-string (format "Search the dictionary for (default %s): " word)
                            nil nil word))
    (set-buffer (get-buffer-create "*sdcv*"))
    (buffer-disable-undo)
    (erase-buffer)
    (let ((process (start-process-shell-command "sdcv" "*sdcv*" "sdcv" "-2" dotstardict-dir "-n" word)))
      (set-process-sentinel
       process
       (lambda (process signal)
         (when (memq (process-status process) '(exit signal))
           (unless (string= (buffer-name) "*sdcv*")
             (setq kid-sdcv-window-configuration (current-window-configuration))
             (switch-to-buffer-other-window "*sdcv*")
             (local-set-key (kbd "d") 'kid-sdcv-to-buffer)
             (local-set-key (kbd "q") (lambda ()
                                        (interactive)
                                        (bury-buffer)
                                        (unless (null (cdr (window-list))) ; only one window
                                          (delete-window)))))
           (goto-char (point-min))))))))
		   
;;(global-set-key (kbd "C-c s") 'sdcv-search-pointer+)

;;(global-set-key (kbd "C-c S") 'sdcv-search-input)