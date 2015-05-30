;; Truncate task
(setq org-clock-heading-function
      (lambda ()
        (substring (nth 4 (org-heading-components)) 0 16)))

;; Org-mode is silly
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

(provide 'init-org)
