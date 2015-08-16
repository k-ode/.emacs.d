(use-package rainbow-mode
  :ensure t
  :init (dolist (hook '(css-mode-hook html-mode-hook))
          (add-hook hook 'rainbow-mode))
  :diminish rainbow-mode)

(provide 'init-rainbow-mode)
