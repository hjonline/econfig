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

;; Ϊ��ʹ�� AucTeX ���㣬Ϊ LaTeX ģʽ hook �Զ����У���ѧ��ʽ��reftex ����ʾ�кŵĹ��ܡ�
(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))

;; �� LaTeX mode �У�Ĭ�Ͽ��� PDF mode����Ĭ��ʹ�� xelatex ֱ������ pdf �ļ���������ÿ���� ��C-c C-t C-p�� �����л������� ��Tex-show-compilation�� Ϊ t������һ��������ʾ������Ϣ�����ڴ�����ų��ܷ��㡣���⣬����ʱĬ��ֱ�ӱ����ļ����󶨲�ȫ���ŵ� TAB ����
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

