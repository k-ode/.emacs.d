(use-package cider
  :ensure t
  :init
  (add-hook 'cider-mode-hook #'eldoc-mode))

(use-package clj-refactor
  :ensure t)

(provide 'init-clojure)
