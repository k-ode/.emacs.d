;;; Colourise CSS colour literals
(when (maybe-require-package 'rainbow-mode)
  (dolist (hook '(css-mode-hook html-mode-hook))
    (add-hook hook 'rainbow-mode)))

(requre-package 'less-css-mode)
(add-hook 'less-mode-hook (lambda () (flycheck-mode t)))

(require-package 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(require-package 'css-eldoc)
(autoload 'turn-on-css-eldoc "css-eldoc")
(add-hook 'css-mode-hook 'turn-on-css-eldoc)

(setq scss-compile-at-save nil)

(provide 'init-css)
