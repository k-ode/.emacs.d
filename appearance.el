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

(provide 'appearance)

