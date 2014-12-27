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

;;(js2r-add-keybindings-with-prefix "C-c r")
(define-key js2-mode-map (kbd "C-c C-m a") 'js2r-extract-function)
(define-key js2-mode-map (kbd "C-c C-m b") 'js2r-extract-method)
(define-key js2-mode-map (kbd "C-c C-m c") 'js2r-introduce-parameter)
(define-key js2-mode-map (kbd "C-c C-m d") 'js2r-localize-parameter)
(define-key js2-mode-map (kbd "C-c C-m e") 'js2r-expand-function)
(define-key js2-mode-map (kbd "C-c C-m f") 'js2r-contract-function)
(define-key js2-mode-map (kbd "C-c C-m g") 'js2r-expand-array)
(define-key js2-mode-map (kbd "C-c C-m h") 'js2r-contract-array)
(define-key js2-mode-map (kbd "C-c C-m i") 'js2r-wrap-buffer-in-iife)
(define-key js2-mode-map (kbd "C-c C-m j") 'js2r-inject-global-in-iife)
(define-key js2-mode-map (kbd "C-c C-m k") 'js2r-add-to-globals-annotation)
(define-key js2-mode-map (kbd "C-c C-m l") 'js2r-extract-var)
(define-key js2-mode-map (kbd "C-c C-m m") 'js2r-inline-var)
(define-key js2-mode-map (kbd "C-c C-m n") 'js2r-rename-var)
(define-key js2-mode-map (kbd "C-c C-m o") 'js2r-var-to-this)
(define-key js2-mode-map (kbd "C-c C-m p") 'js2r-arguments-to-object)
(define-key js2-mode-map (kbd "C-c C-m q") 'js2r-ternary-to-if)
(define-key js2-mode-map (kbd "C-c C-m r") 'js2r-split-var-declaration)
(define-key js2-mode-map (kbd "C-c C-m s") 'js2r-split-string)
(define-key js2-mode-map (kbd "C-c C-m t") 'js2r-unwrap)
(define-key js2-mode-map (kbd "C-c C-m v") 'js2r-log-this)
(define-key js2-mode-map (kbd "C-c C-m w") 'js2r-forward-slurp)
(define-key js2-mode-map (kbd "C-c C-m x") 'js2r-forward-barf)

(define-key js2-mode-map (kbd "C-k") 'js2r-kill)

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
