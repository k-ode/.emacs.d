;; Elips
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; CSS
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(autoload 'turn-on-css-eldoc "css-eldoc")
(add-hook 'css-mode-hook 'turn-on-css-eldoc)

;; Javascript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . javascript-mode))

;; C#
(autoload 'csharp-mode "csharp-mode" "C# Mode" t)
(setq auto-mode-alist (append '(("\\.cs$" . csharp-mode))
auto-mode-alist))

;; ASP.NET
(setq auto-mode-alist (append '(("\\.aspx$" . html-mode))
auto-mode-alist))
(setq auto-mode-alist (append '(("\\.ascx$" . html-mode))
auto-mode-alist))
(setq auto-mode-alist (append '(("\\.cshtml$" . html-mode))
auto-mode-alist))

(provide 'mode-mappings)
