(use-package csharp-mode
  :ensure t
  :defer t
  :config 
  (define-key c-mode-base-map (kbd "M-j") nil)
  (setq c-basic-offset 4)
  (subword-mode))

(provide 'init-csharp)
