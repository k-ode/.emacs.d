;;; init.el --- Emacs configuration of Kim Grönqvist

;;; Commentary:

;; Emacs configuration of Kim Grönqvist.

;;; Code:

;; Please don't load outdated byte code
(setq load-prefer-newer t)

(require 'server)
(setq server-use-tcp t)
(defun server-ensure-safe-dir (dir) "Noop" t) 
(unless (server-running-p)
  (server-start))

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
(add-to-list 'load-path lisp-dir)
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path user-custom-dir)

;; Keep emacs custom-settings in separate file
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load custom-file)

;; Load tern dir
(setq tern-dir
      (expand-file-name "tern/emacs" user-emacs-directory))
(add-to-list 'load-path tern-dir)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)
;; Don't need text in scratch
(setq initial-scratch-message "")

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(setq electric-indent-mode nil)

(define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

(setq debug-on-error nil)

;; Wanna use enter as newline and indent in programming modes
(add-hook 'prog-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline-and-indent)
            (local-set-key (kbd "<S-return>") 'newline)))

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

;; Save point position between sessions
(use-package saveplace
  :init (setq-default save-place t)
  :config (setq save-place-file (expand-file-name ".places" user-emacs-directory)))

(require 'setup-shell)
(require 'init-smartparens)

;; Setup extensions
(eval-after-load 'org '(require 'init-org))

(require 'init-html)
(require 'init-dired)
(require 'init-hippie)
(require 'init-yasnippet)

(use-package idomenu
  :ensure t)

(use-package beacon
  :ensure t
  :init (beacon-mode 1)
  :diminish beacon-mode)

(use-package expand-region              ; Expand region by semantic units
  :ensure t
  :bind (("C-c v" . er/expand-region)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)
         ("C-c o <SPC>" . mc/vertical-align-with-space)
         ("C-c o a"     . mc/vertical-align)
         ("C-c o e"     . mc/mark-more-like-this-extended)
         ("C-c o h"     . mc/mark-all-like-this-dwim)
         ("C-c o l"     . mc/edit-lines)
         ("C-c o n"     . mc/mark-next-like-this)
         ("C-c o p"     . mc/mark-previous-like-this)
         ("C-c o r"     . vr/mc-mark)
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
  :bind (("<C-S-up>" . move-text-up)
         ("<C-S-down>" . move-text-down)))

(put 'scroll-left 'disabled nil)

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

(use-package company-statistics         ; Sort company candidates by statistics
  :ensure t
  :defer t
  :init (with-eval-after-load 'company
          (company-statistics-mode)))

(use-package anzu                       ; Position/matches count for isearch
  :ensure t
  :init (global-anzu-mode)
  :config (setq anzu-cons-mode-line-p nil)
  :diminish anzu-mode)

(use-package magit                      ; The one and only Git frontend
  :ensure t
  :bind (("C-c g c" . magit-clone)
         ("C-c g s" . magit-status)
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
  :bind
  (("C-c s %" . highlight-symbol-query-replace)
   ("C-c s n" . highlight-symbol-next-in-defun)
   ("C-c s p" . highlight-symbol-prev-in-defun))
  ;; Navigate occurrences of the symbol under point with M-n and M-p, and
  ;; highlight symbol occurrences
  :init
  (dolist (fn '(highlight-symbol-nav-mode highlight-symbol-mode))
    (add-hook 'prog-mode-hook fn))
  :config
  (setq highlight-symbol-idle-delay 0.4     ; Highlight almost immediately
        highlight-symbol-on-navigation-p t) ; Highlight immediately after
                                        ; navigation
  :diminish highlight-symbol-mode)

(use-package helm-ag
  :ensure t
  :bind (("C-c s p" . helm-projectile-ag))
  :defer t)

(use-package ibuffer                    ; Better buffer list
  :bind (([remap list-buffers] . ibuffer))
  ;; Show VC Status in ibuffer
  :config
  (setq ibuffer-formats
        '((mark modified read-only vc-status-mini " "
                (name 18 18 :left :elide)
                " "
                (size 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " "
                (vc-status 16 16 :left)
                " "
                filename-and-process)
          (mark modified read-only " "
                (name 18 18 :left :elide)
                " "
                (size 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " " filename-and-process)
          (mark " " (name 16 -1) " " filename))))

(use-package ibuffer-vc                 ; Group buffers by VC project and status
  :ensure t
  :defer t
  :init (add-hook 'ibuffer-hook
                  (lambda ()
                    (ibuffer-vc-set-filter-groups-by-vc-root)
                    (unless (eq ibuffer-sorting-mode 'alphabetic)
                      (ibuffer-do-sort-by-alphabetic)))))

(use-package ibuffer-projectile         ; Group buffers by Projectile project
  :ensure t
  :disabled t
  :defer t
  :init (add-hook 'ibuffer-hook #'ibuffer-projectile-set-filter-groups))

(use-package ace-window                 ; Fast window switching
  :ensure t
  :bind (("C-c w w" . ace-window)))

(use-package ignoramus                  ; Ignore uninteresting files everywhere
  :ensure t
  :config 
  (ignoramus-setup))

(use-package avy-jump                   ; Jump to characters in buffers
  :ensure avy
  :bind (("C-c j w" . avy-goto-word-1)
         ("C-c j l" . avy-goto-line)
         ("C-c j b" . avy-pop-mark)
         ("C-c j j" . avy-goto-char-2)))

(use-package newcomment                 ; Built-in comment features
  :bind (("C-c c d" . comment-dwim)
         ("C-c c l" . comment-line)
         ("C-c c r" . comment-region)))

(use-package elisp-mode                 ; Emacs Lisp editing
  :defer t
  :interpreter ("emacs" . emacs-lisp-mode)
  :bind (:map emacs-lisp-mode-map
              ("C-c m e r" . eval-region)
              ("C-c m e b" . eval-buffer)
              ("C-c m e e" . eval-last-sexp)
              ("C-c m e f" . eval-defun)))

(use-package prodigy
  :ensure t
  :defer t
  :config
  
  (prodigy-define-service
   :name "OptoWebsite Gulp"
   :command "gulp"
   :cwd "c:/opto/ConrabInternalApplications/trunk/OptoWebsite/OptoWebsite"
   :tags '(work)
   :kill-signal 'sigkill
   :kill-process-buffer-on-stop t)

  (prodigy-define-service
   :name "OptoV6 Webpack"
   :command "npm"
   :args '("run" "dev")
   :cwd "c:/opto/Core/Code/ServerHtml5/Web"
   :tags '(work)
   :kill-signal 'sigkill
   :kill-process-buffer-on-stop t)

  (prodigy-define-service
   :name "Mongodb"
   :command "mongod"
   :args '("-dbpath" "C:/home/bin/mongodb")
   :cwd "C:\home\bin\mongodb"
   :tags '(work)
   :kill-signal 'sigkill
   :kill-process-buffer-on-stop t)
  )

(use-package wgrep
  :ensure t)

(use-package markdown-mode
  :ensure t
  :defer t
  :config
  (setq markdown-command "pandoc"))

(use-package web-mode
  :ensure t
  :defer t
  :config
  (setq web-mode-indent-style 4))

;;; init.el ends here
