;; Truncate task
(setq org-clock-heading-function
      (lambda ()
        (s-left 8 (nth 4 (org-heading-components)))))

;; Org-mode is silly
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

(provide 'init-org)
