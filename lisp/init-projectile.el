(use-package projectile                 ; Project management for Emacs
  :ensure t
  :init (projectile-global-mode)
  :config
  (progn
    (run-with-idle-timer 10 nil #'projectile-cleanup-known-projects)
    (setq projectile-completion-system 'helm
          projectile-find-dir-includes-top-level t)
    (setq projectile-indexing-method 'alien)
    (setq projectile-enable-caching t)
    (bind-key "<f5>" #'projectile-compile-project))
  :diminish projectile-mode)

(use-package helm-projectile            ; Helm frontend for Projectile
  :ensure t
  :defer t
  :bind (("C-x o" . projectile-find-file))
  :after projectile
  :init (helm-projectile-on)
  :config (setq projectile-switch-project-action #'helm-projectile))

(provide 'init-projectile)
