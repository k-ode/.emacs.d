;; No annyoing end of file sound
(setq visible-bell t)

;; No blinking cursor
(blink-cursor-mode -1)

;; Highlight current line
(global-hl-line-mode 1)

;; Highligt current parenthesis
;;(show-paren-mode t)
;;(setq show-paren-style 'parenthesis)

;; I really like this theme
(when is-linux
  (load-theme 'gruber-darker t))
;;(load-theme 'github t)

(when is-windows
  (load-theme 'solarized-dark t))

;; Clean up clutter in mode line
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "whitespace" '(diminish 'whitespace-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))

(eval-after-load "js2-mode"
  '(defadvice js2-mode (after js2-rename-modeline activate)
     (setq mode-name "JS2")))
(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(provide 'appearance)
