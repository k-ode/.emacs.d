(use-package ido
  :init (progn
          (ido-mode t))
          ;;(ido-everywhere t))
  :config
  (progn ;; Always rescan buffer for imenu
    (set-default 'imenu-auto-rescan t)
    (add-to-list 'ido-ignore-directories "target")
    (add-to-list 'ido-ignore-directories "node_modules")
    (setq ido-enable-prefix nil
          ido-enable-flex-matching t
          ido-case-fold nil
          ido-auto-merge-work-directories-length -1
          ido-create-new-buffer 'always
          ido-use-filename-at-point nil
          ido-max-prospects 10)))

(use-package flx
  :ensure t)

(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1)
  :config (progn
            (setq ido-use-faces nil)
            (setq flx-ido-threshold 200)))

(use-package ido-vertical-mode
  :ensure t
  :init (ido-vertical-mode)
  :config (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))

;; Ido at point (C-,)
(use-package ido-at-point
  :ensure t
  :init (ido-at-point-mode))

(use-package ido-ubiquitous
  :ensure t
  :init (ido-ubiquitous-mode 1))

(provide 'init-ido)
