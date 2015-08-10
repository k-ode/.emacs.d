(use-package helm                       ; Powerful minibuffer input framework
  :ensure t
  :bind (("C-c c b" . helm-resume))
  :init (progn (helm-mode 1)
               (with-eval-after-load 'helm-config
                 (warn "`helm-config' loaded! Get rid of it ASAP!")))
  :config (progn (helm-autoresize-mode 1)
                 (setq helm-autoresize-max-height 30)
                 (setq helm-autoresize-min-height 30)
                 (setq helm-split-window-in-side-p t))
  :diminish helm-mode)

(use-package helm-misc                  ; Misc helm commands
  :ensure helm
  :bind (([remap switch-to-buffer] . helm-mini)))

(use-package helm-command               ; M-x in Helm
  :ensure helm
  :bind (([remap execute-extended-command] . helm-M-x)))

(use-package helm-buffers               ; Helm for buffer management
  :ensure helm
  :defer t
  :config (setq helm-buffers-fuzzy-matching t))

(use-package helm-files                 ; Helm for file finding
  :ensure helm
  :defer t
  :bind (([remap find-file] . helm-find-files)
         ("C-x f" . helm-recentf))
  :config (setq helm-recentf-fuzzy-match t
                ;; Use recentf to find recent files
                helm-ff-file-name-history-use-recentf t))

(use-package helm-css-scss
  :ensure t
  :defer t
  :config (setq helm-css-scss-split-direction 'split-window-vertically))

(use-package helm-imenu                 ; Helm frontend for imenu
  :ensure helm
  :bind (("C-c i" . helm-imenu-in-all-buffers)
         ("C-c n" . helm-imenu))
  :config (setq helm-imenu-fuzzy-match t
                ;; Don't automatically jump to candidate if only one match,
                ;; because it makes the behaviour of this command unpredictable,
                ;; and prevents me from getting an overview over the buffer if
                ;; point is on a matching symbol.
                helm-imenu-execute-action-at-once-if-one nil))

(use-package helm-ring                  ; Helm commands for rings
  :ensure helm
  :bind (([remap yank-pop]        . helm-show-kill-ring)
         ([remap insert-register] . helm-register)))

(use-package helm-projectile            ; Helm frontend for Projectile
  :ensure t
  :defer t
  :init (with-eval-after-load 'projectile (helm-projectile-on))
  :config (setq projectile-switch-project-action #'helm-projectile))

(provide 'init-helm)
