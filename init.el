;;; init.el --- Emacs configuration of Kim Grönqvist

;;; Commentary:

;; Emacs configuration of Kim Grönqvist.

;;; Code:

;; Please don't load outdated byte code
(setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-check-signature nil)

(package-initialize)
;; Bootstrap `use-package'

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)
(require 'diminish)

(use-package s
  :ensure t)

(use-package dash
  :ensure t)

(setq is-windows (equal system-type 'windows-nt))
(setq is-linux (equal system-type 'gnu/linux))

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq lisp-dir
      (expand-file-name "lisp" user-emacs-directory))

(setq user-custom-dir
      (expand-file-name "user-custom" user-emacs-directory))

(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Set up load path
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path user-custom-dir)
(add-to-list 'load-path lisp-dir)

;; Keep emacs custom-settings in separate file
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load custom-file)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)
;; Don't need text in scratch
(setq initial-scratch-message "")

(when window-system
  (setq frame-tqqitle-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

(setq debug-on-error nil)

;; Wanna use enter as newline and indent in programming modes
(dolist (fn '(prog-mode-hook html-mode-hook))
  (add-hook fn (lambda ()
                 (local-set-key (kbd "RET") 'newline-and-indent)
                 (local-set-key (kbd "<S-return>") 'newline))))

;; I prefer to read files side by side
(setq ediff-split-window-function (quote split-window-horizontally))

(setq fill-column 80)

;; Don't save temporary files in same directory, please
(setq temporary-file-directory "~/.emacs.d/tmp/")

(use-package autorevert                 ; Auto-revert buffers of changed files
  :init (global-auto-revert-mode)
  :config
  (setq auto-revert-verbose nil         ; Shut up, please!
        ;; Revert Dired buffers, too
        global-auto-revert-non-file-buffers t)
  :diminish auto-revert-mode)

;; Answering just y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

(use-package hydra
  :ensure t)

(use-package pt
  :ensure t
  :bind (("C-c p s t" . projectile-pt)))

(require 'init-themes)
(require 'init-undo-tree)
(require 'init-locales)
(require 'init-uniquify)
(require 'init-org)
(require 'init-lisp)
(require 'init-css)
(require 'init-csharp)
(require 'init-company)
(require 'init-javascript)
(require 'init-tern)
(require 'init-helm)
(require 'init-which-key)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-rainbow-mode)
(require 'init-ido)

;; Stop creating auto save files
(setq auto-save-default nil)
;; Stop creating lock files
(setq create-lockfiles nil)

;; ;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; ;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(setq history-length 1000               ; Store more history
      use-dialog-box nil                ; Never use dialogs for minibuffer input
      )

(use-package savehist                   ; Save minibuffer history
  :init (savehist-mode t)
  :config (setq savehist-save-minibuffer-history t
                savehist-autosave-interval 180))

(use-package recentf                    ; Save recently visited files
  :init (recentf-mode)
  :config
  (setq recentf-max-saved-items 200
        recentf-max-menu-items 15
        ;; Cleanup recent files only when Emacs is idle, but not when the mode
        ;; is enabled, because that unnecessarily slows down Emacs. My Emacs
        ;; idles often enough to have the recent files list clean up regularly
        recentf-auto-cleanup 300
        recentf-exclude (list "/\\.git/.*\\'" ; Git contents
                              "/elpa/.*\\'" ; Package files
                              ;; And all other kinds of boring files
                              #'ignoramus-boring-p)))

(use-package saveplace                  ; Save point position in files
  :init (save-place-mode 1))

(require 'setup-shell)
(require 'project-mappings)

;; Setup extensions
(eval-after-load 'org '(require 'init-org))

(require 'init-html)
(require 'init-dired)
(require 'init-hippie)
(require 'init-yasnippet)

(use-package idomenu
  :ensure t)

(use-package expand-region              ; Expand region by semantic units
  :ensure t
  :bind (("C-ä" . er/expand-region)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)
         ("C-S-<up>"      . mc/mark-previous-like-this)
         ("C-S-<down>"    . mc/mark-next-like-this)
         ("C-c o <SPC>" . mc/vertical-align-with-space)
         ("C-c o a"     . mc/vertical-align)
         ("C-c o e"     . mc/mark-more-like-this-extended)
         ("C-c o h"     . mc/mark-all-like-this-dwim)
         ("M-ä"         . mc/mark-all-like-this-dwim)
         ("C-c o l"     . mc/edit-lines)
         ("C-c o n"     . mc/mark-next-like-this)
         ("C-c o p"     . mc/mark-previous-like-this)
         ("C-c o C-a"   . mc/edit-beginnings-of-lines)
         ("C-c o C-e"   . mc/edit-ends-of-lines)
         ("C-c o C-s"   . mc/mark-all-in-region)))

;; Undo/redo window configuration with C-c <left>/<right>
(use-package winner-mode
  :init (winner-mode))

;; Change window quickly with S-left and S-right
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(use-package smooth-scrolling
  :ensure t)

;; Remove text in active region if inserting text
(use-package delsel
  :defer t
  :init (delete-selection-mode))

(use-package hl-line                    ; Highlight the current line
  :init (global-hl-line-mode 1))

(use-package subword                    ; Subword/superword editing
  :defer t
  :diminish subword-mode)

;; Setup key bindings
(require 'init-keys)

(use-package move-text
  :ensure t
  :bind (("<M-up>" . move-text-up)
         ("<M-down>" . move-text-down)))

(put 'scroll-left 'disabled nil)

;; Don't globally enable eldoc
(global-eldoc-mode -1)

;; Don't break lines
(setq-default truncate-lines t)

;; No annyoing end of file sound
(setq visible-bell t)

;; Show column number
(column-number-mode 1)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Up-down case is confusing, apparently.
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Just save the files
(setq compilation-ask-about-save nil)

(use-package anzu                       ; Position/matches count for isearch
  :ensure t
  :init (global-anzu-mode)
  :config (setq anzu-cons-mode-line-p nil)
  :diminish anzu-mode)

(use-package magit                      ; The one and only Git frontend
  :ensure t
  :bind (("C-c g s" . magit-status)
         ("C-c g b" . magit-blame)
         ("C-c g l" . magit-log-buffer-file)
         ("C-c g p" . magit-pull))
  :config
  ;; Shut up, Magit
  (setq magit-save-repository-buffers 'dontask
        magit-refs-show-commit-count 'all
        ;; Use separate buffers for one-file logs so that we don't need to reset
        ;; the filter everytime for full log view
        magit-log-buffer-file-locked t
        magit-display-buffer-function 'magit-display-buffer-fullframe-status-topleft-v1
        ;; This is creepy, Magit
        magit-revision-show-gravatars nil))

(use-package git-commit                 ; Git commit message mode
  :ensure t
  :defer t
  :config
  ;; Oh, really?  Come on… I know what I'm doing…
  (remove-hook 'git-commit-finish-query-functions
               #'git-commit-check-style-conventions))

(use-package highlight-symbol           ; Highlighting and commands for symbols
  :ensure t
  :defer t
  :init
  (dolist (fn '(highlight-symbol-nav-mode highlight-symbol-mode))
    (add-hook 'prog-mode-hook fn))
  :bind
  (("C-c s %" . highlight-symbol-query-replace)
   ("C-c s n" . highlight-symbol-next-in-defun)
   ("C-c s p" . highlight-symbol-prev-in-defun))
  ;; Navigate occurrences of the symbol under point with M-n and M-p, and
  ;; highlight symbol occurrences
  :config
  (setq highlight-symbol-idle-delay 0.4     ; Highlight almost immediately
        highlight-symbol-on-navigation-p t) ; Highlight immediately after
                                        ; navigation
  :diminish highlight-symbol-mode)

(use-package helm-ag
  :ensure t
  :bind (("C-c s s" . helm-projectile-ag)
         ("C-x ö" . helm-projectile-ag))
  :config
  (setq helm-ag-base-command "pt --nocolor --nogroup")
  (setq helm-ag-use-grep-ignore-list t))

(use-package ignoramus                  ; Ignore uninteresting files everywhere
  :ensure t
  :config 
  (ignoramus-setup))

(use-package newcomment                 ; Built-in comment features
  :bind (("C-c c" . comment-dwim)
         ("C-c u" . uncomment-region)))

(use-package ielm                       ; Emacs Lisp REPL
  :bind (("C-c a '" . ielm)))

(use-package elisp-mode                 ; Emacs Lisp editing
  :defer t
  :interpreter ("emacs" . emacs-lisp-mode)
  :bind (:map emacs-lisp-mode-map
              ("C-c m e r" . eval-region)
              ("C-c m e b" . eval-buffer)
              ("C-c m e e" . eval-last-sexp)
              ("C-c m e f" . eval-defun)))

(use-package wgrep
  :ensure t)

(use-package markdown-mode
  :ensure t
  :defer t
  :config
  (setq markdown-command "pandoc"))

(use-package rjsx-mode
  :ensure t)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (setq powerline-height 25)
  (setq powerline-default-separator 'wave))

(use-package eslint-fix
  :ensure t)

(use-package whitespace-cleanup-mode
  :ensure t)

;; comint stuff
(setq comint-prompt-read-only t)

(defun my-comint-preoutput-read-only (text)
  (propertize text 'read-only t))

(add-hook 'comint-preoutput-filter-functions
          'my-comint-preoutput-read-only)

(defun comint-previous-input (arg)
  "Cycle backwards with wrap-around through input history, saving input."
  (interactive "*p")
  (unless (and (eq comint-input-ring-index nil)
               (< arg 0))
    (if (and (eq comint-input-ring-index 0)
             (< arg 0)
             comint-stored-incomplete-input)
        (comint-restore-input)
      (unless (and (eq comint-input-ring-index
                       (- (ring-length comint-input-ring) 1))
                   (> arg 0))
        (comint-previous-matching-input "." arg)))))

(defun my-clear-comint-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(defun my-kill-word (arg)
  (interactive "p")
  (unless buffer-read-only
    (let ((beg (point))
          (end (save-excursion (forward-word arg) (point)))
          (point (save-excursion (goto-char
                                  (if (> arg 0)
                                      (next-single-char-property-change
                                       (point) 'read-only)
                                    (previous-single-char-property-change
                                     (point) 'read-only)))
                                 (point))))
      (unless (get-char-property (point) 'read-only)
        (if (if (> arg 0) (< point end) (> point end))
            (kill-region beg point)
          (kill-region beg end))))))

(defun my-backward-kill-word (arg)
  (interactive "p")
  (my-kill-word (- arg)))

(defun my-recenter-top-bottom ()
  (interactive)
  (goto-char (point-max))
  (let ((recenter-positions '(top bottom)))
    (recenter-top-bottom)))

(with-eval-after-load 'comint
  (define-key comint-mode-map (kbd "<remap> <kill-word>") 'my-kill-word)
  (define-key comint-mode-map (kbd "<remap> <backward-kill-word>") 'my-backward-kill-word)
  (define-key comint-mode-map (kbd "C-l") 'my-recenter-top-bottom)
  (define-key comint-mode-map (kbd "C-S-l") 'my-clear-comint-buffer))

(setq compilation-scroll-output t)

;; company

(defun company-transform-js (candidates)
  (let ((methods))
    (mapcar #'(lambda (c)
                (let ((kind (plist-get (get-text-property 0 'completion c) :kind)))
                  (if (or (equal kind "method") (equal kind "property"))
                      (progn
                        (add-to-list 'methods c)
                        (setq candidates (delete c candidates))))))
            candidates)
    (append (reverse methods) candidates)))

(defun my-js-conf()
  (setq-local company-transformers
              (append company-transformers '(company-transform-js))))

(add-hook 'js2-mode-hook 'my-js-conf)

;; Configure `display-buffer' behaviour for some special buffers.
(setq
 display-buffer-alist
 `(
   ;; Put REPLs and error lists into the bottom side window
   (,(rx bos
         (or "*Help"                         ; Help buffers
             "*tide-documentation"
             "*tide-references"
             "*pt-search"
             "*Warnings*"                    ; Emacs warnings
             "*Compile-Log*"                 ; Emacs byte compiler log
             "*compilation"                  ; Compilation buffers
             "*Flycheck errors*"             ; Flycheck error list
             "*shell"                        ; Shell window
             "*powershell"                   ; SBT REPL and compilation buffer
             "*optov6-gulp*"
             "*optov6-iis-express*"
             ))
    (display-buffer-reuse-window
     display-buffer-in-side-window)
    (side            . bottom)
    (reusable-frames . visible)
    (window-height   . 0.33))
   ;; Let `display-buffer' reuse visible frames for all buffers.  This must
   ;; be the last entry in `display-buffer-alist', because it overrides any
   ;; later entry with more specific actions.
   ("." nil (reusable-frames . visible))))

(defun lunaryorn-find-side-windows (&optional side)
  "Get all side window if any.
If SIDE is non-nil only get windows on that side."
  (let (windows)
    (walk-window-tree
     (lambda (window)
       (let ((window-side (window-parameter window 'window-side)))
         (when (and window-side (or (not side) (eq window-side side)))
           (push window windows)))))
    windows))

(defun lunaryorn-quit-all-side-windows ()
  "Quit all side windows of the current frame."
  (interactive)
  (dolist (window (lunaryorn-find-side-windows))
    (when (window-live-p window)
      (quit-window nil window)
      ;; When the window is still live, delete it
      (when (window-live-p window)
        (delete-window window)))))

(global-set-key (kbd "C-c q") 'lunaryorn-quit-all-side-windows)

(use-package powershell
  :ensure t)

(use-package neotree
  :ensure t
  :bind (("<f8>" . neotree-toggle))
  :config
  (setq neo-smart-open t)
  (setq neo-theme 'nerd))

(use-package kg-javascript
  :load-path "defuns/")

(use-package helm-descbinds             ; Describe key bindings with Helm
  :ensure t
  :init (helm-descbinds-mode))

;;(setq garbage-collection-messages t)
(setq gc-cons-threshold (* 511 1024 1024))
(setq gc-cons-percentage 0.5)
(run-with-idle-timer 5 t #'garbage-collect)

(put 'erase-buffer 'disabled nil)

(setq ediff-temp-file-prefix "C:/home/.emacs.d/tmp")

;;; init.el ends here
