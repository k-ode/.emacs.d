(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    (default)))
 '(frame-brackground-mode (quote dark))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "elpa" "node_modules")))
 '(grep-find-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.bak" "*.obj" "*.map" "*.ico" "*.pif" "*.lnk" "*.a" "*.ln" "*.blg" "*.bbl" "*.dll" "*.drv" "*.vxd" "*.386" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*.cache")))
 '(org-replace-disputed-keys t t)
 '(org-src-fontify-natively t t)
 '(package-selected-packages
   (quote
    (neotree doom-themes helm-flycheck powershell tide whitespace-cleanup-mode spaceline eslint-fix jade csharp-mode which-key wgrep web-mode use-package undo-tree tagedit smooth-scrolling smartparens scss-mode restclient rainbow-mode pt move-text material-theme markdown-mode magit less-css-mode json-mode js2-refactor ignoramus idomenu ibuffer-vc hydra highlight-symbol helm-swoop helm-projectile helm-css-scss helm-ag flycheck f expand-region css-eldoc company-tern anzu ace-window)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-compilation-cmd . "msbuild.exe c:/Dokument/ConrabOpto/Code/OPTOV6Html5.sln //m //nologo //v:q")
     (projectile-project-compilation-cmd . "msbuild.exe c:/opto/OPTOV6/trunk/OPTOV6Html5.sln //m //nologo //v:q")
     (projectile-project-compilation-cmd . "msbuild.exe c:/opto/ConrabInternalApplications/trunk/OptoWebsite/OptoWebsite/OptoWebsite.csproj //m //nologo //v:q"))))
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 '(header-line ((t (:background "#504945" :foreground "#61ACBB" :weight normal))))
 '(markdown-header-delimiter-face ((t (:inherit font-lock-function-name-face :weight bold :height 1.0))))
 '(markdown-header-face-1 ((t (:inherit font-lock-function-name-face :weight bold :height 1.0))))
 '(markdown-header-face-2 ((t (:inherit font-lock-function-name-face :weight bold :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit font-lock-function-name-face :weight bold :height 1.0))))
 '(markdown-header-face-4 ((t (:inherit font-lock-function-name-face :weight bold :height 1.0))))
 '(markdown-header-face-5 ((t (:inherit font-lock-function-name-face :weight bold :height 1.0))))
 '(markdown-header-face-6 ((t (:inherit font-lock-function-name-face :weight bold :height 1.0))))
 '(org-document-info ((t (:foreground "#81d4fa" :height 1.0))))
 '(org-done ((t (:background "#263238" :foreground "#8bc34a" :weight normal))))
 '(org-level-1 ((t (:inherit outline-1 :background "#263238" :box nil :weight normal :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :background "#263238" :box nil :height 1.0))))
 '(org-todo ((t (:background "#263238" :foreground "#ffab91" :weight normal))))
 '(which-func ((t (:foreground "#A89984")))))
