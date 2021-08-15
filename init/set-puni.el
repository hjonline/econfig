(provide 'set-puni)

(require 'puni)
; enable puni-global-mode to enable them everywhere,
; and add puni-disable-puni-mode to mode hooks where you don't want to use Puni
(puni-global-mode)
(add-hook 'term-mode-hook #'puni-disable-puni-mode)

; enable puni-mode only for programming and structured markup languages
(use-package puni
  :defer t
  :init
  (dolist (hook '(prog-mode sgml-mode nxml-mode tex-mode))
    (add-hook hook #'puni-mode)))


; Minibuffer keypad mode is a package that allows you to avoid Ctrl, Meta in Emacs minibuffers.
; After opened the minibuffer, you can input as usual.
; Then when you press SPC with other characters, it will input a space and the character.
; When you press SPC in twice time, you can open or close keypad mode.
; In the keypad mode, the character you input will be dotted with prefix.
; They can be C- , M- or C-M- . You can use ~,~ (for C-), .
;(for M-) and / (for C-M-) to change the current prefix if the prefix you input is not equal to current prefix.
; 用法： 默认打开是输入状态，按空格后接内容也就是普通输入空格后再插入文字。按两次空格就进入或者退出 keypad 模式；
; 可以用 , . / 进行切换快捷键前缀， , 是 C- 、 . 是 M- 、 / 是 C-M- ，
;如果输入的那个字符所对应的前缀和当前前缀相同，就直接输入；否则切换当前前缀。
(require 'minibuffer-keypad-mode)
(minibuffer-keypad-mode-setup t)
