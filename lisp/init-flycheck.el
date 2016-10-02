(use-package flycheck                   ; On-the-fly syntax checking
  :ensure t
  :bind (("C-c e l" . list-flycheck-errors)
         ("C-c e n" . flycheck-next-error)
         ("C-c e p" . flycheck-previous-error))
  :config
  ;; Only check buffer syntax when saving file or enabling mode
  (progn (setq flycheck-check-syntax-automatically '(mode-enabled save))
         (setq-default flycheck-disabled-checkers
                       (append flycheck-disabled-checkers
                               '(javascript-jshint javascript-tide))))
  :diminish flycheck-mode)

(provide 'init-flycheck)
