(setq markdown-command "pandoc")
 
(setq web-mode-indent-style 4)
(define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

(setq debug-on-error nil)

;; Wanna use enter as newline and indent
(defun my-coding-config ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "<S-return>") 'newline))

(mapc
 (lambda (language-mode-hook)
   (add-hook language-mode-hook 'my-coding-config))
 '(css-mode-hook
   emacs-lisp-mode-hook
   js2-mode-hook
   less-mode-hook
   html-mode-hook
   csharp-mode-hook))

;; I prefer to read files side by side
(setq ediff-split-window-function (quote split-window-horizontally))

(setq fill-column 80)

;; Don't save temporary files in same directory, please
(setq temporary-file-directory "~/.emacs.d/tmp/")

(provide 'init-misc)
