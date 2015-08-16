(use-package less-css-mode
  :ensure t)

(use-package scss-mode
  :ensure t
  :init (autoload 'scss-mode "scss-mode")
  :config (progn
            (add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
            (setq scss-compile-at-save nil)))

(use-package css-eldoc
  :ensure t
  :init (autoload 'turn-on-css-eldoc "css-eldoc")
  :config (add-hook 'css-mode-hook #'turn-on-css-eldoc))

(provide 'init-css)
