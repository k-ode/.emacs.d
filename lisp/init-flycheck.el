(use-package flycheck                   ; On-the-fly syntax checking
  :ensure t
  :bind (("C-c e l" . list-flycheck-errors)
         ("C-c e n" . flycheck-next-error)
         ("C-c e p" . flycheck-previous-error)
         ("C-c e c" . flycheck-buffer)
         ("C-c e C" . flycheck-clear)
         ("C-c e f" . flycheck-first-error)
         ("C-c e w" . flycheck-copy-errors-as-kill)
         ("C-c t f" . flycheck-mode))
  :init (progn
          (global-flycheck-mode)
          (setq flycheck-global-modes '(js2-mode html-mode less-css-mode)))
  :config
  ;; Only check buffer syntax when saving file or enabling mode
  (progn (setq flycheck-check-syntax-automatically '(mode-enabled save))

          (defun lunaryorn-discard-undesired-html-tidy-error (err)
  "Discard ERR if it is undesired.
Tidy is very verbose, so we prevent Flycheck from highlighting
most errors from HTML Tidy."
  ;; A non-nil result means to inhibit further processing (i.e. highlighting)
  ;; of the error
  (and (eq (flycheck-error-checker err) 'html-tidy)
       ;; Only allow warnings about missing tags, or unexpected end tags being
       ;; discarded
       (not (string-match-p (rx (or "missing </" "discarding"))
                            (flycheck-error-message err)))))
          (add-hook 'flycheck-process-error-functions
                      #'lunaryorn-discard-undesired-html-tidy-error))
  
  :diminish (flycheck-mode . " Ⓢ"))

(provide 'init-flycheck)
