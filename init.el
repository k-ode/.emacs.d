(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun)))

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

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(load custom-file)

;; Setup packages
(require 'setup-package)

(require 'init-themes)
(require 'init-gui-frames)
(require 'init-editing-utils)
(require 'init-misc)
(require 'init-sessions)
(require 'init-locales)
(require 'init-windows)
(require 'init-modeline)
(require 'init-uniquify)
(require 'init-org)
(require 'init-lisp)
(require 'init-css)
(require 'init-csharp)
(require 'init-company)
(require 'init-project)

;; Stop creating auto save files
(setq auto-save-default nil)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require-package 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'setup-shell)
(require 'setup-smartparens)

;; Setup extensions
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'json-mode '(require 'setup-json-mode))
(eval-after-load 'org '(require 'setup-org))
;; Autoload skewer when asked for
(autoload 'skewer-start "setup-skewer" nil t)
;;(autoload 'skewer-demo "setup-skewer" nil t)

(require 'setup-html-mode)
(require 'setup-js-mode)
(require 'setup-dired)
(require 'setup-ido)
(require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-flycheck)
(require 'setup-css)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require-package 'multiple-cursors)
(require-package 'idomenu)

;; Setup key bindings
(require 'init-keys)

(put 'scroll-left 'disabled nil)
