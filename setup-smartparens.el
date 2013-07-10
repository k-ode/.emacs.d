(require 'smartparens-config)
(smartparens-global-mode t)

(show-smartparens-global-mode t)

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

(sp-with-modes '(html-mode sgml-mode)
  (sp-local-pair "<" ">"))

(sp-with-modes '(js-mode)
  (sp-local-pair "'" "'"))

(provide 'setup-smartparens)
