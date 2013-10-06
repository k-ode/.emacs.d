;; No annyoing end of file sound
(setq visible-bell t)

;; No blinking cursor
(blink-cursor-mode -1)

;; Highlight current line
(global-hl-line-mode 1)

;; Highligt current parenthesis
;;(show-paren-mode t)
;;(setq show-paren-style 'parenthesis)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; I really like this theme
(when is-linux
  (load-theme 'gruber-darker t))
;;(load-theme 'github t)

(defun theme-light ()
  (interactive)
  (load-theme 'solarized-light t))

(defun theme-dark ()
  (interactive)
  (load-theme 'solarized-dark t))

(when is-windows
  (theme-light))

;; Clean up clutter in mode line
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "tagedit" '(diminish 'tagedit-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "whitespace" '(diminish 'whitespace-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))

(eval-after-load "js2-mode"
  '(defadvice js2-mode (after js2-rename-modeline activate)
     (setq mode-name "JS2")))
(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(provide 'appearance)
