;; Clean up clutter in mode line
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "tagedit" '(diminish 'tagedit-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "guide-key" '(diminish 'guide-key-mode))
(eval-after-load "magit" '(diminish 'magit-auto-revert-mode))
(eval-after-load "company" '(diminish 'company-mode))
 
(require 'powerline)
(powerline-default-theme)

(provide 'init-modeline)
