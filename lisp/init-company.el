(require 'company)

(require-package 'helm-css-scss)

(setq helm-css-scss-split-direction 'split-window-vertically)
;; (setq helm-split-window-in-side-p t
;;       helm-buffers-fuzzy-matching t)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-minimum-prefix-length 2
      company-selection-wrap-around t
      company-show-numbers t
      company-tooltip-align-annotations t
      company-require-match nil
      company-dabbrev-downcase nil)

(require-package 'company-tern)

(add-to-list 'company-backends 'company-tern)

(provide 'init-company)
