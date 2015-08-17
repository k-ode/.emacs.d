(use-package sgml-mode
  :init
  (progn
    (setq auto-mode-alist (append '(("\\.aspx$" . html-mode))
                                  auto-mode-alist))
    (setq auto-mode-alist (append '(("\\.ascx$" . html-mode))
                                  auto-mode-alist))
    (setq auto-mode-alist (append '(("\\.cshtml$" . html-mode))
                                  auto-mode-alist)))
  :config
  (progn
    ;; after deleting a tag, indent properly
    (defadvice sgml-delete-tag (after reindent activate)
      (indent-region (point-min) (point-max)))

    ;; don't include equal sign in symbols
    (modify-syntax-entry ?= "." html-mode-syntax-table)

    (define-key html-mode-map [remap forward-paragraph] 'skip-to-next-blank-line)
    (define-key html-mode-map [remap backward-paragraph] 'skip-to-previous-blank-line)
    (define-key html-mode-map (kbd "/") nil)

    (setq sgml-basic-offset 4)))

(use-package tagedit
  :ensure t
  :init (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))
  :config
  (progn
    (define-key html-mode-map (kbd "C-M-<left>") 'tagedit-forward-barf-tag)
    (define-key html-mode-map (kbd "C-M-<right>") 'tagedit-forward-slurp-tag)
    (define-key html-mode-map (kbd "C-k") 'tagedit-kill)
    (define-key html-mode-map (kbd "M-k") 'tagedit-kill-attribute)
    (define-key html-mode-map (kbd "C-c C-w") 'html-wrap-in-tag)
    (tagedit-add-experimental-features)))

(use-package simplezen
  :ensure t
  :config
  (progn
    (set (make-local-variable 'yas/fallback-behavior)
         '(apply simplezen-expand-or-indent-for-tab))))

(provide 'init-html)
