(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

;; Indendt case labels on extra level
(setq-default js2-indent-switch-body t)
;; Globals
(setq-default js2-global-externs '("module" "require" "jQuery" "$" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "console" "JSON" "angular" "moment"))
;; Delay in seconds before re-parsing
(setq-default js2-idle-timer-delay 0.1)
;; js2-line-break sets + at the end
(setq-default js2-concat-multiline-strings 'eol)

;; Let flycheck handle parse errors
(setq-default js2-allow-rhino-new-expr-initializer nil)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-mode-show-strict-warnings nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

;;(add-hook 'js2-mode-hook (lambda () (flycheck-mode 1)))
;;(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

;; Use lambda for anonymous functions
(font-lock-add-keywords
 'js2-mode `(("\\(function\\) *("
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "\u0192")
                        nil)))))

;; Use right arrow for return in one-line functions
(font-lock-add-keywords
 'js2-mode `(("function *([^)]*) *{ *\\(return\\) "
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "\u2190")
                        nil)))))

;; steal back alt-j
(define-key js2-mode-map (kbd "M-j") '(lambda () (interactive) (join-line -1)))
(define-key js2-mode-map (kbd "M-n") '(lambda () (interactive) (js2-line-break)))

(provide 'setup-js2-mode)
