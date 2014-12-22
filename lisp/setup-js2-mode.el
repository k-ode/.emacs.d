(require 'js2-mode)
(require-package 'js2-refactor)

;; (add-to-list 'company-backends 'company-tern)
;; (add-to-list 'load-path "~/.emacs.d/tern/emacs/")
;; (autoload 'tern-mode "tern.el" nil t)

(defun my-tern-project-dir ()
  (and (not (buffer-file-name)) "")
  (let ((project-dir (file-name-directory (buffer-file-name))))
    (loop for cur = project-dir then (let ((shorter (file-name-directory (substring cur 0 (1- (length cur))))))
                                       (and (< (length shorter) (length cur)) shorter))
          while cur do
          (when (file-exists-p (expand-file-name ".tern-project" cur))
            (return (setf project-dir cur))))
    project-dir))

(defun delete-tern-port-file ()
  (interactive)
  (delete-file (expand-file-name ".tern-port" (my-tern-project-dir))))

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . javascript-mode))

(eval-after-load "js2-mode"
  '(defadvice js2-mode (after js2-rename-modeline activate)
     (setq mode-name "JS2")))

(js2r-add-keybindings-with-prefix "C-c r")

;; Indendt case labels on extra level
(setq-default js2-indent-switch-body t)
;; Globals
(setq-default js2-global-externs '("module" "require" "jQuery" "$" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "console" "JSON" "angular" "moment" "opto" "op"))
;; Delay in seconds before re-parsing
(setq-default js2-idle-timer-delay 0.1)
;; js2-line-break sets + at the end
(setq-default js2-concat-multiline-strings 'eol)

;; Let flycheck handle parse errors
(setq-default js2-allow-rhino-new-expr-initializer nil)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-mode-show-parse-errors nil)
(setq-default js2-mode-show-strict-warnings nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

(add-hook 'js2-mode-hook (lambda () (flycheck-mode t)))
;;(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

;; Use lambda for anonymous functions
(font-lock-add-keywords
 'js2-mode `(("\\(function\\) *("
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "\u0192")
                        nil)))))

;; Use right arrow for return in one-line functions
(font-lock-add-keywords
 'js2-mode `(("function *([^)]*) *{ *\\(return\\) "
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "\u2190")
                        nil)))))

;; steal back alt-j
(define-key js2-mode-map (kbd "M-j") '(lambda () (interactive)
                                        (join-line -1)
                                        (indent-for-tab-command)))
(define-key js2-mode-map (kbd "M-n") '(lambda () (interactive) (js2-line-break)))

(provide 'setup-js2-mode)
