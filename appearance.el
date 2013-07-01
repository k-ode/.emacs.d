;; No annyoing end of file sound
(setq visible-bell t)

;; No blinking cursor
(blink-cursor-mode -1)

;; Highlight current line
(global-hl-line-mode 1)

;; Highligt current parenthesis
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; I really like this theme
;;(load-theme 'zenburn t)
;;(load-theme 'github t)
(load-theme 'solarized-dark t)

(provide 'appearance)

