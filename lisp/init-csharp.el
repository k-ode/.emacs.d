(autoload 'csharp-mode "csharp-mode" "C# Mode" t)
(setq auto-mode-alist (append '(("\\.cs$" . csharp-mode))
                              auto-mode-alist))

(setq auto-mode-alist (append '(("\\.aspx$" . html-mode))
                              auto-mode-alist))
(setq auto-mode-alist (append '(("\\.ascx$" . html-mode))
                              auto-mode-alist))
(setq auto-mode-alist (append '(("\\.cshtml$" . html-mode))
                              auto-mode-alist))

;; Reduce font locked keywords in chsarp mode
(make-variable-buffer-local 'font-lock-type-face)
(copy-face 'font-lock-type-face 'csharp-type-face)
(set-face-foreground 'csharp-type-face "2aa889")

(require-package 'company)
(require-package 'omnisharp)

(defun csharp-mode-fn ()
  ;;(use-local-map nil)
  (setq font-lock-type-face 'csharp-type-face)  
  (add-to-list 'company-backends 'company-omnisharp)
  (make-variable-buffer-local 'company-minimum-prefix-length)
  (setq company-minimum-prefix-length 0)
  (make-variable-buffer-local 'company-idle-delay)
  (setq company-idle-delay 0.3)
  (setq c-basic-offset 4)
  (omnisharp-mode)
  (c-set-offset 'substatement-open 0))

(add-hook 'csharp-mode-hook 'csharp-mode-fn t)

(provide 'init-csharp)
