;; Javascript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))

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

