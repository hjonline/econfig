; ʹ�� server mode
(provide 'set-servermode)

; ����ע���� FAT ��ʽ�ķ�����ʹ��
 
  (require 'server)
  (when (> emacs-major-version 23)
    (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
					; ~/.emacs.d/server is unsafe"
					; on windows.
    ;(server-start)
					; �������� NTFS ��ʽ��ʹ�� server mode
  (server-mode 1)
