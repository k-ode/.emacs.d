(use-package yasnippet                  ; Snippets
  :ensure t
  :defer t
  :init (progn
          ;; Use only own snippets, do not use bundled ones
          (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
          (yas-global-mode 1))
  :config (progn
            ;; Jump to end of snippet definition
            (bind-key "<return>" #'yas-exit-all-snippets yas-keymap)

            ;; No dropdowns please, yas
            (setq yas-prompt-functions '(yas-ido-prompt yas-completing-prompt))

            ;; Wrap around region
            (setq yas-wrap-around-region t))
  :diminish yas-minor-mode)

(provide 'init-yasnippet)
