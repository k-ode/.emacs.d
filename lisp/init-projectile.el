(use-package projectile                 ; Project management for Emacs
  :ensure t
  :init (projectile-global-mode)
  :config
  (progn
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
  :config
  (setq projectile-switch-project-action #'helm-projectile)
  ;; Unbind keys for functions that don't work on windows
  (unbind-key "C-c p s a" projectile-mode-map)
  (unbind-key "C-c p s g" projectile-mode-map)
  (bind-key "C-c p s g" #'projectile-grep))

(provide 'init-projectile)
