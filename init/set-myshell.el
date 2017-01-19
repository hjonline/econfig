; 使用 msys 作为 shell
(provide 'set-myshell)

(setq my_msys_cmd (concat my_c_path "/MinGw/msys/1.0/bin/bash.exe"))
(setq my_old_cmd_path (getenv "PATH"))
(setq my_old_cmd  (concat (getenv "EMACS_DIR") "/bin/cmdproxy.exe"))
(global-set-key [C-f1] 'msys_bash)

(defun msys_bash ()
  "Toggle msys bash shell and windows cmd."
  (interactive)
  (if (string-equal explicit-shell-file-name my_old_cmd)
      (progn 
	(setq explicit-shell-file-name my_msys_cmd)
	(setq shell-file-name  "bash") 
	(setq ediff-shell   explicit-shell-file-name)    ; Ediff shell
	(setq explicit-shell-args       '("--noediting" "--login" "-i"))
	(setenv "SHELL" explicit-shell-file-name)
	(setenv "PATH" "/d/dev/msys64/usr/bin:/usr/sbin:/sbin:/usr/bin:.:/usr/local/bin:/mingw/bin:/bin:~/bin:/d/dev/UnxUtils/bin")
	)
    (progn
      (setq explicit-shell-file-name my_old_cmd)
      (setq shell-file-name  explicit-shell-file-name) 
      (setq ediff-shell     explicit-shell-file-name)    ; Ediff shell
      (setq explicit-shell-args       nil)
      (setenv "SHELL" explicit-shell-file-name)
      (setenv "PATH" my_old_cmd_path))
    ))

(msys_bash)
(msys_bash)

