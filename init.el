;;; init.el --- Emacs configuration of Kim Grönqvist

;;; Commentary:

;; Emacs configuration of Kim Grönqvist.

;;; Code:

;; Please don't load outdated byte code
(setq load-prefer-newer t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)
(require 'diminish)

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

(require 'init-themes)
(require 'init-undo-tree)
(require 'init-misc)
(require 'init-sessions)
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
(require 'init-project-explorer)
(require 'init-flycheck)
(require 'init-rainbow-mode)
(require 'init-ido)

;; Stop creating auto save files
(setq auto-save-default nil)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

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

(use-package multiple-cursors
  :ensure t
  :bind (("M-ä" . mc/mark-all-dwim)
         ("C-ä" . mc/mark-next-like-this)
         ("C-å" . mc/mark-previous-like-this)
         ("C-Ä" . mc/mark-more-like-this-extended)
         ("M-å" . mc/mark-all-in-region)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

;; Undo/redo window configuration with C-c <left>/<right>
(use-package winner-mode
  :defer t
  :init (winner-mode 1))

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

(setq-default mode-line-format
              '("%e" mode-line-front-space
                ;; Standard info about the current buffer
                mode-line-mule-info
                mode-line-client
                mode-line-modified
                mode-line-remote
                mode-line-frame-identification
                mode-line-buffer-identification " " mode-line-position
                (projectile-mode projectile-mode-line)
                (vc-mode (:propertize (:eval vc-mode) face italic))
                " "
                (flycheck-mode flycheck-mode-line) ; Flycheck status
                (isearch-mode " ")
                (anzu-mode (:eval                  ; isearch pos/matches
                            (when (> anzu--total-matched 0)
                              (anzu--update-mode-line))))
                (multiple-cursors-mode mc/mode-line) ; Number of cursors
                ;; And the modes, which we don't really care for anyway
                " " mode-line-misc-info mode-line-modes mode-line-end-spaces)
              mode-line-remote
              '(:eval
                (when-let (host (file-remote-p default-directory 'host))
                          (propertize (concat "@" host) 'face
                                      '(italic warning))))
              ;; Remove which func from the mode line, since we have it in the
              ;; header line
              mode-line-misc-info
              (assq-delete-all 'which-func-mode mode-line-misc-info))

;;; init.el ends here
