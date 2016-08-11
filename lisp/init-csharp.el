(use-package csharp-mode
  :ensure t
  :defer t
  :config 
  (define-key c-mode-base-map (kbd "M-j") nil)
  (setq c-basic-offset 4)
  (subword-mode))

(use-package omnisharp
  :ensure t
  :defer t
  :config
  (setq omnisharp-host "http://localhost:2000/") 
  (add-to-list 'company-backends 'company-omnisharp))

(provide 'init-csharp)
