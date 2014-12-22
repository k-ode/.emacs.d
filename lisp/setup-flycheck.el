(require 'flycheck)

;; Only check buffer syntax when saving file or enabling mode
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(provide 'setup-flycheck)
