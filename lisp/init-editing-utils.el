;; Represent undo-history as an actual tree (visualize with C-x u)
(require-package 'undo-tree)
(setq undo-tree-mode-lighter "")
(global-undo-tree-mode)

;; Smooth scroll -- keep cursor away from edges
(require-package 'smooth-scrolling)

;; Don't break lines
(setq-default truncate-lines t)

;; No annyoing end of file sound
(setq visible-bell t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Show column number
(column-number-mode 1)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Highlight current line
(global-hl-line-mode 1)

;; Up-down case is confusing, apparently.
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(provide 'init-editing-utils)
