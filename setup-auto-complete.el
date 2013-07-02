(require 'auto-complete)
(require 'auto-complete-config)
(setq ac-expand-on-auto-complte nil)
(setq ac-auto-start nil)
(setq ac-dwim-nil)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(defun sanityinc/auto-complete-at-point ()
  (when (and (not (minibufferp))
             (fboundp 'auto-complete-mode)
             auto-complete-mode)
    (auto-complete)))

(defun set-auto-complete-as-completion-at-point-function ()
  (add-to-list 'completion-at-point-functions 'sanityinc/auto-complete-at-point))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(css-mode))
  (add-to-list 'ac-modes mode))

(defun sanity/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

(setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)

(provide 'setup-auto-complete)
