(use-package tern
  :init (autoload 'tern-mode "tern.el" nil t)
  :bind ((("C-ö" . tern-highlight-refs)))
  :config
  (after-load 'tern 
    (setq tern-command (list "node" (expand-file-name "tern/bin/tern" user-emacs-directory) "--strip-crs"))
    (require 'company-tern)
    (add-to-list 'company-backends 'company-tern)
    (add-hook 'js2-mode-hook 'tern-mode)))

(provide 'init-tern)
