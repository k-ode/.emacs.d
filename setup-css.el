(require 'rainbow-mode)

(add-hook 'css-mode-hook 
          (lambda () 
            (rainbow-mode 1)))

(after-load 'auto-complete
            (dolist (hook '(css-mode-hook))
              (add-hook hook 'ac-css-mode-setup)))

(provide 'setup-css)
