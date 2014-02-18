;; Don't hide details initially
(setq-default diredp-hide-details-initially-flag nil)

;; Human readable dired
(require 'dired-details+)
(setq-default dired-listing-switches "-alhv")
(setq dired-details-hidden-string "")
(setq dired-details-propagate-flag t)

;; Allow copying between panes
(setq dired-dwim-target t)

;; Copy directory trees
(setq dired-recursive-copies 'always)

(provide 'setup-dired)
