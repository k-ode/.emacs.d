(use-package projectile                 ; Project management for Emacs
  :ensure t
  :init (projectile-global-mode)
  :config
  (progn
    (setq projectile-mode-line '(:propertize
                           (:eval (concat " " (projectile-project-name)))
                           face bold))
    (setq projectile-completion-system 'ido)
    (setq projectile-indexing-method 'alien)
    (setq projectile-enable-caching t)
    (bind-key "C-x o" #'projectile-find-file))
  :diminish projectile-mode)

(provide 'init-projectile)
