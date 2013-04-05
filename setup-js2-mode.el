(require 'js2-refactor)

(setq-default js2-global-externs '("module" "require" "jQuery" "$" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "console" "JSON"))

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

;; Smart tabs in js2-mode
(add-hook 'js2-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice js2-indent-line js2-basic-offset)

(provide 'setup-js2-mode)
