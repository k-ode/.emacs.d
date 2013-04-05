;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)

;; Should be able to eval and replace anywhere
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; Be smarter about when a line begins. 
(global-set-key (kbd "C-a") 'smart-line-beginning)

;; Pull line up
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

;; Clever newlines
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<C-return>") 'open-line-below)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Expand region
(global-set-key (kbd "C-'") 'er/expand-region)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M-'") 'mc/mark-all-like-this-dwim)

;; Move lines around
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

;; Occur and imenu
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c i") 'idomenu)

;; Multi occur
(global-set-key (kbd "M-s m") 'multi-occur)
(global-set-key (kbd "M-s M") 'multi-occur-in-matching-buffers)

;; Switch between ido modes
(global-set-key (kbd "C-c d") 'switch-ido-mode)

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

(provide 'key-bindings)
