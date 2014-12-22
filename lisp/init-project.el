(require-package 'project-explorer)

(require-package 'projectile)
(projectile-global-mode)

(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

(provide 'init-project)
