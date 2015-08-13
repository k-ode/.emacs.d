(use-package csharp-mode
  :ensure t
  :config (progn
            (setq c-basic-offset 4)
            (subword-mode)
            ;;(c-set-offset 'substatement-open 0)))
            ))

(provide 'init-csharp)
