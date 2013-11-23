;;(require 'auto-complete-config)
;;(ac-config-default)
;;(setq-default ac-auto-start nil)
;;(setq-default ac-dwim t)

;; Yasnippets, always
(eval-after-load "yasnippet"
  '(setq-default ac-sources (append '(ac-source-yasnippet) ac-sources)))

(require 'project-explorer)

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
