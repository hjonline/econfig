(provide 'set-mytex)

(add-to-list 'exec-path "D:/dev/Ghostgum/gsview")
(add-to-list 'exec-path "D:/dev/gs/gs9.02/bin")
(setq doc-view-ghostscript-program "D:/dev/gs/gs9.02/bin/gswin32c.exe")
(setq doc-view-dvipdf-program "D:/dev/texlive/2011/bin/win32/dvipdfm.exe")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(if (string-equal system-type "windows-nt")
    (require 'tex-mik))


(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; 为了使用 AucTeX 方便，为 LaTeX 模式 hook 自动换行，数学公式，reftex 和显示行号的功能。
(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))

;; 在 LaTeX mode 中，默认开启 PDF mode，即默认使用 xelatex 直接生成 pdf 文件，而不用每次用 ‘C-c C-t C-p’ 进行切换。设置 ‘Tex-show-compilation’ 为 t，在另一个窗口显示编译信息，对于错误的排除很方便。另外，编译时默认直接保存文件，绑定补全符号到 TAB 键。
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

