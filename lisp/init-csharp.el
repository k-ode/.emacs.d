(use-package csharp-mode
  :ensure t
  :defer t
  :config 
  (define-key c-mode-base-map (kbd "M-j") nil)
  (setq c-basic-offset 4)
  (subword-mode))

;; (require 'omnisharp)
;; (add-hook 'csharp-mode-hook 'omnisharp-mode)
;; (add-hook 'omnisharp-mode-hook 'flycheck-mode)
;; (setq omnisharp-use-http t)

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-omnisharp))

(provide 'init-csharp)
