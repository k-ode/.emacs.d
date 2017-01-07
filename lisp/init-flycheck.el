(use-package flycheck                   ; On-the-fly syntax checking
  :ensure t
  :bind (("C-c e l" . list-flycheck-errors)
         ("C-c e n" . flycheck-next-error)
         ("C-c e p" . flycheck-previous-error))
  :init
  (progn
    (global-flycheck-mode)
    (setq flycheck-global-modes '(rjsx-mode js2-mode html-mode less-css-mode web-mode)))
  :config
  (progn (setq flycheck-check-syntax-automatically '(mode-enabled save))
         (setq-default flycheck-disabled-checkers
                       (append flycheck-disabled-checkers
                               '(javascript-jshint javascript-tide))))
  :diminish flycheck-mode)

(flycheck-define-checker javascript-eslint
  "A Javascript syntax and style checker using eslint.
See URL `https://github.com/eslint/eslint'."
  :command ("eslint" "--format=checkstyle"
            (option-list "--rulesdir" flycheck-eslint-rules-directories)
            "--stdin" "--stdin-filename" source-original)
  :standard-input t
  :error-parser flycheck-parse-checkstyle
  :error-filter
  (lambda (errors)
    (seq-do (lambda (err)
              ;; Parse error ID from the error message
              (setf (flycheck-error-message err)
                    (replace-regexp-in-string
                     (rx " ("
                         (group (one-or-more (not (any ")"))))
                         ")" string-end)
                     (lambda (s)
                       (setf (flycheck-error-id err)
                             (match-string 1 s))
                       "")
                     (flycheck-error-message err))))
            (flycheck-sanitize-errors errors))
    errors)
  :enabled (lambda () t)
  :modes (js-mode rjsx-mode js-jsx-mode js2-mode js2-jsx-mode js3-mode)
  :next-checkers ((warning . javascript-jscs))
  :verify
  (lambda (_)
    (let* ((default-directory
             (flycheck-compute-working-directory 'javascript-eslint))
           (have-config (flycheck-eslint-config-exists-p)))
      (list
       (flycheck-verification-result-new
        :label "config file"
        :message (if have-config "found" "missing")
        :face (if have-config 'success '(bold error)))))))

(provide 'init-flycheck)
