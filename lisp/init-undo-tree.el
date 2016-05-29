(use-package undo-tree
  :ensure t
  :bind (("C--" . undo-tree-undo)
         ("M--" . undo-tree-redo))
  :init (global-undo-tree-mode)
  :diminish undo-tree-mode)

(provide 'init-undo-tree)
