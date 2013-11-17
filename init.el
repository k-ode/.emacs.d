;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun)))

(setq is-windows (equal system-type 'windows-nt))
(setq is-linux (equal system-type 'gnu/linux))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

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

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Setup packages
(require 'setup-package)

;;(require 'dash)

;;(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
;;  (package-refresh-contents))

;; (defun packages-install (packages)
;;   (--each packages
;; 		  (when (not (package-installed-p it))
;; 			(package-install it)))
;;   (delete-other-windows))

;; ;; Install extensions if they're missing
;; (defun init--install-packages ()
;;   (packages-install
;;    '(ace-jump-mode   
;;      browse-kill-ring   
;;      cl-lib             
;;      coffee-mode        
;;      csharp-mode        
;;      css-eldoc          
;;      dash                 
;;      diminish           
;;      epl                  
;;      es-lib             
;;      expand-region      
;;      f                  
;;      flx                
;;      flx-ido              
;;      flycheck           
;;      git-commit-mode    
;;      git-rebase-mode    
;;      ido-at-point       
;;      ido-ubiquitous     
;;      ido-vertical-mode  
;;      idomenu            
;;      js2-mode           
;;      js2-refactor       
;;      less-css-mode      
;;      markdown-mode      
;;      multi              
;;      multiple-cursors   
;;      php-mode           
;;      pkg-info           
;;      popup              
;;      project-explorer   
;;      projectile         
;;      rainbow-mode         
;;      s                  
;;      scss-mode          
;;      simple-httpd       
;;      simplezen          
;;      skewer-mode        
;;      smart-forward      
;;      smartparens        
;;      smex               
;;      smooth-scrolling   
;;      solarized-theme    
;;      tagedit            
;;      undo-tree          
;;      yasnippet          
;;      zenburn-theme)))

;; (condition-case nil
;;     (init--install-packages)
;;   (error
;;    (package-refresh-contents)
;;    (init--install-packages)))

(require 'appearance)
(require 'setup-shell)
(require 'sane-defaults)
(require 'setup-smartparens)

;; Setup extensions
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
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

;; Map files to modes
(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'multiple-cursors)
(require 'idomenu)

;; Setup key bindings
(require 'key-bindings)

(require 'my-misc)
(put 'scroll-left 'disabled nil)
