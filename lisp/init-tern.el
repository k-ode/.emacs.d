(use-package tern
  :ensure t
  :defer t
  :init
  (setq tern-command (list "node" (expand-file-name "tern/bin/tern" user-emacs-directory) "--strip-crs"))
  (add-hook 'js2-mode-hook #'tern-mode))

(use-package company-tern
  :ensure t
  :after company
  :config (add-to-list 'company-backends 'company-tern))

(provide 'init-tern)
