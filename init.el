;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(let ((default-directory "~/.emacs.d/site-lisp/"))
      (normal-top-level-add-subdirs-to-load-path))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Stop creating auto save files
(setq auto-save-default nil)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Version control is really slow windows, so disable 
;; (setq vc-handled-backends nil)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'setup-package)
(require 'sane-defaults)

;; Setup extensions
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'org '(require 'setup-org))
;; Load slime-js when asked for
(autoload 'slime-js-jack-in-browser "setup-slime-js" nil t)
(autoload 'slime-js-jack-in-node "setup-slime-js" nil t)
(require 'setup-dired)
(require 'setup-ido)
(require 'setup-hippie)
(require 'setup-yasnippet)

;; Map files to modes
(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'multiple-cursors)
(require 'rainbow-mode)
(require 'idomenu)

;; Setup key bindings
(require 'key-bindings)

(require 'appearance)
(require 'my-misc)
