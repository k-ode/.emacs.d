(require 'js2-refactor)

(setq-default js2-global-externs '("module" "require" "jQuery" "$" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "console" "JSON" "angular" "moment"))
(setq-default js2-indent-on-enter-key nil)
(setq-default js2-allow-rhino-new-expr-initializer nil)
(setq-default js2-auto-indent-p nil)
(setq-default js2-enter-indents-newline nil)
(setq-default js2-idle-timer-delay 0.1)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-concat-multiline-string 'eol)
(setq-default js2-rebind-eol-bol-keys nil)
(setq-default js2-mirror-mode nil)

;; Let flycheck handle parse errors
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-mode-show-strict-warnings nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

(add-hook 'js2-mode-hook (lambda () (flycheck-mode 1)))

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

;;(add-to-list 'load-path (expand-file-name "tern/emacs" site-lisp-dir))
;;(autoload 'tern-mode "tern.el" nil t)
;;(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;;(eval-after-load 'auto-complete
;;  '(eval-after-load 'tern
;;     '(progn
;;        (require 'tern-auto-complete)
;;        (tern-ac-setup))))

(provide 'setup-js2-mode)
