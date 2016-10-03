(defun kg-projectile-js-references ()
  (interactive)
  (let ((regexp (thing-at-point 'symbol)))
    (if (fboundp 'projectile-project-root)
        (pt-regexp regexp
                   (projectile-project-root)
                   (append (list "-G \"\.js$\"")
                           (mapcar (lambda (val) (concat "--ignore=" val))
                                   (append projectile-globally-ignored-files
                                           projectile-globally-ignored-directories
                                           grep-find-ignored-directories
                                           grep-find-ignored-files))))
      (error "Projectile is not available"))))

(defun kg-ide-js-enable ()
  (progn
    (tide-setup)
    (highlight-symbol-nav-mode 1)
    (highlight-symbol-mode 1)
    (eldoc-mode 1)
    (setq-local company-idle-delay 0.33)
    (setq-local flycheck-check-syntax-automatically '(mode-enabled save))
    (add-hook 'js2-mode-hook #'tide-setup)))

(defun kg-ide-js-activate ()
  (interactive)
  (progn                                          
    (kg-ide-js-enable)
    (add-hook 'js2-mode-hook #'kg-ide-js-enable)))

(defun kg-ide-js-disable ()
  (highlight-symbol-nav-mode -1)
  (highlight-symbol-mode -1)
  (eldoc-mode -1)
  (setq-local company-idle-delay nil)
  (setq-local flycheck-check-syntax-automatically nil)
  ;; tide
  (setq-local eldoc-documentation-function 'ignore)
  (setq-local imenu-auto-rescan nil)
  (setq-local imenu-create-index-function 'js2-mode-create-imenu-index)
  (kill-process "tsserver")
  (remove-hook 'js2-mode-hook #'tide-setup)
  (eldoc-remove-command 'typescript-insert-and-indent)
  )

(defun kg-ide-js-deactivate ()
  (interactive)
  (progn
    (kg-ide-js-disable)
    (remove-hook 'js2-mode-hook #'kg-ide-js-disable)))

(provide 'kg-javascript)
