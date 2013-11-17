;; Up-down case is confusing, apparently.
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;;(setq global-auto-revert-non-file-buffers t)
;;(setq auto-revert-verbose nil)

;; Answering just y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

;; Smooth scroll
(require 'smooth-scrolling)

;; Set default encoding to utf-8
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Show column number
(column-number-mode 1)

;; Save list of recent files (open with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100)
(add-to-list 'recentf-exclude "\\.ido.last\\'")
(add-to-list 'recentf-exclude "\\archive-contents\\'")

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Don't need text in scratch
(setq initial-scratch-message "")

;; Org-mode is silly
(setq org-replace-disputed-keys t)

;; Don't break lines
(setq-default truncate-lines t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(global-undo-tree-mode)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(provide 'sane-defaults)
