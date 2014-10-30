(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-minimum-prefix-length 2
      company-selection-wrap-around t
      company-show-numbers t
      company-tooltip-align-annotations t
      company-require-match nil
      company-dabbrev-downcase nil)

(provide 'setup-company)
