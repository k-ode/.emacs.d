(require 'project-explorer)

(require 'projectile)
(projectile-global-mode)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c p" "C-c r" "C-c m"))
(guide-key-mode 1)

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
