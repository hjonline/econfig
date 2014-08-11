; 使用 server mode
(provide 'set-servermode)

; 以下注释在 FAT 格式的分区上使用
 
  (require 'server)
  (when (> emacs-major-version 23)
    (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
					; ~/.emacs.d/server is unsafe"
					; on windows.
    ;(server-start)
					; 以下是在 NTFS 格式下使用 server mode
  (server-mode 1)
