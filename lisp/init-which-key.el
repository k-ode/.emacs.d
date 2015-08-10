(use-package which-key                  ; Show help popups for prefix keys
  :ensure t
  :init (which-key-mode)
  :config (progn (setq which-key-idle-delay 0.4)
                 
                 ;; Remove some package prefixes from which-key descriptions
                 (dolist (prefix '("projectile-"
                                   "flycheck-"))
                   (add-to-list 'which-key-description-replacement-alist
                                (cons prefix ""))))
  :diminish (which-key-mode . " Ⓚ"))

(provide 'init-which-key)
