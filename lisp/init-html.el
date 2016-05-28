(use-package sgml-mode
  :init
  (setq auto-mode-alist (append '(("\\.aspx$" . html-mode))
                                auto-mode-alist))
  (setq auto-mode-alist (append '(("\\.ascx$" . html-mode))
                                auto-mode-alist))
  (setq auto-mode-alist (append '(("\\.cshtml$" . html-mode))
                                auto-mode-alist))
  :config
  ;; after deleting a tag, indent properly
  (defadvice sgml-delete-tag (after reindent activate)
    (indent-region (point-min) (point-max)))
  ;; don't include equal sign in symbols
  (modify-syntax-entry ?= "." html-mode-syntax-table)
  (bind-key [remap forward-paragraph] #'skip-to-next-blank-line html-mode-map)
  (bind-key [remap backward-paragraph] #'skip-to-previous-blank-line html-mode-map)
  (unbind-key "/" html-mode-map)
  (setq sgml-basic-offset 4))

(use-package tagedit
  :ensure t
  :init (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))
  :config
  (bind-key "C-M-<left>" #'tagedit-forward-barf-tag html-mode-map)
  (bind-key "C-M-<left>" #'tagedit-forward-barf-tag)
  (bind-key "C-M-<right>" #'tagedit-forward-slurp-tag html-mode-map)
  (bind-key "C-k" #'tagedit-kill html-mode-map)
  (bind-key "M-k" #'tagedit-kill-attribute html-mode-map)
  (bind-key "C-c C-w" #'html-wrap-in-tag html-mode-map)
  (tagedit-add-experimental-features))

(use-package simplezen
  :ensure t
  :config
  (set (make-local-variable 'yas/fallback-behavior)
       '(apply simplezen-expand-or-indent-for-tab)))

(provide 'init-html)
