(use-package company                    ; Graphical (auto-)completion
  :ensure t
  :init (global-company-mode)
  :config
  (progn
    (setq company-minimum-prefix-length 2
          company-selection-wrap-around t
          company-show-numbers t
          company-tooltip-align-annotations t
          company-require-match nil
          company-dabbrev-downcase nil))
  :diminish company-mode)

(provide 'init-company)
