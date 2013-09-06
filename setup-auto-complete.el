(require 'auto-complete)

;; (require 'auto-complete-config)
;; (global-auto-complete-mode t)

;; (setq ac-expand-on-auto-complete nil)
;; (setq ac-auto-start nil)
;; (setq ac-dwim nil)

;; (setq tab-always-indent 'complete)
;; (add-to-list 'completion-styles 'initials t)

;; (set-default 'ac-sources
;;             '(ac-source-imenu
;;               ac-source-dictionary
;;               ac-source-words-in-buffer
;;               ac-source-words-in-same-mode-buffers
;;               ac-source-words-in-all-buffer))

;; TODO: Find a way to make auto complete work in HTML mode
;; (dolist (mode '(html-mode))
;;  (add-to-list 'ac-modes mode))

;; (defun sanityinc/dabbrev-friend-buffer (other-buffer)
;;   (< (buffer-size other-buffer) (* 1 1024 1024)))

;; (setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)

(provide 'setup-auto-complete)
