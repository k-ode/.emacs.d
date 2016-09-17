(use-package company                    ; Graphical (auto-)completion
  :ensure t
  :init (global-company-mode)
  :config
  (progn
    (define-key company-active-map (kbd "<tab>") nil)
    (setq company-minimum-prefix-length 1
          company-idle-delay 0.1
          company-selection-wrap-around t
          company-show-numbers t
          company-tooltip-align-annotations t
          company-require-match nil
          company-dabbrev-downcase nil))
  :diminish company-mode)

(provide 'init-company)
