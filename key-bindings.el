;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "<C-tab>") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)
(global-set-key (kbd "C-.") 'completion-at-point)

(global-set-key (kbd "C-c s") 'project-explorer-open)
(global-set-key (kbd "C-x C-b") 'ibuffer)

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

;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

;; Pull line up
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

;; Clever newlines
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "<M-return>") 'new-line-dwim)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Yank and indent
(global-set-key (kbd "C-S-y") 'yank-unindented)

;; Browse kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Expand region
(global-set-key (kbd "C-'") 'er/expand-region)

;; Multiple cursors
(global-set-key (kbd "C-c m a") 'mc/mark-all-dwim)
(global-set-key (kbd "C-c m m") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-ä") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m l") 'mc/mark-next-lines)
(global-set-key (kbd "C-c m r") 'mc/mark-all-in-region)
(global-set-key (kbd "C-c m e") 'mc/edit-lines)
(global-set-key (kbd "C-c m d") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c m b") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c m un") 'mc/unmark-next-like-this)
(global-set-key (kbd "C-c m up") 'mc/unmark-previous-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; Ace jump mode
(define-key global-map (kbd "C-å") 'ace-jump-mode)

;; Move lines around
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

;; Occur and imenu
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c i") 'imenu-anywhere)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; Find file in project
(global-set-key (kbd "C-x o") 'projectile-find-file)
(global-set-key (kbd "C-x p") 'projectile-switch-to-buffer)

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
