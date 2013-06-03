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

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

;; js2-mode steals TAB, let's steal it back for yasnippet
(defun js2-tab-properly ()
  (interactive)
  (let ((yas/fallback-behavior 'return-nil))
    (unless (yas/expand)
      (indent-for-tab-command)
      (if (looking-back "^\s*")
          (back-to-indentation)))))

(define-key js2-mode-map (kbd "TAB") 'js2-tab-properly)

;; steal back alt-j
(define-key js2-mode-map (kbd "M-j") '(lambda () (interactive) (join-line -1)))

(provide 'setup-js2-mode)
