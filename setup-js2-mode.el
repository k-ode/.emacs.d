(require 'js2-refactor)

(setq-default js2-global-externs '("module" "require" "jQuery" "$" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "console" "JSON"))

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

(provide 'setup-js2-mode)
