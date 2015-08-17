(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :config (setq undo-tree-mode-lighter ""))

(provide 'init-undo-tree)
