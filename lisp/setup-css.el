(require 'rainbow-mode)

(add-hook 'css-mode-hook 
          (lambda () 
            (rainbow-mode 1)))

(add-hook 'less-mode-hook (lambda () (flycheck-mode t)))

(after-load 'auto-complete
            (dolist (hook '(css-mode-hook))
              (add-hook hook 'ac-css-mode-setup)))

(setq scss-compile-at-save nil)

(provide 'setup-css)