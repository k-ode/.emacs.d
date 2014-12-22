;; Save list of recent files (open with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100)
(add-to-list 'recentf-exclude "\\.ido.last\\'")
(add-to-list 'recentf-exclude "\\archive-contents\\'")

(savehist-mode 1)
(setq history-length 1000)

(provide 'init-sessions)
