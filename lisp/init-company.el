(require-package 'company)

(require-package 'helm-css-scss)

(setq helm-css-scss-split-direction 'split-window-vertically)

(setq helm-display-header-line nil)
(set-face-attribute 'helm-source-header nil :height 0.1)

(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(setq helm-split-window-in-side-p t)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-minimum-prefix-length 2
      company-selection-wrap-around t
      company-show-numbers t
      company-tooltip-align-annotations t
      company-require-match nil
      company-dabbrev-downcase nil)

(provide 'init-company)
