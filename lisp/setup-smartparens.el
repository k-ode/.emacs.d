(require-package 'smartparens)

(require 'smartparens-config)
(smartparens-global-mode t)

;; highlight matching pairs
(show-smartparens-global-mode t)

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

(setq sp-autoescape-string-quote nil)

(sp-with-modes '(js-mode js2-mode)
  (sp-local-pair "'" "'"))

;; keybinding management
(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(provide 'setup-smartparens)
