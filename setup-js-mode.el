;; (add-hook 'js-mode-hook (lambda () (flycheck-mode 1)))

;; Use lambda for anonymous functions
(font-lock-add-keywords
 'js-mode `(("\\(function\\) *("
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "\u0192")
                       nil)))))

;; Use right arrow for return in one-line functions
(font-lock-add-keywords
 'js-mode `(("function *([^)]*) *{ *\\(return\\) "
             (0 (progn (compose-region (match-beginning 1)
                                       (match-end 1) "\u2190")
                       nil)))))

(setq tern-ac-on-dot nil)
(add-to-list 'load-path (expand-file-name "tern/emacs" site-lisp-dir))
(autoload 'tern-mode "tern.el" nil t)
;;(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'auto-complete
  '(eval-after-load 'tern
     '(progn
        (require 'tern-auto-complete)
        (define-key js-mode-map (kbd "C-c C-a") 'tern-ac-complete)
        (tern-ac-setup))))

(provide 'setup-js-mode)

