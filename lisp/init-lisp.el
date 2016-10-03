(use-package elisp-mode                 ; Emacs Lisp editing
  :defer t
  :config (progn
            (defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
              (setq mode-name "ELisp"))))

(use-package ielm
  :config (add-hook 'ielm-mode-hook #'eldoc-mode))

(use-package eldoc                      ; Documentation in minibuffer
  :defer t
  :init (progn
          (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)
          (add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
          (add-hook 'lisp-interaction-mode-hook #'eldoc-mode))
  :diminish eldoc-mode)

(provide 'init-lisp)
