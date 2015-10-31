(add-to-list 'auto-mode-alist '("\\.jshintrc$" . js-mode))
(add-hook 'js-mode-hook #'subword-mode)

(use-package json-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.json$" . json-mode)))

(use-package js2-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    (add-hook 'js2-mode-hook #'subword-mode)

    (eval-after-load "js2-mode"
      '(defadvice js2-mode (after js2-rename-modeline activate)
         (setq mode-name "JS2")))
    
    (after-load 'js2-mode
      ;; Indendt case labels on extra level
      (setq-default js2-indent-switch-body t)
      ;; Globals
      (setq-default js2-global-externs '("module" "require" "jQuery" "$" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "console" "JSON" "angular" "moment" "opto" "op"))
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
      (setq-default js2-strict-trailing-comma-warning nil)

      ;; steal back alt-j
      (define-key js2-mode-map (kbd "M-j") '(lambda () (interactive)
                                              (join-line -1)
                                              (indent-for-tab-command)))
      (define-key js2-mode-map (kbd "M-n") '(lambda () (interactive) (js2-line-break)))

      (js2-imenu-extras-setup)

      (font-lock-add-keywords
       'js-mode `(("\\(function\\) *("
                   (0 (progn (compose-region (match-beginning 1)
                                             (match-end 1) "\u0192")
                             nil)))))

      (font-lock-add-keywords
       'js-mode `(("function *([^)]*) *{ *\\(return\\) "
                   (0 (progn (compose-region (match-beginning 1)
                                             (match-end 1) "\u2190")
                             nil)))))

      (font-lock-add-keywords
       'js2-mode `(("function *([^)]*) *{ *\\(return\\) "
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "\u2190")
                              nil)))))

      (font-lock-add-keywords
       'js2-mode `(("\\(function\\) *("
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "\u0192")
                              nil)))))

      )))

(use-package js2-refactor
  :ensure js2-mode
  :config
  (progn
    (add-hook 'js2-mode-hook #'js2-refactor-mode)
    (define-key js2-mode-map (kbd "C-S-<down>") 'js2r-move-line-down)
    (define-key js2-mode-map (kbd "C-S-<up>") 'js2r-move-line-up)
    (define-key js2-refactor-mode-map (kbd "C-c r f") 'js2r-extract-function)
    (define-key js2-refactor-mode-map (kbd "C-c r F") 'js2r-contract-function)
    (define-key js2-refactor-mode-map (kbd "C-c r a") 'js2r-expand-array)
    (define-key js2-refactor-mode-map (kbd "C-c r A") 'js2r-contract-array)
    (define-key js2-refactor-mode-map (kbd "C-c r m") 'js2r-extract-method)
    (define-key js2-refactor-mode-map (kbd "C-c r p") 'js2r-introduce-parameter)
    (define-key js2-refactor-mode-map (kbd "C-c r P") 'js2r-localize-parameter)
    (define-key js2-refactor-mode-map (kbd "C-c r e") 'js2r-expand-function)
    (define-key js2-refactor-mode-map (kbd "C-c r i") 'js2r-wrap-buffer-in-iife)
    (define-key js2-refactor-mode-map (kbd "C-c r I") 'js2r-inject-global-in-iife)
    (define-key js2-refactor-mode-map (kbd "C-c r g") 'js2r-add-to-globals-annotation)
    (define-key js2-refactor-mode-map (kbd "C-c r v") 'js2r-extract-var)
    (define-key js2-refactor-mode-map (kbd "C-c r V") 'js2r-inline-var)
    (define-key js2-refactor-mode-map (kbd "C-c r r") 'js2r-rename-var)
    (define-key js2-refactor-mode-map (kbd "C-c r t") 'js2r-var-to-this)
    (define-key js2-refactor-mode-map (kbd "C-c r o") 'js2r-expand-object)
    (define-key js2-refactor-mode-map (kbd "C-c r O") 'js2r-arguments-to-object)
    (define-key js2-refactor-mode-map (kbd "C-c r ?") 'js2r-ternary-to-if)
    (define-key js2-refactor-mode-map (kbd "C-c r s") 'js2r-split-string)
    (define-key js2-refactor-mode-map (kbd "C-c r S") 'js2r-split-var-declaration)
    (define-key js2-refactor-mode-map (kbd "C-c r u") 'js2r-unwrap)
    (define-key js2-refactor-mode-map (kbd "C-c r l") 'js2r-log-this)
    (define-key js2-refactor-mode-map (kbd "C-c r d") 'js2r-debug-this)
    (define-key js2-refactor-mode-map (kbd "C-c r w") 'js2r-forward-slurp)
    (define-key js2-refactor-mode-map (kbd "C-c r W") 'js2r-forward-barf)
    (define-key js2-refactor-mode-map (kbd "C-k") 'js2r-kill))
  
  :diminish js2-refactor-mode)

(provide 'init-javascript)
