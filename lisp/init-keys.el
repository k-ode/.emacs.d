(define-key key-translation-map (kbd "C-5") (kbd "("))
(define-key key-translation-map (kbd "C-6") (kbd ")"))
(define-key key-translation-map (kbd "C-7") (kbd "{"))
(define-key key-translation-map (kbd "C-8") (kbd "["))
(define-key key-translation-map (kbd "C-9") (kbd "]"))
(define-key key-translation-map (kbd "C-0") (kbd "}"))

(when (string-equal system-type "windows-nt")
  (global-set-key (kbd "<apps>") 'execute-extended-command))

;; ;; I never use suspend frame
(global-unset-key (kbd "C-z")) 

;; ;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'company-complete)
(global-set-key (kbd "C-,") 'completion-at-point)

;; I make a lot of mistakes
(global-set-key (kbd "C--") 'undo-tree-undo)
(global-set-key (kbd "M--") 'undo-tree-redo)

;; Be smarter about when a line begins
(global-set-key (kbd "C-a") 'smart-line-beginning)

;; Pull line up
(global-set-key (kbd "M-j") (lambda ()
                               (interactive)
                               (join-line -1)
                               (indent-for-tab-command)))

(global-set-key (kbd "<C-backspace>") 'kill-region-or-backward-word)

(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "M-W") (lambda () (interactive) (save-region-or-current-line 1)))

;; Clever newlines
(global-set-key (kbd "<M-return>") 'new-line-dwim)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; ;; Buffer file functions
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; Show only line numbers when using goto
(global-set-key [remap goto-line] 'goto-line-with-feedback)

;; Project management 
(global-set-key (kbd "M-,") 'pop-tag-mark)

(provide 'init-keys)
