(use-package smartparens                ; Parenthesis editing and balancing
  :ensure t
  :init (progn
          (require 'smartparens-config) 
          (smartparens-global-mode)
          (show-smartparens-global-mode))
  :config (progn
            (sp-with-modes '(js-mode js2-mode)
              (sp-local-pair "'" "'"))

            (bind-key "C-M-f" #'sp-forward-sexp sp-keymap)
            (bind-key "C-M-b" #'sp-backward-sexp sp-keymap)

            (bind-key "C-M-n" #'sp-next-sexp sp-keymap)
            (bind-key "C-M-p" #'sp-previous-sexp sp-keymap)

            (bind-key "C-M-k" #'sp-kill-sexp sp-keymap)
            (bind-key "C-M-w" #'sp-copy-sexp sp-keymap))
  :diminish smartparens-mode)

(provide 'init-smartparens)
