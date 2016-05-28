;; (defun run-omnisharp ()
;;   (interactive)
;;   (progn 
;;     (require 'omnisharp)
;;     (add-to-list 'company-backends 'company-omnisharp)
;;     (omnisharp-mode)
;;     (flycheck-mode)
;;     (add-hook 'csharp-mode-hook 'omnisharp-mode)
;;     (add-hook 'csharp-mode-hook 'flycheck-mode)))

;; (use-package csharp-mode
;;   :ensure t
;;   :config (progn
;;             (define-key c-mode-base-map (kbd "M-j") nil)
;;             (setq c-basic-offset 4)
;;             (subword-mode)
;;             ;;(c-set-offset 'substatement-open 0)))
;;             ))

(provide 'init-csharp)
