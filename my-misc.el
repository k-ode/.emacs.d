(add-hook 'prog-mode-hook 'idle-highlight-mode)

;; Speedbar stuff
(setq sr-speedbar-right-side nil)
(setq speedbar-use-images nil)
(setq speedbar-show-unkown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq sr-speedbar-auto-refresh t)
(setq sr-speedbar-width-console 30)
(setq sr-speedbar-width-x 30)
(setq sr-speedbar-width 30)
(setq sr-speedbar-skip-other-window-p t)
(setq speedbar-indentation-width 2)
(setq speedbar-update-flag t)

;; Don't save temporary files in same directory, please
(setq temporary-file-directory "~/.emacs.d/tmp/")

;; Change window quickly with S-left and S-right
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

;; EXTRACT THIS
(defun my-csarhp-mode-fn ()
  "function that runs when cshar-mode is initialized."
  (setq c-basic-offset 4)
  (use-local-map nil)
  (c-set-offset 'substatement-open 0))
(add-hook 'csharp-mode-hook 'my-csarhp-mode-fn t)

(provide 'my-misc)
