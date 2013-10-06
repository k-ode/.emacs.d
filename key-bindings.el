;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)

(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)

help

;; I make a lot of mistakes
(global-set-key (kbd "C-_") 'undo-tree-undo)
(global-set-key (kbd "M-_") 'undo-tree-redo)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-x C-m") 'smex)

;; Should be able to eval and replace anywhere
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; Be smarter about when a line begins 
(global-set-key (kbd "C-a") 'smart-line-beginning)

;; Pull line up
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

;; Clever newlines
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<C-return>") 'open-line-below)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Yank and indent
(global-set-key (kbd "C-S-y") 'yank-unindented)

;; Expand region
(global-set-key (kbd "C-'") 'er/expand-region)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M-'") 'mc/mark-all-like-this-dwim)

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Move lines around
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

;; Occur and imenu
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-x C-i") 'idomenu)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)
(autoload 'magit-status "magit")

;; Multi occur
;;(global-set-key (kbd "") 'multi-occur)
;;(global-set-key (kbd "") 'multi-occur-in-matching-buffers)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c C-f") 'projectile-find-file)

;; Get recent files
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

;; Buffer file functions
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)   
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; View occurrence in occur mode
(define-key occur-mode-map (kbd "v") 'occur-mode-display-occurrence)
(define-key occur-mode-map (kbd "n") 'next-line)
(define-key occur-mode-map (kbd "p") 'previous-line)

;; Show only line numbers when using goto
(global-set-key [remap goto-line] 'goto-line-with-feedback)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

(provide 'key-bindings)
